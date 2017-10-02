package com.fz.mobile.mapper;

import com.fz.model.Customer;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * Created by bai on 2017/7/17.
 */
@Component
public interface MCustomerMapper {
    @Select("select * from fz_shop_customer where phone=#{phone} and password=#{p}")
    Customer queryCustomer(@Param("phone") String phone, @Param("p") String password);

    @Insert("insert into fz_shop_customer (id,name,password,phone,email,time) values (null,#{name},#{pass},#{phone},#{email},#{time})")
    int insertInto(@Param("name") String name,@Param("pass") String pass,@Param("phone") String phone,@Param("email") String email,@Param("time") String tme);

    int queryRow(@Param("phone") String phone);

    public int change(Map<String, Object> map);

    public String  queryPass(int id);
}
