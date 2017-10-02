package com.fz.mobile.controller;

import com.fz.mobile.mapper.MBannerMapper;
import com.fz.mobile.mapper.MGoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by Wei Yinghang on 2017/7/18.
 */
@Component
@RequestMapping("/mobile/home")
public class MIndexController {
    @Autowired
    private MGoodsMapper goodsMapper;
    @Autowired
    private MBannerMapper bannerMapper;

    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("/mobile/page/home/index");
        List<Map<String, Object>> goods = goodsMapper.queryGoods(0, 16);
        List<Map<String, Object>> banners = bannerMapper.queryAll();
        mv.addObject("goods", goods);
        mv.addObject("banners", banners);
        return mv;
    }
    @RequestMapping("/login.html")
    public void login(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/mobile/page/home/login.html").forward(req, resp);
    }
    @RequestMapping("/loginError")
    public ModelAndView loginError() {
        ModelAndView mv = new ModelAndView("/mobile/page/home/loginError");
        return mv;
    }
    @RequestMapping("/register")
    public ModelAndView register() {
        ModelAndView mv = new ModelAndView("/mobile/page/home/register");
        return mv;
    }

    @RequestMapping("/reset")
    public ModelAndView reset() {
        ModelAndView mv = new ModelAndView("/mobile/page/home/reset");
        return mv;
    }
    @RequestMapping("/search")
    public ModelAndView search() {
        ModelAndView mv = new ModelAndView("/mobile/page/home/search");
        return mv;
    }
    @RequestMapping("/searchRes")
    public ModelAndView searchRes(@RequestParam(value = "id", defaultValue = "",required = false)String id,@RequestParam(value = "key", defaultValue = "",required = false)String key) {
        ModelAndView mv = new ModelAndView("/mobile/page/type/searchResult");
        List<Map<String,Object>> goods;
        if (id.equals("")){
            goods= goodsMapper.queryGoodsByKey("%"+key+"%",0,16);
        }else{
            goods= goodsMapper.queryGoodsByClass(id,0,16);
        }
        mv.addObject("goods", goods);
        mv.addObject("id", id);
        mv.addObject("key", key);
        return mv;
    }

    @RequestMapping("/searchResMore.do")
    public void searchResMore(@RequestParam(value = "star", defaultValue = "16",required = false)int star,HttpServletResponse resp,@RequestParam(value = "id", defaultValue = "",required = false)String id,@RequestParam(value = "key", defaultValue = "",required = false)String key) throws IOException {
        resp.setCharacterEncoding("utf8");
        PrintWriter out=resp.getWriter();
        StringBuffer s = new StringBuffer();
        List<Map<String,Object>> goods;
        if (id.equals("")){
            goods= goodsMapper.queryGoodsByKey("%"+key+"%",star,16);
        }else{
            goods= goodsMapper.queryGoodsByClass(id,star,16);
        }
        for (Map<String, Object> g : goods) {
            s.append("<li><div class=\"product-div\">");
            s.append("<a class=\"product-div-link\" href=\"/mobile/home/goodsdetails/"+g.get("id")+".html\"></a>");
            s.append("<img class=\"product-list-img\" src=\"/upload/goods/"+g.get("logo")+"\">");
            s.append("<div class=\"product-text\">");
            s.append("<h4>"+g.get("name")+"</h4>");
            s.append("<p class=\"dis-box p-t-remark\"><span class=\"box-flex\">库存："+g.get("stock")+"</span></p>");
            s.append("<p><span class=\"p-price t-first \">￥"+g.get("price")+"元<small><del>￥"+g.get("oprice")+"元</del></small></span></p>");
            s.append("<a href=\"javascript:addToCart("+g.get("id")+")\" class=\"icon-flow-cart fr j-goods-attr\"><i class=\"iconfont icon-gouwuche\"></i></a>");
            s.append("</div></div></li>");
        }
        out.print(s);
    }
    @RequestMapping(value = "/indexMore",produces = "text/html;chartset=utf-8")
    public void indexMore(int size, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding("utf8");
        PrintWriter out=resp.getWriter();
        StringBuffer s = new StringBuffer();
        List<Map<String, Object>> goods = goodsMapper.queryGoods(0, 16);
        int i = 0;
        for (Map<String, Object> m : goods) {
            s.append("<div class=single_item id=more_element_1>");
            i++;
            if ((i % 2) == 0) {
                s.append("<li class=fr>");
            } else {
                s.append("<li class=fl>");
            }
            s.append("<div class=product-div>");
            s.append("<a href=/mobile/home/goodsdetails/" + m.get("id") + ".html>");
            s.append("<img class=lazy src=/upload/goods/logo/" + m.get("logo") + " alt=" + m.get("name") + ">");
            s.append("</a>");
            s.append("<a href=/mobile/home/goodsdetails/" + m.get("id") + ".html><h4>" + m.get("name") + "</h4></a>");
            s.append("<p><span>￥"+m.get("price")+"元</span></p>");
            s.append("</div></li></div>");
        }
        out.print(s.toString());
    }
}
