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
 * 会员表（fz_shop_customer）对应实体类
 *
 * 属性         列名        注释
 * id           id          ID
 * name         name        用户名
 * password     password    密码
 * img          img         头像
 * phone        phone       手机号
 * email        email       邮箱
 * gender       gender      性别(0:女 1:男)
 * birthday     birthday    生日
 * other        other       备注
 * time         time        注册时间
 *
 * */
public class Customer {
    private int id;
    private String name;
    private String password;
    private String img;
    private String phone;
    private String email;
    private int gender;
    private String birthday;
    private String other;
    private String time;

}
