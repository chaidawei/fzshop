package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
/**
 * OrderDetail  订单详情表
 *
 * 属性名       数据库字段名    备注
 * id           id              订单详情id
 * orderID      order_id        订单ID
 * gid          gid             产品ID
 * name         name            产品名称
 * price        price           产品价格
 * num          num             产品数量
 */
public class OrderDetail {
    private int id;
    private int orderId;
    private int gid;
    private String name;
    private double price;
    private int num;
}
