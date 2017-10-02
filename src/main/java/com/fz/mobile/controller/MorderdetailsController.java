package com.fz.mobile.controller;

import ch.qos.logback.access.servlet.TeeHttpServletResponse;
import com.fz.mobile.mapper.MOrderDetailMapper;
import com.fz.model.Address;
import com.fz.model.Customer;
import com.fz.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by xiao zeng on 2017/7/19.
 */

@Controller
@RequestMapping("/mobile/person")
public class MorderdetailsController {

    @Autowired
    private MOrderDetailMapper  dedao;

    @RequestMapping("/orderdetail.action")
    public ModelAndView queryDetail(HttpServletRequest req){

        Customer ct = (Customer) req.getSession().getAttribute("customer");
        int id =  ct.getId();
        String onum = req.getParameter("onum");
        ModelAndView mo = new ModelAndView();
        List<Map<String,Object>> li = dedao.querydetails(id,onum);
        List<Address> add = dedao.queryaddress(id);
        mo.addObject("details",li);//查询商品
        mo.addObject("address",add);//查询订单地址



        List<Map<String,Object>> orders = dedao.queryorder(id,onum);//订单状态查询
        int state = 0;
        double money = 0;
        String orderstate = "";
        for (Map<String,Object> or :orders){
            state = (Integer) or.get("state");
            money = ((BigDecimal)or.get("total")).doubleValue();
        }

        if (state==0){
             orderstate="待付款";
        }else if (state==1){
            orderstate = "已支付";
        }else if (state==2){
            orderstate = "已取消";
        }else if (state==3){
            orderstate="已完成";
        }
        mo.addObject("orderstate",orderstate);
        mo.addObject("money",money);
        mo.addObject("order",orders);


        //查询订单id
        int ordid =  dedao.queryid(id,onum);
        mo.addObject("orderid",ordid);
        mo.setViewName("/mobile/page/order/order_details");

        return mo;
    }



    //取消订单
    @RequestMapping(value = "cancelorder.action",produces = "text/html;charset=utf-8") @ResponseBody
    public String cancelorder(HttpServletRequest req ){
        int orderid = Integer.parseInt(req.getParameter("ordid"));
        int or = dedao.updatecancelorder(orderid);
        if (or>=1){
            return "订单已取消";
        }
        return "修改失败";
    }
}
