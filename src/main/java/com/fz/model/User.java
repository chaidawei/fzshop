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
 * 管理员表(fz_sys_user)对应实体类
 *
 * 属性       列名          注释
 *
 * id         id            ID
 * name       name          用户名
 * password   password      密码
 * roleId     role_id       角色id
 *
 * */
public class User {
    private int id;
    private String name;
    private String password;
    private int roleId;
}
