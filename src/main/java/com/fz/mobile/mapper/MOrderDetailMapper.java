package com.fz.mobile.mapper;

import com.fz.model.Address;
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
public interface MOrderDetailMapper {

    public List<OrderDetail> query();


    //订单详情查询(商品)
    public List<Map<String,Object>> querydetails(@Param("id") int id,@Param("onum") String onum );


    //查询订单详情(地址）

    public List<Address> queryaddress(@Param("id") int id);


    //查询订单详情(订单状态)

    public List<Map<String,Object>> queryorder(@Param("id") int id , @Param("onum") String onum);


    //取消订单
    public int updatecancelorder (int oid);

    //查询订单id
    public int queryid(@Param("id") int id ,@Param("onum") String onum);
}
