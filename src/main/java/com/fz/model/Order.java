package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
/**
 * Order 订单表
 *
 * 属性名       数据库字段名    备注
 *  id            id            订单ID
 *  custId        cust_id       会员ID
 *  addId         add_id        收货地址ID
 *  orderNum      order_num     订单号
 *  total         total         订单总额
 *  state         state         订单状态
 *  time          time          订单时间
 *  payStatus     pay_status    付款状态
 *  payType       pay_type      付款方式
 *  serialNo      serialno      发货单号
 *  fhStatus      fastatus      发货状态
 */
public class Order {
    private int id;
    private int custId;
    private int addId;
    private String orderNum;
    private double total;
    private int state;
    private String time;
    private int payStatus;
    private int payType;
    private String serialNo;
    private int fhStatus;
}
