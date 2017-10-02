package com.fz.mobile.controller;


import com.alibaba.fastjson.JSONObject;
import com.fz.Util.ShopUtil;
import com.fz.mobile.mapper.MCustomerMapper;
import com.fz.mobile.mapper.MOrderMapper;
import com.fz.mobile.mapper.MShoppingAddressMapper;
import com.fz.model.Customer;
import com.fz.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by bai on 2017/7/17.
 */
@Controller
@RequestMapping("/mobile/person")
public class MPersonCenterController {
    boolean fal;

    @Autowired
    private MOrderMapper om;
    @Autowired
    private MCustomerMapper mm;
    @Autowired
    MShoppingAddressMapper msam;
    @Autowired
    MCustomerMapper mcm;


    @RequestMapping("/personCenter.do")
    public String personCentero(HttpServletRequest req){

       HttpSession session = req.getSession();
       if(session.getAttribute("customer")==null){
           return "redirect:mobile/page/home/login.html";
       }else {
           return "redirect:/mobile/page/user/person-center.jsp";
       }

    }

    //我的订单（总）
    @RequestMapping("/order.do")
    @ResponseBody
    public Object personCenter(HttpServletRequest req) {
        int nopay = 0;//待付款
        int pay = 0;//已支付
        int cle = 0;//已取消
        int ok = 0;//已完成
        int nofh = 0;//未发货
        int yfh = 0;//已发货
        int ysh = 0;//已收货
        int thh = 0;//退换货
        Map<String, Object> map = new HashMap<String, Object>();
        Customer cm = (Customer) req.getSession().getAttribute("customer");
        map.put("id", cm.getId());
        List<Order> list = om.query(map);
        for (Order o : list) {
            if (o.getState() == 0) {//待付款f
                nopay++;
            }
            if (o.getState() == 1) {//已支付
                pay++;
            }
            if (o.getState() == 2) {//已取消
                cle++;
            }
            if (o.getState() == 3) {//已完成
                ok++;
            }
            if (o.getFhStatus() == 0) {//未发货
                nofh++;
            }
            if (o.getFhStatus() == 1) {//已发货
                yfh++;
            }
            if (o.getFhStatus() == 2) {//已收货
                ysh++;
            }
            if (o.getFhStatus() == 3 || o.getFhStatus() == 4) {//退换货
                thh++;
            }
        }
        Map<String, Object> ma = new HashMap<String, Object>();
        ma.put("nopay", nopay);
        ma.put("pay", pay);
        ma.put("cle", cle);
        ma.put("ok", ok);
        ma.put("nofh", nofh);
        ma.put("yfh", yfh);
        ma.put("ysh", ysh);
        ma.put("thh", thh);
        return JSONObject.toJSON(ma);
    }

    @RequestMapping(value = "/personal.data",method = RequestMethod.POST) @ResponseBody
    public String personalData(HttpServletRequest req){
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String ms="";
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("id",((Customer)(req.getSession().getAttribute("customer"))).getId());
        map.put("cname",name);
        map.put("cemail",email);
        int i = mm.change(map);
        if(i>0){
            ms="您的数据修改成功,是否返回个人中心？";
        }else {
            ms="您的数据修改失败,是否返回个人中心？";
        }
        return ms;
    }

    @RequestMapping("/loginout.do")
    public String loginOut(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.removeAttribute("customer");

        return "redirect:/mobile/page/home/login.html";
    }

    //编辑收货地址
    @RequestMapping("/changeAddress.do")@ResponseBody
    public ModelAndView changeAddress(HttpServletRequest req){
        ModelAndView mv = new ModelAndView();
        HttpSession session = req.getSession();
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String id = req.getParameter("id");
        int custid = ((Customer)session.getAttribute("customer")).getId();
        mv.addObject("name",name);
        mv.addObject("address",address);
        mv.addObject("phone",phone);
        mv.addObject("id",custid);
        mv.addObject("aid",id);
        mv.setViewName("/mobile/page/user/editor-shopping-address");
        return mv;
    }
    //修改收货地址
    @RequestMapping("/changeAddress.action")
    public String changeAdd(HttpServletRequest req){
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String addr = req.getParameter("addr");
        int id = Integer.parseInt(req.getParameter("id"));
        //String id = req.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        map.put("receiver",name);
        map.put("phone",phone);
        map.put("address",address+"   "+addr);
        map.put("id",id);
        int i = msam.changeAddress(map);
        return "redirect:/mobile/person/show";
    }
    //密码修改
    @RequestMapping(value = "/changePass.do",produces="text/html;charset=UTF-8") @ResponseBody
    public String  changePass(HttpServletRequest req) throws UnsupportedEncodingException {

        Map<String,Object> map = new HashMap<>();
        String oldpass=req.getParameter("oldpass");
        String newpass=req.getParameter("newpass");
        String apass= req.getParameter("apass");
        if((mcm.queryPass(((Customer)req.getSession().getAttribute("customer")).getId()).equals(ShopUtil.md5(oldpass)))&&newpass.trim().equals(apass.trim())){
            map.put("cpassword",ShopUtil.md5(newpass));
            map.put("id",((Customer)req.getSession().getAttribute("customer")).getId());
            int i = mcm.change(map);
            if(i>0){
                return "修改成功";
            }else {
                return "修改失败";
            }

        }else {
            return "修改失败";
        }


    }



}
