package org.tedu.com.dao;

import org.tedu.com.entity.User;

/**
 * @anthor: Banana
 * @function: 操作数据库的持久层
 * @date: 2019/6/21
 */
public interface UserDao {
    //定义操作数据的抽象方法
    User selectAll(String userName);//查询所以用户
}
