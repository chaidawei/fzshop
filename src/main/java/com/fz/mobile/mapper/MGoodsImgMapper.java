package com.fz.mobile.mapper;

import com.fz.model.GoodsImg;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Wei Yinghang on 2017/7/17.
 */
@Component
public interface MGoodsImgMapper {
    @Select("select * from fz_shop_goods_img where gid=#{id} limit 0,2")
    List<GoodsImg> queryGoodsImg(@Param("id") String id);
}
