package com.fz.mobile.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fz.mobile.mapper.MCartMapper;
import com.fz.model.Customer;
import com.fz.model.Order;
import com.fz.model.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Lxy on 2017/7/17.
 */
@Controller
@RequestMapping("/mobile/person/")
public class MCartController {

    @Autowired
    private MCartMapper cart;
    @Autowired
    private Order o;
    @Autowired
    private OrderDetail od;

    //查询数据 渲染到购物车页面
    @RequestMapping("/returnCart.html")
    public ModelAndView returnCart(HttpServletRequest req){
        Customer cus = (Customer) req.getSession().getAttribute("customer");
        int userId = cus.getId();
        ModelAndView mav = new ModelAndView();
        List<Map<String,Object>> list = cart.showCartNumByUserId(userId);
            if(list.size()>0){
            mav.setViewName("/mobile/page/cart/cart-pro");
            mav.addObject("goodsInfo",list);
        }else{
            mav.setViewName("/mobile/page/cart/cart-nopro");
        }
        return mav;
    }

    //查询商品价格和小计
    @RequestMapping("/showcart.do") @ResponseBody
    public Object showCart(int userId) throws IOException {
        List<Map<String,Object>> list = cart.showCartNumByUserId(userId);
        return JSONObject.toJSON(list);
    }

    //删除商品
    @RequestMapping("/deleteCartData.do") @ResponseBody
    public Object deleteCartData(int id){
        int isDel = cart.deleteCartDataById(id);
        return isSuccess(isDel);
    }

    //更新商品数量
    @RequestMapping("/updateNum.do") @ResponseBody
    public Object updateCartNum(int gid,int num,HttpServletRequest req){
        Customer cus = (Customer) req.getSession().getAttribute("customer");
        int userId = cus.getId();
        int isUp = cart.updateGoodNumById(gid,num,userId);
        return isSuccess(isUp);
    }

    private Object isSuccess(int is){
        Map<String,Object> map = new HashMap<String, Object>();
        if(is <=0){
            map.clear();
            map.put("type","false");
            return JSONObject.toJSON(map);
        }else{
            map.clear();
            map.put("type","true");
            return JSONObject.toJSON(map);
        }
    }


    //确认订单
    @RequestMapping("/toBalance.html")
    public ModelAndView toBalance(HttpServletRequest req){
        Customer cus = (Customer) req.getSession().getAttribute("customer");
        int userId = cus.getId();
        ModelAndView mav = new ModelAndView();
        Map<String,Object> addrMap = cart.selectCustomerAddrByUserId(userId);
        if(addrMap!=null){
            List<Map<String,Object>> list = cart.showCartNumByUserId(userId);
            mav.addObject("goodsInfo",list);
            mav.setViewName("/mobile/page/order/order-confirm");
        }else{
            mav.setViewName("/mobile/page/user/newshopping-address");
        }
        return mav;
    }

    //确认订单-查询收货地址
    @RequestMapping("/reReceiveAddr.do")
    @ResponseBody
    public Object reReceiveAddr(int userId){
        Map<String,Object> addrMap = cart.selectCustomerAddrByUserId(userId);
        return JSONObject.toJSON(addrMap);
    }

    //订单提交
    @RequestMapping("/orderSub.do")
    @ResponseBody
    @Transactional
    public Object orderSub(int addrId, String totals, String[]  ids, HttpServletRequest req){
        Customer cus = (Customer) req.getSession().getAttribute("customer");
        Random rd = new Random();
        String forRandomNum = rd.nextInt(9)+rd.nextInt(9)+rd.nextInt(9)+rd.nextInt(9)+"";
        String orderNo = "FZ"+ new SimpleDateFormat("YYYYMMddHHmmssS").format(new Date())+forRandomNum;

        //插入订单表
        int custId = cus.getId();
        String orderNum = orderNo;
        int state=0;
        double total = Double.parseDouble(totals);
        String time=new SimpleDateFormat("YYYY-MM-dd HH-mm-ss").format(new Date());
        int payStatus=0;
        int payType=2;
        String serialNo="0";
        int fzStatus=0;

        o = new Order();
        o.setCustId(custId);
        o.setAddId(addrId);
        o.setOrderNum(orderNo);
        o.setState(state);
        o.setTotal(total);
        o.setTime(time);
        o.setPayStatus(payStatus);
        o.setPayType(payType);
        o.setSerialNo(serialNo);
        o.setFhStatus(fzStatus);
        int i = cart.orderSub(o);


        int isInsert = 0;
        //插入订单详情表
        for(String id:ids){
            Map<String,Object> goodMap = cart.selectCartGoodByGoodId(custId,Integer.parseInt(id));
//            System.out.println(goodMap.get("price"));
//            BigDecimal
            BigDecimal account = (BigDecimal) goodMap.get("price");
            double price = account.doubleValue();
            od.setOrderId(o.getId());
            od.setGid(Integer.parseInt(id));
            od.setName((String) goodMap.get("name"));
            od.setNum((Integer) goodMap.get("num"));
            od.setPrice(price);
            isInsert +=cart.insertOrderDetail(od);
        }
        Map<String,Object> maps = new HashMap<String,Object>();
        if(isInsert==ids.length&&i>0){
            cart.deleteCartByUserId(custId);
            maps.clear();
            maps.put("type","true");
            maps.put("orderId",o.getId());
            return  JSONObject.toJSON(maps);
        }else{
            maps.clear();
            maps.put("type","false");
            return JSONObject.toJSON(maps);
        }
    }

    //提交成功
    @RequestMapping("/order-submit.html/{orderId}")
    public ModelAndView toSubTips(@PathVariable int orderId){
       ModelAndView mv = new ModelAndView("/mobile/page/order/order_submit");
       Map<String,Object> map = cart.selectOrderNoById(orderId);
       mv.addObject("orderNo",map);
       return mv;
    }
}
