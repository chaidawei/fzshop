package com.fz.mobile.controller;

import com.fz.mobile.mapper.MClassMapper;
import com.fz.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/mobile/home")
public class MClassController {
    @Autowired
    private MClassMapper classMapper;

    @RequestMapping("/type")
    public ModelAndView querybig() {
        ModelAndView mv = new ModelAndView("/mobile/page/type/type");
        mv.addObject("big", classMapper.querybig());
        return mv;
    }

    @RequestMapping(value = "/querysmall.do")
    @ResponseBody
    public void querysmall(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        int i = Integer.parseInt(req.getParameter("id"));
        Class cc = classMapper.querybyid(i);
        List<Class> list = classMapper.querysmall(i);
        StringBuffer ll = new StringBuffer();
        ll.append("<section class=menu-right padding-all j-content>");
        ll.append("<h5>&nbsp;&nbsp;&nbsp;" + cc.getName() + "</h5>");
        ll.append("<ul id=dd>");
        for (Class c : list) {
            ll.append("<li class=w-3><a href=/mobile/home/searchRes.html?id=" + c.getId() + "></a><img src=/mobile/images/abc.jpg ><span>" + c.getName() + "</span></li>");
        }
        ll.append("</ul>");
        ll.append("</section>");
        PrintWriter out = resp.getWriter();
        out.print(ll.toString());
    }

}

