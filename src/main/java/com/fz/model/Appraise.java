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
 * 商品评价表(fz_shop_appraise)对应实体类
 *
 * 属性       列名          注释
 * id         id            ID
 * custId     cust_id       会员id
 * gid        gid           产品id
 * intime     intime        评价时间
 * star       star          评价星级
 * content    content       评价内容
 *
 * */
public class Appraise {
    private int id;
    private int custId;
    private int gid;
    private String intime;
    private int star;
    private String content;
}
