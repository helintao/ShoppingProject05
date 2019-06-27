package org.tedu.com.service;

import org.tedu.com.entity.Menu;

import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/25
 */
public interface MenuService {
    Integer addMenu(Menu menu);

    //查询所有菜单
    List<Menu> findAllMenuList(Map<String,Object> queryMap);

    Integer delete(String id);

    Integer updateMenu(Menu menu);
}
