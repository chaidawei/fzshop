package com.fz.mobile.mapper;

import com.fz.model.CutLoginDaily;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Component;

/**
 * Created by Wei Yinghang on 2017/7/18.
 */
@Component
public interface MCutLoginDailyMapper {
    @Insert("insert into fz_cutlogin_daily values(null,#{custId},#{loginTime},#{ip},#{logoutTime})")
    int insertInto(CutLoginDaily c);
}
