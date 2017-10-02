package com.fz.mobile.mapper;

import com.fz.model.Address;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by David on 2017/7/18.
 */
@Component
public interface MShoppingAddressMapper {
    List<Address> query(int id);

    int deleteById(int id);

    int count(int id);

    //改变地址
    int changeAddress(Map<String, Object> map);

    //修改地址的状态
    public int changeState(@Param("custId") int id);

    public int ch(Map<String,Object> map);
}
