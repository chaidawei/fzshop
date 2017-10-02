package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by bai on 2017/7/15.
 */
@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
/**
 * 功能菜单表(fz_sys_menu)对应实体类
 *
 * 属性       列名      注释
 *
 *
 * id         id        ID
 * name       name      用户名
 * url        url       地址
 * pid        pid       上级节点
 * ord        ord       顺序号
 *
 * */
public class Menu {
    private int id;
    private String name;
    private String url;
    private int pid;
    private int ord;
}
