package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by bai on 2017/7/15.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
/**
 * 商品详情轮播图表(fz_shop_goods_img)对应实体类
 *
 * 属性       列名        注释
 *
 * id         id          id
 * gid        gid         产品id
 * img        img         图片
 *
 * */
public class GoodsImg {
    private int id;
    private int gid;
    private String img;
}
