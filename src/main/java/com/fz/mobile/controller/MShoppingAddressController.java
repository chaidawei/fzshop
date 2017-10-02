package com.fz.mobile.controller;

import com.fz.mobile.mapper.MShoppingAddressMapper;
import com.fz.model.Address;
import com.fz.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by David on 2017/7/18.
 */
@Controller
@RequestMapping("/mobile/person")
public class MShoppingAddressController {
   @Autowired
    private MShoppingAddressMapper dao;



    //地址显示
    @RequestMapping("/show")
    public ModelAndView index(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        ModelAndView mv = new ModelAndView();
        int i = dao.count(customer.getId());
        if(i>0){
            List<Address> list = dao.query(customer.getId());
            mv.addObject("looks",list);
            mv.setViewName("/mobile/page/user/shopping-address");
        }else {
            mv.setViewName("/mobile/page/user/shopping-address-none");
        }

        return mv;

    }

    //删除地址
    @RequestMapping(value = "/del",method = RequestMethod.GET)
    public String del(int id){
        int i = dao.deleteById(id);
        return "redirect:/mobile/person/show";
    }

    //地址修改
    @RequestMapping("/changState.do") @ResponseBody @Transactional
    public void changState(HttpServletRequest req){
        String state = req.getParameter("sta");
        String addrid = req.getParameter("id");
        HttpSession session = req.getSession();
        int custid = ((Customer) session.getAttribute("customer")).getId();
        int i = dao.changeState(custid);
        Map<String,Object> map = new HashMap<String,Object>();
            map.put("id",addrid);
            map.put("custID",custid);
            int a =dao.ch(map);
    }




}
