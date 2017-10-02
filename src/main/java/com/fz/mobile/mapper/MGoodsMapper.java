package com.fz.mobile.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Wei Yinghang on 2017/7/17.
 */
@Component
public interface MGoodsMapper {
    @Select("select g.*,c.name as \"cid\" from fz_shop_goods g,fz_shop_class c where g.id=#{id} and class_id=c.id and state=1")
    Map<String,Object> queryGoodsDetails(@Param("id")String id);

    @Select("select * from fz_shop_goods where state=1 limit #{star},#{size}")
    List<Map<String,Object>> queryGoods(@Param("star")int star, @Param("size")int size);

    @Select("select * from fz_shop_goods where class_id=#{id} and state=1 limit #{star},#{size}")
    List<Map<String,Object>> queryGoodsByClass(@Param("id")String id,@Param("star")int star, @Param("size")int size);

    @Select("select * from fz_shop_goods where state=1 and name like #{key} limit #{star},#{size}")
    List<Map<String,Object>> queryGoodsByKey(@Param("key")String key,@Param("star")int star, @Param("size")int size);
}
