package com.fz.mobile.mapper;

import com.fz.model.Order;
import com.fz.model.OrderDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by bai on 2017/7/17.
 */

@Component
public interface MOrderMapper {
    //查询订单
    public List<Order> query(Map<String,Object> map);



    //查询未付款订单
    public List<Map<String,Object>> querypending(@Param("id") int id, @Param("start") int start);

    //查询待收货订单
    public List<Map<String,Object>> queryreceived(@Param("id") int id ,@Param("start") int start);

    //确认收货修改状态
    public int updateconfrm_receive(@Param("id") int id ,@Param("start") int start,@Param("state") int state,@Param("pstate") int pstate);

    //退换货
    public List<Map<String,Object>> qureyreturned(@Param("id") int id,@Param("start") int start);

    //确认退货
    public int Confirm_refund (@Param("id") int id,@Param("fstart") int fstart,@Param("state")  int state,@Param("pstate") int pstate);

    //查询晒单评价
    public List<Map<String,Object>> qureyevaluation (@Param("id") int id,@Param("start") int start);

    //查询所有订单和商品图片
    public List<Map<String,Object>> queryOrder(@Param("id") int id);

}
