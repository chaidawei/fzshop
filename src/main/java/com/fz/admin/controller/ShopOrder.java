package com.fz.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fz.admin.mapper.ProOrderMapper;
import com.fz.model.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by webrx on 2017/7/17.
 */
@Controller
public class ShopOrder {
    @Autowired
    private ProOrderMapper order;

     /*查询*/
    @RequestMapping("/fz_order_select.do") @ResponseBody
    public String order(){
        List<Order> list = order.queryAll();
        return JSON.toJSONString(list);
    }
      /*修改返回值*/
    @RequestMapping("/fz_order_insert01.do") @ResponseBody
    public String  insert01(HttpServletRequest req){
        String idd =req.getParameter("id");
        int id  =Integer.parseInt(idd);
        Order ord = order.selectById(id);
        return JSON.toJSONString(ord);
    }
     /*进数据库修改*/
    @RequestMapping("/fz_order_insert.do")  @ResponseBody
    public void insert(HttpServletRequest req){

        String ss = req.getParameter("data");
        System.out.println(ss);
        Order ord = new Order();

         JSONObject js = JSONObject.parseObject(ss);
        int id =js.getInteger("id");
        //int custId =js.getInteger("custId");
        int addId =js.getInteger("addId");
        //String orderNum =js.getString("orderNum");
        Double total = js.getDouble("total");
        int state = js.getInteger("state");

        int payState =js.getInteger("payStatus");
        int payType =js.getInteger("payType");
        String serialNo =js.getString("serialNo");
        int fhStatus =js.getInteger("fhStatus");

        ord.setId(id);

       // ord.setCustId(custId);
        ord.setAddId(addId);
       // ord.setOrderNum(orderNum);
        ord.setTotal(total);
        ord.setState(state);

        ord.setPayStatus(payState);
        ord.setPayType(payType);
        ord.setFhStatus(fhStatus);
        ord.setSerialNo(serialNo);
        int nn= order.updateById(ord);
        System.out.println(nn);
    }

    /* 删除数据*/
    @RequestMapping("/ad_order_delete.do")  @ResponseBody
    public void delete(HttpServletRequest req) {
        String idd =req.getParameter("id");
        int id =Integer.parseInt(idd);

        order.deleteById(id);
    }
}
