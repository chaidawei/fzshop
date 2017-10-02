package com.fz.admin.mapper;

import com.fz.model.Goods;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/14.
 */
@Component
public interface GoodsMapper {
    public Goods queryById(int id);
    public List<Goods> queryAll();
    public List<Map<String,Object>> queryAlls();
    public int queryKey();

    public int delById(int id);

    @Update("update fz_shop_goods set logo=#{logo} where id=#{id}")
    public int delImg(@Param("logo") String logo,@Param("id") int id);
    public int save(Goods goods);
    public int updateById(Goods goods);
}
