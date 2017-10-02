package com.fz.mobile.controller;

import com.fz.mobile.mapper.*;
import com.fz.model.Customer;
import com.fz.model.GoodsImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * Created by Wei Yinghang on 2017/7/17.
 */
@Component
@RequestMapping("/mobile/home")
public class MGoodsController {
    @Autowired
    private MGoodsMapper goodsMapper;
    @Autowired
    private MGoodsImgMapper goodsImgMapper;
    @Autowired
    private MAppraiseMapper appraiseMapper;
    @Autowired
    private MCartMapper cartMapper;

    @RequestMapping(value = "/goodsdetails/{id}")
    public ModelAndView goodsDetails(@PathVariable String id,HttpServletRequest req) {
        System.out.println(id);
        ModelAndView mv = new ModelAndView("/mobile/page/type/goodsdetails");
        Map<String, Object> goods = goodsMapper.queryGoodsDetails(id);
        List<Map<String, Object>> appr = appraiseMapper.queryAppr(id, "2", 0);
        List<GoodsImg> goodsImgs = goodsImgMapper.queryGoodsImg(id);
        int n = appraiseMapper.queryRow(id, 5);
        int i = appraiseMapper.queryRow(id, -1);
        String s = new DecimalFormat("0.0").format((float) n / i * 100);
        int num=0;
        if (req.getSession().getAttribute("customer") != null) {
            Customer c = (Customer) req.getSession().getAttribute("customer");
            num = cartMapper.showCartNumByUserId(c.getId()).size();
        }
        mv.addObject("goods", goods);
        mv.addObject("goods_appr", appr);
        mv.addObject("goods_imgs", goodsImgs);
        mv.addObject("i", i);
        mv.addObject("n", s + "%");
        mv.addObject("num", num);
        return mv;
    }

    @RequestMapping(value = "/comment/{id}/{page}")
    public ModelAndView comment(@PathVariable String id, @PathVariable int page) {
        ModelAndView mv = new ModelAndView("/mobile/page/type/comment");
        List<Map<String, Object>> apprs = appraiseMapper.queryAppr(id, null, (page - 1) * 5);
        //全部
        int a = appraiseMapper.queryRow(id, -1);
        //好评
        int b = appraiseMapper.queryRow(id, 5);
        //差评
        int d = appraiseMapper.queryRow(id, 3);
        int c = a - b - d;
        //总页数每页5条
        int pageCount = (int) Math.ceil(a / (5 * 1.00));
        mv.addObject("apprs", apprs);
        mv.addObject("a", a);
        mv.addObject("b", b);
        mv.addObject("c", c);
        mv.addObject("d", d);
        mv.addObject("p", pageCount);
        mv.addObject("gid", id);
        mv.addObject("pn", page);
        int pre = 1;
        int next = pageCount;
        if (page - 1 >= 1) {
            pre = page - 1;
        }
        if (page + 1 <= pageCount) {
            next = page + 1;
        }
        mv.addObject("pre", pre);
        mv.addObject("next", next);
        return mv;
    }

    @RequestMapping(value = "addCollection", method = RequestMethod.GET)
    @ResponseBody
    public Object addCollection(String id, int s) {
        String result = "{\"error\":\"0\"}";
        if ("lisi" != null) {
            if (s == 0) {
                System.out.println("收藏成功");
            } else {
                System.out.println("取消收藏");
            }
        } else {
            result = "{\"error\":\"2\"}";
        }
        return result;
    }

    @RequestMapping(value = "addToCart")
    @ResponseBody
    public Object addToCart(int id, int num, String p, HttpServletRequest req) {
        String result = "{\"error\":\"0\"}";
        if (req.getSession().getAttribute("customer") != null) {
            Customer c = (Customer) req.getSession().getAttribute("customer");
            List<Map<String, Object>> list = cartMapper.showCartNumByUserId(c.getId());
            int s=list.size();
            int i;
            boolean f = false;
            if (s != 0) {
                for (Map<String, Object> m : list) {
                    if (m.get("id").equals(id)) {
                        f = true;
                        break;
                    }
                }
            }
            if (f) {
                i = cartMapper.updateGoodNum(id, num, c.getId());
                if (i == 1) {
                    result = "{\"error\":\"" + s + "\"}";
                }
            } else {
                i = cartMapper.insertGoods(c.getId(), id, p, num, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                if (i == 1) {
                    s++;
                    result = "{\"error\":\"" + s + "\"}";
                }
            }
        } else {
            result = "{\"error\":\"no\"}";
        }
        return result;
    }
}
