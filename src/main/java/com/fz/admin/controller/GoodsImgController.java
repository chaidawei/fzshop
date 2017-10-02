package com.fz.admin.controller;

import com.fz.admin.mapper.GoodsImgMapper;
import com.fz.model.GoodsImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/7/18.
 */
@Controller
public class GoodsImgController {
    @Autowired
    private GoodsImgMapper goim;

    @RequestMapping("/ad_goodsimg_delete")  @ResponseBody
    public void delete(HttpServletResponse resp, HttpServletRequest req){
        String id = req.getParameter("id");
        int i = goim.delById(Integer.parseInt(id));

        String path = req.getServletContext().getRealPath("/upload/goods/");  //项目根  /upload/user/ 此目录下
        File ffff = new File(path, req.getParameter("name"));
        if (ffff.exists()) {
            ffff.delete();
        }
    }
    @RequestMapping("/ad_goodsimg_save")
    public String upload(@RequestParam("logo") List<CommonsMultipartFile> fs, HttpServletResponse resp, HttpServletRequest req)throws Exception {
        String path = req.getServletContext().getRealPath("/upload/goods/");  //项目根  /upload/user/ 此目录下
        File pa = new File(path);
        if(!pa.exists()){
            pa.mkdirs();
        }
        for(CommonsMultipartFile cmf:fs){
            int id = Integer.parseInt(req.getParameter("id"));
            String nn = UUID.randomUUID().toString() + ".jpg";
            cmf.transferTo(new File(path,nn));
            GoodsImg gi = new GoodsImg();
            gi.setImg(nn);
            gi.setGid(id);
            goim.save(gi);
        }
        return "redirect:/admin/page/goods/goods.jsp";
    }
}
