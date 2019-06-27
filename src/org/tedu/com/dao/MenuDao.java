package org.tedu.com.dao;

import org.tedu.com.entity.Menu;

import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function: 菜单的持久层
 * @date: 2019/6/25
 */
public interface MenuDao {
    Integer addMenu(Menu menu);

    List<Menu> findAllMenuList(Map<String,Object> queryMap);

    Integer delete(String id);

    Integer updateMenu(Menu menu);
}
