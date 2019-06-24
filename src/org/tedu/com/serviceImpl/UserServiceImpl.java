package org.tedu.com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tedu.com.dao.UserDao;
import org.tedu.com.entity.User;
import org.tedu.com.service.UserService;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/21
 */

@Service
public class UserServiceImpl implements UserService {

    //将持久层对象注入到业务层中，使用@Autowired
    @Autowired
    private UserDao userDao;

    @Override
    public User selectAll(String userName) {
        return userDao.selectAll(userName);
    }

}
