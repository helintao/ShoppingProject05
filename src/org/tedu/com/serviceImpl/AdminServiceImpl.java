package org.tedu.com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tedu.com.dao.AdminDao;
import org.tedu.com.entity.Admin;
import org.tedu.com.service.AdminService;

import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/27
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Admin> findAllAdminList(Map<String, Object> queryMap) {
        return adminDao.findAllAdminList(queryMap);
    }

    @Override
    public Integer addAdmin(Admin admin) {
        return adminDao.addAdmin(admin);
    }

    @Override
    public Integer deleteAdmin(String id) {
        return adminDao.deleteAdmin(id);
    }

    @Override
    public Integer updateAdmin(Admin admin) {
        return adminDao.updateAdmin(admin);
    }

    @Override
    public  List<Admin>  findAdminForUserName(String userName) {
        return adminDao.findAdminForUserName(userName);
    }
}
