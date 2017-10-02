package com.fz.mobile.controller;

import com.fz.mobile.mapper.MNewAddressMapper;
import com.fz.mobile.mapper.MShoppingAddressMapper;
import com.fz.model.Address;
import com.fz.model.Customer;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by David on 2017/7/17.
 */
@Controller
@RequestMapping("/mobile/person")
public class MNewAddress {
    @Autowired
    private MNewAddressMapper adddao;
    @Autowired
    private MShoppingAddressMapper msdao;

    @RequestMapping("/save") @Transactional
    public String  save(HttpServletRequest req,@Param("receiver") String receiver,@Param("phone") String phone,@Param("address") String address,@Param("add") String add) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("custId",((Customer)(req.getSession().getAttribute("customer"))).getId());
        map.put("receiver",receiver);
        map.put("address",address+"   "+ add);
        map.put("phone",phone);
        if(msdao.count(((Customer)(req.getSession().getAttribute("customer"))).getId())<= 0){
            map.put("state",1);
        }else {
            map.put("state",0);
        }
        int i = adddao.save(map);
        return "redirect:/mobile/person/show";
    }

}
