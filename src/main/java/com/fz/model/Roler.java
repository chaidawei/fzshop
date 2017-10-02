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
 * 角色表（fz_sys_roler）对应实体类
 *
 * 属性       列名          注释
 * id         id            ID
 * name      name          角色名称
 *
 * */
public class Roler {
    private int id;
    private String name;
}
