package com.fz.mobile.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 */
@Component
public interface MUtilMapper {
    int count(@Param("table") String table);
    int custId (String name);
    int count1(int id);
}
