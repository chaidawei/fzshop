package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;


/**
 * Created by bai on 2017/7/15.
 */
@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
/**
 *产品列表（fz_shop_goods）对应实体类
 * 属性名     列名          注释
 *
 * id          id          ID
 * name        name        产品名称
 * classId     class_id    类别名
 * price       price       价格
 * oprice      oprice      原价
 * stock       stock       库存
 * sale        sale        销量
 * state       state       状态(0：下架 1:上架 2:缺货)
 * inTime      intime      添加时间
 * proFile     profile     商品简介
 * params      params      商品参数
 * content     content     描述
 * logo        logo        商品图片
 *
 */
public class Goods {
    private int id;
    private String name;
    private int classId;
    private double price;
    private double oprice;
    private int stock;
    private int sale;
    private int state;
    private String inTime;
    private String proFile;
    private String params;
    private String content;
    private String logo;
}
