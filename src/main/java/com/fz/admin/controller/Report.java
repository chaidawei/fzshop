package com.fz.admin.controller;

import com.fz.admin.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yinuo on 2017/7/16.
 */
@Controller
@RequestMapping("/admin/page/report/")
public class Report {
    @Autowired
    OrderMapper orderMapper;

    @RequestMapping(value = "order", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Object order(HttpServletRequest req) {
        String ss = req.getParameter("query");
        String key = req.getParameter("key");
        String date1 = req.getParameter("date1");
        List<Map> li = null;
        if ("queryOrder".equals(ss)) {
            if (date1 !=null){
                li = orderMapper.queryOrder("",date1);
            }else if (key !=null) {
                li = orderMapper.queryOrder(key,"");
            }else {
                li = orderMapper.queryOrder("","");
            }
            for (Map m : li) {
                int a = Integer.parseInt(m.get("state").toString());
                if (a == 0) m.put("state", "待付款");
                if (a == 1) m.put("state", "已支付");
                if (a == 2) m.put("state", "已取消");
                if (a == 3) m.put("state", "已完成");
            }
        }else if("queryMonthOrder".equals(ss)){
            if (date1 !=null){
                li = orderMapper.queryMonthOrder("",date1);
            }else if (key !=null) {
                li = orderMapper.queryMonthOrder(key,"");
            }else {
                li = orderMapper.queryMonthOrder("","");
            }
        }
        Map<String, Object> json = new HashMap<String, Object>();
        json.put("total", li.size());
        json.put("data", li);
        return json;
    }
}
