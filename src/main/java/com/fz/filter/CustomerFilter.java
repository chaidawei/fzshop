package com.fz.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Wei Yinghang on 2017/5/24.
 */
@WebFilter(urlPatterns = {"/mobile/person/*","/mobile/page/order/*","/mobile/page/cart/*","/mobile/page/evaluation/*","/mobile/page/pending/*","/mobile/page/received/*","/mobile/page/returned/*","/mobile/page/user/*"})
public class CustomerFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;
        // 禁止缓存
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragrma", "no-cache");
        response.setDateHeader("Expires", 0);
        // 链接来源地址，通过获取请求头 referer 得到
        String referer = request.getHeader("referer");
        System.out.println("登录过滤获取来源页面->：" + referer);
        HttpSession session= request.getSession();
        System.out.println(session.getAttribute("customer"));
        if (session.getAttribute("customer")==null){
            response.sendRedirect("/mobile/page/home/login.html");
            return;
        }
        chain.doFilter(req,resp);
    }

    @Override
    public void destroy() {

    }
}
