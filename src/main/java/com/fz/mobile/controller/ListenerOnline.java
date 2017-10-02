package com.fz.mobile.controller;

import com.fz.mobile.mapper.MCutLoginDailyMapper;
import com.fz.model.CutLoginDaily;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebListener
public class ListenerOnline implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent e) {
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent e) {
        HttpSession session = e.getSession();
        if (session.getAttribute("loginRemark") != null) {
            CutLoginDaily c = (CutLoginDaily) session.getAttribute("loginRemark");
            long curren = System.currentTimeMillis();
            Date d = new Date(curren - 30 * 60 * 1000);
            c.setLogoutTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d));
            ApplicationContext a=WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
            MCutLoginDailyMapper mCutLoginDailyMapper=a.getBean(MCutLoginDailyMapper.class);
            mCutLoginDailyMapper.insertInto(c);
        }
    }

}
