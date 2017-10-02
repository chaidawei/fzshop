package com.fz.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * Created by Lxy on 2017/7/15.
 *
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
/**
 * fz_sys_role_menu 角色权限关系表

 属性名       数据库字段名    备注
 * roleId   role_id     角色ID
 * menuId   menu_id     菜单ID
 */
public class RoleMenu {
    private int roleId;
    private int menuId;
}
