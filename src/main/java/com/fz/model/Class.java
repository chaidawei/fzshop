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
 * 商品分类表(fz_shop_class)对应实体类
 *
 * 属性       列名      注释
 * id         id        ID
 * name       name      分类名称
 * pid        pid       所属大分类
 * path       path      路径
 *
 *
 * */
public class Class {
    private int id;
    private String name;
    private int pid;
    private String path;
}
