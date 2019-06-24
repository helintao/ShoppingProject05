package org.tedu.com.service;

import org.tedu.com.entity.User;

/**
 * @anthor: Banana
 * @function: 业务层接口和持久层接口定义一样
 * @date: 2019/6/21
 */
public interface UserService {

   User selectAll(String userName);
}
