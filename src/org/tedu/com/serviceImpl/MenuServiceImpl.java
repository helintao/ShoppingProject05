package org.tedu.com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tedu.com.dao.MenuDao;
import org.tedu.com.entity.Menu;
import org.tedu.com.service.MenuService;

import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/25
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public Integer addMenu(Menu menu) {
        return menuDao.addMenu(menu);
    }

    @Override
    public List<Menu> findAllMenuList(Map<String, Object> queryMap) {
        return menuDao.findAllMenuList(queryMap);
    }

    @Override
    public Integer delete(String id) {
        return menuDao.delete(id);
    }

    @Override
    public Integer updateMenu(Menu menu) {
        return menuDao.updateMenu(menu);
    }
}
