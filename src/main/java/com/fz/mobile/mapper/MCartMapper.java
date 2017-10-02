package com.fz.mobile.mapper;

import com.fz.model.Cart;
import com.fz.model.Order;
import com.fz.model.OrderDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Lxy on 2017/7/17.
 */
@Component
public interface MCartMapper {
    @Insert("insert into fz_shop_cart values(null,#{cid},#{gid},#{p},#{num},#{time})")
    int insertGoods(@Param("cid") int cid, @Param("gid") int gid, @Param("p") String p, @Param("num") int num, @Param("time") String time);

    List<Map<String, Object>> showCartNumByUserId(@Param("id") int id);

    int deleteCartDataById(@Param("id") int id);

    int updateGoodNumById(@Param("gid") int gid, @Param("num") int num, @Param("id") int id);

    @Update("UPDATE fz_shop_cart c SET num =num + #{num} where c.gid=#{gid} and c.cust_id=#{id}")
    int updateGoodNum(@Param("gid") int gid, @Param("num") int num, @Param("id") int id);

    Map<String, Object> selectCustomerAddrByUserId(@Param("id") int id);

    int orderSub(Order order);

    int insertOrderDetail(OrderDetail od);

    Map<String, Object> selectCartGoodByGoodId(@Param("id") int id, @Param("gid") int gid);

    Map<String, Object> selectOrderNoById(@Param("id") int id);

    int deleteCartByUserId(@Param("userId") int id);
}
