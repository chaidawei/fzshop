package com.fz.mobile.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Wei Yinghang on 2017/7/18.
 */
@Component
public interface MBannerMapper {
    @Select("select * from fz_shop_banner where state=0")
    List<Map<String,Object>> queryAll();
}
