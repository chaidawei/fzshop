package com.fz.mobile.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;


/**
 * Created by Wei Yinghang on 2017/7/17.
 */
@Component
public interface MAppraiseMapper {

    List<Map<String,Object>> queryAppr(@Param("gid") String gid,@Param("l") String l,@Param("p") int p);

    int queryRow(@Param("gid") String gid,@Param("s") int s);
}
