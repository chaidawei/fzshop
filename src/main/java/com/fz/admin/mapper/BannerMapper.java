package com.fz.admin.mapper;

import com.fz.model.Banner;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface BannerMapper {
    public List<Banner> queryAll();
    public List<Map<String,Object>> queryAlls();//查询的对象以map形式返回
    @Insert("insert into fz_shop_banner values(null,#{gid},#{name},#{img},#{link},#{state},#{inTime})")
    public void insert(Banner banner);
    public void updateById(Banner banner);
    public Banner queryById(int id);
    public int delById(int id);


}
