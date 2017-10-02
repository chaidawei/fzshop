package com.fz.mobile.controller;

import com.fz.mobile.mapper.MOrderMapper;

import com.fz.model.Customer;
import com.fz.model.Order;
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
 * Created by xiao zeng on 2017/7/18.
 */

@Controller
@RequestMapping("/mobile/person")
public class MorderController {

    @Autowired
    private MOrderMapper odao;


    //订单处理
    @RequestMapping("/order.action") @ResponseBody
    public ModelAndView pending(HttpServletRequest req){
        Map<String,Object> map = new HashMap<String,Object>();
        Customer ct = (Customer) req.getSession().getAttribute("customer");
        int id =  ct.getId();
        ModelAndView mo = new ModelAndView();
        String state = req.getParameter("state");
        if ("待付款".equals(state)){
            int start = 0;
            List<Map<String,Object>> li = odao.querypending(id,start);
            if (li.size()<=0){
                mo.setViewName("/mobile/page/pending/pending_none");
                return mo;
            }else {
                mo.addObject("pending", li);
                mo.setViewName("/mobile/page/pending/pending");
                return mo;
            }
        }else if ("待收货".equals(state)){
            int start = 1;
            List<Map<String,Object>> li = odao.queryreceived(id,start);
            if (li.size()<=0){
                mo.setViewName("/mobile/page/received/received_none");
                return mo;
            }else {
                mo.addObject("received",li);
                mo.setViewName("/mobile/page/received/received");
                return mo;
            }
        }else if ("退换货".equals(state)){
            int start =3;
            List<Map<String,Object>> li = odao.qureyreturned(id,start);
            if (li.size()<=0){
                mo.setViewName("/mobile/page/returned/returned_none");
                return mo;
            }else {
                mo.addObject("returned",li);
                mo.setViewName("/mobile/page/returned/returned");
                return mo;
            }
        }else if ("待评价".equals(state)){
            int start =2;
            List<Map<String,Object>> li = odao.qureyevaluation(id,start);
            if (li.size()<=0){
                mo.setViewName("/mobile/page/evaluation/evaluation_none");
                return mo;
            }else {
                mo.addObject("evaluation",li);
                mo.setViewName("/mobile/page/evaluation/evaluation");
                return mo;
            }
        } else if("我的订单".equals(state)){
           map.put("id",((Customer)req.getSession().getAttribute("customer")).getId());
            List<Order> list = odao.query(map);
            if(list.size()<=0){
                mo.setViewName("mobile/page/order/ordernone");
            }else {

                List<Map<String, Object>> ls = odao.queryOrder(((Customer)req.getSession().getAttribute("customer")).getId());
                mo.addObject("ls",ls);

                mo.setViewName("mobile/page/order/order");
            }

        }
            return mo;
    }


    //确认收货
    @RequestMapping("/confrm_receive.action")
    public String confrm_receive(HttpServletRequest req){
        Customer ct = (Customer) req.getSession().getAttribute("customer");
        int id =  ct.getId();
        int start = 2;
        int state=3;
        int pstate=1;
        int m =odao.updateconfrm_receive(id,start,state,pstate);
        if (m>=1){
            System.out.println("修改成功");
        }

        return "forward:/mobile/person/order.action?state=待收货";
    }

    //确认退货
    @RequestMapping("/Confirm_refund.action")
    public String Confirm_refund(HttpServletRequest req){
        Customer ct = (Customer) req.getSession().getAttribute("customer");
        int id =  ct.getId();
        int state= 2;
        int fstate=4;
        int pstate=0;
        int f = odao.Confirm_refund(id,fstate,state,pstate);
        if (f>=1){
            System.out.println("修改成功");
        }
        return "forward:/mobile/person/order.action?state=退换货";
    }
}
