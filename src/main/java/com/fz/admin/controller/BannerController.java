package com.fz.admin.controller;
import com.alibaba.fastjson.JSON;
import com.fz.admin.mapper.BannerMapper;
import com.fz.model.Banner;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Data
@Controller
public class BannerController {
    @Autowired
    private BannerMapper mapper;
    @Autowired
    private Banner banner;
    @RequestMapping(value = "banner_show",produces="application/text;charset=UTF-8")
    @ResponseBody
    public String banner(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding( "utf-8" );
        resp.setContentType( "text/html;charset=UTF-8" );
        List<Map<String,Object>> lii = mapper.queryAlls();
        for(Map<String,Object> li:lii){
            String name =(String)li.get( "img" );
            String src = "/upload/banner/"+name;
            li.put("img","<img style=\"width: 152px;height: 100px\" src="+src+">");
            li.put("time",li.get("time")+"");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        //存入合适的时间类型
        map.put("total", lii.size());
        map.put("data", lii);
        return JSON.toJSONString(map);
    }
    @RequestMapping(value = "banner_add",produces="text/html;charset=UTF-8")@ResponseBody
    public String  banneradd(@RequestParam("img") CommonsMultipartFile f, HttpServletResponse resp,HttpServletRequest req) throws IOException {
        //接受前台传来的值
        String gid=req.getParameter( "gid" );
        String name=req.getParameter( "name"   );
        String link=req.getParameter( "link" );
        String state=req.getParameter( "state" );
        String intime=req.getParameter( "intime" );
        String path = req.getServletContext().getRealPath("/upload/banner");  //项目根  /upload/user/ 此目录下
        System.out.println(path);
        File pa = new File(path);
        if(!pa.exists()){
            pa.mkdirs();
        }
        //用UUID给上传的文件改名字
        //String img_name=f.getOriginalFilename().substring( 0,f.getOriginalFilename().indexOf( "." )); //名字前半部分
        String img_ext=f.getOriginalFilename().substring( f.getOriginalFilename().indexOf( "." )); //后缀
        String img_name = UUID.randomUUID().toString() + img_ext;
        f.transferTo(new File(path,img_name));
        banner.setGid( Integer.parseInt( gid  ));
        banner.setName(  name);
        banner.setImg( img_name);
        banner.setLink( link );
        banner.setState( Integer.parseInt( state ) );
        banner.setInTime( intime );
        mapper.insert( banner );
        String success="提交成功";
        return success;
    }
    @RequestMapping(value = "banner_edit",produces="text/html;charset=UTF-8")@ResponseBody
    public String  banneredit(@RequestParam("img") CommonsMultipartFile f, HttpServletResponse resp, HttpServletRequest req) throws IOException {
        //接受前台传来的值
        String id=req.getParameter( "id" );
        String gid=req.getParameter( "gid" );
        String name=req.getParameter( "name"   );
        String link=req.getParameter( "link" );
        String state=req.getParameter( "state" );
        String intime=req.getParameter( "intime" );
        String path = req.getServletContext().getRealPath("/upload/banner");  //项目根  /upload/user/ 此目录下
        System.out.println(path);
        File pa = new File(path);
        if(!pa.exists()){
            pa.mkdirs();
        }
        //用UUID给上传的文件改名字
        //String img_name=f.getOriginalFilename().substring( 0,f.getOriginalFilename().indexOf( "." )); //名字前半部分
        String img_ext=f.getOriginalFilename().substring( f.getOriginalFilename().indexOf( "." )); //后缀
        String img_name = UUID.randomUUID().toString() + img_ext;
        f.transferTo(new File(path,img_name));
        banner.setId( Integer.parseInt( id  ));
        banner.setGid( Integer.parseInt( gid  ));
        banner.setName(name);
        banner.setImg(img_name);
        //删除原来的图片
         String old_img_name=mapper.queryById( Integer.parseInt( id ) ).getImg();
        File old_img = new File(path, old_img_name);
        if (old_img.exists()) {
            old_img.delete();
        }
        banner.setLink( link );
        banner.setState( Integer.parseInt( state ) );
        banner.setInTime( intime );
        mapper.updateById( banner );
        String success="编辑成功";
        return success;
    }
    @RequestMapping("banner_delete")
    public void delete(HttpServletResponse resp, HttpServletRequest req){
        String id  = req.getParameter("id");
        String[] i = id.split(",");
        String path = req.getServletContext().getRealPath("/upload/banner");  //项目根  /upload/user/ 此目录下
        for(int ii=0;ii<i.length;ii++){
            //删除原来的图片
            String old_img_name=mapper.queryById( Integer.parseInt(i[ii]) ).getImg();
            File old_img = new File(path,old_img_name);
            if (old_img.exists()) {
                old_img.delete();
            }
            //删除数据库的数据
            mapper.delById(Integer.parseInt(i[ii]));

        }
    }
}
