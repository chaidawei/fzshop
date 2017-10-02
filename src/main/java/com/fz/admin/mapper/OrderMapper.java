package com.fz.admin.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by yinuo on 2017/7/16.
 */
@Component
public interface OrderMapper {
    public List<Map> queryOrder(@Param("key") String key, @Param("date1") String date1);

    public List<Map> queryMonthOrder(@Param("key") String key, @Param("date1") String date1);
}
