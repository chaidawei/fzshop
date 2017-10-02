package com.fz.mobile.controller;

import com.fz.Util.ShopUtil;
import com.fz.mobile.mapper.MCustomerMapper;
import com.fz.mobile.mapper.MCutLoginDailyMapper;
import com.fz.model.Customer;
import com.fz.model.CutLoginDaily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Wei Yinghang on 2017/7/18.
 */
@Component
@RequestMapping("/mobile/home")
public class MCustomerController {
    @Autowired
    private MCustomerMapper customerMapper;
    @Autowired
    private CutLoginDaily cutLoginDaily;

    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String pass = req.getParameter("password");
        Customer cust = this.customerMapper.queryCustomer(phone, ShopUtil.md5(pass));
        if (cust != null) {
            String ip = this.getIpAddress(req);
            cutLoginDaily.setCustId(cust.getId());
            cutLoginDaily.setLoginTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            cutLoginDaily.setIp(ip);
            req.getSession().setAttribute("customer", cust);
            req.getSession().setAttribute("loginRemark", cutLoginDaily);
            resp.sendRedirect("/mobile/home/index.html");
        } else {
            resp.sendRedirect("/mobile/home/loginError.html");
        }
    }

    @RequestMapping("/register.do")
    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String pass = req.getParameter("password");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        if (this.customerMapper.queryRow(phone) == 0) {
            int n = customerMapper.insertInto(username, ShopUtil.md5(pass), phone, email, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            if (n == 1) {
                String ip = this.getIpAddress(req);
                Customer cust = customerMapper.queryCustomer(phone, ShopUtil.md5(pass));
                cutLoginDaily.setCustId(cust.getId());
                cutLoginDaily.setLoginTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                cutLoginDaily.setIp(ip);
                req.getSession().setAttribute("customer", cust);
                req.getSession().setAttribute("loginRemake", cutLoginDaily);
                resp.sendRedirect("/mobile/home/index.html");
            }
        } else {
            resp.sendRedirect("/mobile/home/register.html");
        }
    }

    private static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
