package com.fz.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fz.admin.mapper.ProClassMapper;
import com.fz.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by webrx on 2017/7/14.
 */
@Controller
public class ShopClass {
    @Autowired
    private ProClassMapper pclass;

     /* 列表初始*/
    @RequestMapping(value = "/ad_class_query.do",produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String query(){
       /* ModelAndView mv = new ModelAndView("admin/page/class/class");
        List<Class> list = pclass.queryAll();
        mv.addObject("list",list);
        return mv;*/

      List<Class> list = pclass.queryAll();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("total", list.size());
        map.put("data", list);
        return JSON.toJSONString(map);
    }

    /* 商品添加分类时*/
    @RequestMapping(value = "/ad_class_queryNoPage.do",produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String queryNoPage(){
        List<Class> list = pclass.queryAll();
        return JSON.toJSONString(list);
    }

    @RequestMapping("/ad_class_queryById") @ResponseBody
    public String queryById(int id){
        Class c = pclass.selectByPid(id);
        String name = c.getName();
        return name;
    }

    /*添加小分类*/
    @RequestMapping("/ad_class_add.do")
    public String add( HttpServletRequest req){
        String name =req.getParameter("name");
        String pid =req.getParameter("pid");

        if(name==null||"".equals(name.trim())){

            return "redirect:/admin/page/class/class_add.jsp";
        }else {

           int pid02 =Integer.parseInt(pid);
           Class cl = pclass.selectByPid(pid02);
           String path =cl.getPath().toString();
            String path02 = path+pid+",";

            System.out.println(path02);
            System.out.println(name);

            Class cla = new Class();
            cla.setName(name);
            cla.setPath(path02);
            cla.setPid(pid02);
            int nn = pclass.insert(cla);
            return "redirect:/admin/page/class/class.jsp";
        }
    }
    /*添加大分类*/
    @RequestMapping("/ad_class_add02.do")
    public String add02( HttpServletRequest req){
        String name =req.getParameter("name");
        if(name==null||"".equals(name.trim())){

            return "redirect:/admin/page/class/class.jsp";
        }else {
            Class cla = new Class();
            cla.setName(name);
            cla.setPath("0,");
            cla.setPid(0);
            int nn = pclass.insert(cla);
            return "redirect:/admin/page/class/class.jsp";
        }
    }

     /* 删除数据*/
    @RequestMapping("/ad_class_delete.do")  @ResponseBody
    public void delete(HttpServletRequest req) {
        String idd =req.getParameter("id");
        int id =Integer.parseInt(idd);
        System.out.println(idd);
        pclass.delete(id);

    }
    /*添加小分类时要的父类的信息*/
    @RequestMapping("/ad_class_delete02.do")
    public ModelAndView delete02( ) {
       ModelAndView mv = new ModelAndView("admin/page/class/class_add");

        List<Class> list = pclass.queryAll();

        mv.addObject("list",list);
        return mv;

    }
   /* 修改获取对象*/
    @RequestMapping("/ad_class_update.do") @ResponseBody
    public String update( int id) {

        Class cl = pclass.selectByPid(id);
        return JSON.toJSONString(cl);
    }
   /* 修改接收保存*/
    @RequestMapping("/ad_class_update02.do") @ResponseBody
    public void update02(HttpServletRequest req) {
        String id= req.getParameter("data");
            System.out.println(id);

        JSONObject go = JSONObject.parseObject(id);

        //json的数组形式
        //JSONArray ar = JSONArray.parseArray(id);
        int id1 =go.getInteger("id");
        String name =go.getString("name");
        int pid = go.getInteger("pid");
        String path  =go.getString("path");
        Class cc = new Class();
        cc.setId(id1);
        cc.setPid(pid);
        cc.setName(name);
        cc.setPath(path);
       pclass.update(cc);
        //return "修改成功";
    }

}
