package org.tedu.com.service;

import org.tedu.com.entity.Admin;

import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/27
 */
public interface AdminService {
    List<Admin> findAllAdminList(Map<String,Object> queryMap);

    Integer addAdmin(Admin admin);

    Integer deleteAdmin(String id);

    Integer updateAdmin(Admin admin);

    List<Admin> findAdminForUserName(String userName);
}
