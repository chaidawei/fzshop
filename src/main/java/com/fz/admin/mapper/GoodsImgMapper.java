package com.fz.admin.mapper;

import com.fz.model.Goods;
import com.fz.model.GoodsImg;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/14.
 */
@Component
public interface GoodsImgMapper {
    public GoodsImg queryById(int id);
    public List<GoodsImg> queryByPid(int gid);
    public List<GoodsImg> queryAll();
    public int delById(int id);
    public int save(GoodsImg goodsImg);
    public int save1(Map<String ,Object> goodsImg);
    public int updateById(GoodsImg goodsImg);
}
