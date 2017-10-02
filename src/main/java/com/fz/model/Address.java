package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by bai on 2017/7/15.
 */
@Data
@Component
@AllArgsConstructor
@NoArgsConstructor

/**
 * 地址表(fz_shop_address)对应实体类
 *
 * 属性           列名          注释
 *
 * id             id            ID
 * custId         cust_id       会员id
 * receiver       receiver      收货人
 * address        address       地址
 * zipcode        zipcode       邮编
 * phone          phone         收货电话
 * state          state         地址状态（1：选中，默认为0）
 * */
public class Address {
    private int id;
    private int custId;
    private String receiver;
    private String address;
    private String zipcode;
    private String phone;
    private int  state;

}
