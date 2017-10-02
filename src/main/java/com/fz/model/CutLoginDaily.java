package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by bai on 2017/7/15.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
/**
 * 登录日志表(fz_cutlogin_daily)对应实体类
 *
 * 属性          列名          注释
 * id            id            ID
 * custId        cust_id       会员id
 * loginTime     login_time    登录时间
 * ip            Ip            IP
 * logoutTime    logout_time  登出时间
 *
 * */
public class CutLoginDaily {
    private int id;
    private int custId;
    private String loginTime;
    private String ip;
    private String logoutTime;

}
