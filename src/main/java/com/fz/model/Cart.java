package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
@Scope("prototype")
/**
 * Cart     购物车
 *
 * 属性名       数据库字段名    备注
 * id           id              购物车ID
 * custId       cust_id         会员ID
 * gid          gid             产品ID
 * price        price           单价
 * num          num             数量
 * inTime       intime          添加时间
 */
public class Cart {
    private int id;
    private int custId;
    private int gid;
    private double price;
    private int num;
    private String inTime;
}
