package com.fz.admin.controller;

import com.alibaba.fastjson.JSON;
import com.fz.admin.mapper.GoodsImgMapper;
import com.fz.admin.mapper.GoodsMapper;
import com.fz.admin.mapper.ProClassMapper;
import com.fz.model.Class;
import com.fz.model.Goods;
import com.fz.model.GoodsImg;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * Created by Administrator on 2017/7/14.
 */
@Controller
public class GoodsController {
    @Autowired
    private GoodsMapper gom;
    @Autowired
    private GoodsImgMapper goim;
    @Autowired
    private ProClassMapper pclass;

    @RequestMapping("/ad_good_baob")
    public ModelAndView baobiao(HttpServletResponse resp, HttpServletRequest req) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.250:3306/fzshop?useUnicode=true&characterEncoding=utf8&useSSL=true","admin","admin");
       //查询当前产品分类统计
        PreparedStatement pst = conn.prepareStatement("select fz_shop_class.name name,COUNT(pid) num,pid from fz_shop_goods,fz_shop_class where fz_shop_goods.class_id=fz_shop_class.id group by fz_shop_class.pid");
        ResultSet rs = pst.executeQuery();
        StringBuilder ss = new StringBuilder();
        ss.append("[");
        while(rs.next()){
            ResultSet rss = conn.prepareStatement("select name from fz_shop_class where id="+rs.getString("pid")).executeQuery();
           // String name = (String)mu.queryByField("goodsclass","name","where id="+rs.getString("pid"));
            while (rss.next()){
                String ii = String.format("[\"%s(%d)\",%d],",rss.getString(1),rs.getInt("num"),rs.getInt("num"));
                ss.append(ii);
            }
        }
        ss.replace(ss.length()-1,ss.length(),"]");
        ModelAndView mv=new ModelAndView("admin/page/overview");
        mv.addObject("baob",ss);
        return mv;
    }

    @RequestMapping("/ad_goods_queryById")
    public ModelAndView queryById(String action,int id,HttpServletResponse resp, HttpServletRequest req){
        Goods g = gom.queryById(id);
        int classid = g.getClassId();
        String classname = pclass.selectByPid(classid).getName();
        List<GoodsImg> gimg = goim.queryByPid(id);
//        ModelAndView mv=null;
//        if(action.equals("goods")){
//              mv = new ModelAndView("admin/page/goods/goods_add");
//              mv.addObject("className", classname);
//        }else if(action.equals("img")){
//            mv = new ModelAndView("admin/page/goods/goods_edit_img");
//            mv.addObject("img",gimg);
//        }
        ModelAndView mv=new ModelAndView("admin/page/goods/goods_add");
        mv.addObject("className", classname);
        mv.addObject("img",gimg);
        mv.addObject("goods",g);
        return mv;
    }

    @RequestMapping(value = "/ad_goods_queryAll",produces = {"application/text;charset=UTF-8"}) @ResponseBody
   // @RequestMapping("/ad_goods_queryAll") @ResponseBody
    public Object queryAll(HttpServletResponse resp, HttpServletRequest req){
     //  List<Goods> g = gom.queryAll();
        List<Map<String,Object>> g = gom.queryAlls();
        for(Map<String,Object> go:g){
            /**
             * 把类别对应的数字转化成对应的中文
             */
            Object ci = go.get("class_id");
            int classId =Integer.parseInt(String.valueOf(ci));
            String classname = pclass.selectByPid(classId).getName();
            go.put("className",classname);
            /**
             * 把产品状态对应的数字转化成对应的中文
             */
            Object st = go.get("state");
            int sta = Integer.parseInt(String.valueOf(st));
            if(sta==0){
                go.put("stateName","下架");
            }else if(sta ==1){
                go.put("stateName","上架");
            }else if(sta==2){
                go.put("stateName","缺货");
            }
            go.put("timetime",go.get("intime")+"");
            String name =(String)go.get("logo") ;
            String src = "/upload/goods/logo/"+name;
            go.put("zhutu","<img style=\"width: 100px;height: 100px\" src="+src+">");
        }
//        for(Goods go:g){
//          go.setLogo(pclass.selectByPid(go.getClassId()).getName());
//        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", g.size());
        map.put("data", g);
        return JSON.toJSONString(map) ;
    }

    @RequestMapping("/ad_goods_save")
    public String upload(@RequestParam("photo") List<CommonsMultipartFile> fs,@RequestParam("logo") CommonsMultipartFile f, HttpServletResponse resp, HttpServletRequest req) throws Exception {
        //产品轮播图路径
        String path = req.getServletContext().getRealPath("/upload/goods/");  //项目根  /upload/user/ 此目录下
        File pa = new File(path);
        if(!pa.exists()){
            pa.mkdirs();
        }
        //产品主图路径
        String pathz = req.getServletContext().getRealPath("/upload/goods/logo/");  //项目根  /upload/user/ 此目录下
        File paz = new File(path);
        if(!paz.exists()){
            paz.mkdirs();
        }
        //判断是新增产品，还是修改产品
        int idd = 0;
        String logo =null;
        try{
            if(req.getParameter("id").length()>0){
                idd = Integer.parseInt(req.getParameter("id"));
                if(gom.queryById(idd).getLogo()==""){
                     logo = UUID.randomUUID().toString() + ".jpg";
                    f.transferTo(new File(pathz,logo));
                }else {
                    logo=gom.queryById(idd).getLogo();
                }
            }else {
                 logo = UUID.randomUUID().toString() + ".jpg";
                f.transferTo(new File(pathz,logo));
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        Goods g = new Goods();
        String classId=null;
        try{

            if(req.getParameter("classId")==""){
                g.setClassId(2);
            }else {
                g.setClassId(Integer.parseInt(req.getParameter("classId")));
            }
        }catch (Exception e){
        }

        String name = req.getParameter("name");
//        String classId = req.getParameter("classId");
        String price = req.getParameter("price");
        String  stock= req.getParameter("stock");
        String  state= req.getParameter("state");
        String inTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String proFile= req.getParameter("proFile");
        String params = req.getParameter("params");
        String content = req.getParameter("content");

        g.setName(name);
        //g.setClassId(Integer.parseInt(classId));
        g.setPrice(Double.parseDouble(price));
        g.setOprice(Double.parseDouble(price));
        g.setStock(Integer.parseInt(stock));
        g.setSale(0);
        g.setState(Integer.parseInt(state));
        g.setInTime(inTime);
        g.setProFile(proFile);
        g.setParams(params);
        g.setContent(content);
        g.setLogo(logo);


        if(idd>1){
            g.setId(idd);
            gom.updateById(g);
        }else{
            gom.save(g);
        }

        for(CommonsMultipartFile cmf:fs){
            int id = gom.queryKey();
            String nn = UUID.randomUUID().toString() + ".jpg";
            cmf.transferTo(new File(path,nn));
            GoodsImg gi = new GoodsImg();
            gi.setImg(nn);
            gi.setGid(id);
            goim.save(gi);
        }

        return "redirect:/admin/page/goods/goods.jsp";
    }

    @RequestMapping("/ad_goods_delete") @ResponseBody
    public void delete(HttpServletResponse resp, HttpServletRequest req){
        String id  = req.getParameter("id");
        String[] i = id.split(",");
        for(int ii=0;ii<i.length;ii++){
            gom.delById(Integer.parseInt(i[ii]));
        }
    }

    @RequestMapping("/ad_goods_delImg") @ResponseBody
    public void delImg(HttpServletResponse resp, HttpServletRequest req){
        int id = Integer.parseInt(req.getParameter("id"));
        gom.delImg("",id);
        String path = req.getServletContext().getRealPath("/upload/goods/logo/");  //项目根  /upload/user/ 此目录下
        File ffff = new File(path, req.getParameter("logo"));
        if (ffff.exists()) {
            ffff.delete();
        }
    }
}
