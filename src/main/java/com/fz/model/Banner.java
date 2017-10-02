package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
/**
 * Banner   轮播列表
 *
 * 属性名       数据库字段名    备注
 * id           id              轮播编号
 * gid          gid             商品编号
 * name         name            名称
 * img          img             图片路径
 * link         link            链接
 * state        state           状态
 * inTIme       time            添加时间
 */
public class Banner {
    private int id;
    private int gid;
    private String name;
    private String img;
    private String link;
    private int state;
    private String inTime;
}
