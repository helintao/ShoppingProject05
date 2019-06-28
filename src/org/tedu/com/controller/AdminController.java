package org.tedu.com.controller;

import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.tedu.com.entity.Admin;
import org.tedu.com.entity.Menu;
import org.tedu.com.entity.Page;
import org.tedu.com.service.AdminService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/27
 */
@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/toAdminList")
    public ModelAndView toMenuList(ModelAndView modelAndView){
        modelAndView.setViewName("adminList");
        return modelAndView;
    }

    @RequestMapping("/toFindAllAdminList")
    @ResponseBody
    public Map<String,Object> findAllAdminList(Page page, String name){
        Map<String, Object> map = new HashMap<String, Object>();
        //手动封装参数
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        queryMap.put("userName", name);

        //调用业务层

        List<Admin> list = adminService.findAllAdminList(queryMap);
        map.put("rows", list);
        map.put("total", 10);

        return map;
    }

    @RequestMapping("/addAdmin")
    @ResponseBody
    public Map<String,String> addAdmin(Admin admin){

        Map<String, String> map = new HashMap<String, String>();

        if (admin == null) {
            map.put("type", "error");
            map.put("msg", "请填写用户信息");
            return map;
        }

        if (StringUtil.isEmpty(admin.getUserName())) {
            map.put("type", "error");
            map.put("msg", "请填写用户名");
            return map;
        }

        if (StringUtil.isEmpty(admin.getPassword())) {
            map.put("type", "error");
            map.put("msg", "请填写密码");
            return map;
        }


        //调用service层方法
        int row = adminService.addAdmin(admin);
        System.out.println("row:" + row);
        if (row <= 0) {
            map.put("type", "error");
            map.put("msg", "用户信息添加失败！请联系管理员！");
            return map;
        }

        map.put("type", "success");
        map.put("msg", "添加成功");
        return map;
    }

    @RequestMapping("/deleteAdmin")
    @ResponseBody
    public Map<String,String> deleteAdmin(String id){
        Map<String, String> map = new HashMap<String, String>();
        if (id == null) {
            map.put("type", "error");
            map.put("msg", "请选择你要删除的用户");
            return map;
        }

        int row=adminService.deleteAdmin(id);
        if(row<=0){
            map.put("type", "error");
            map.put("msg", "删除的用户失败！请联系管理员");
            return map;
        }

        map.put("type", "success");
        map.put("msg", "删除的用户成功！");
        return map;
    }

    @RequestMapping("/updateAdmin")
    @ResponseBody
    public Map<String,String> updateMenu(Admin admin){
        Map<String,String>  map =new HashMap<String, String>();
        System.out.println(admin.toString());
        //对menu进行判断
        if (admin == null) {
            map.put("type", "error");
            map.put("msg", "请选择要修改的用户");
            return map;
        }

        if (StringUtil.isEmpty(admin.getUserName())) {
            map.put("type", "error");
            map.put("msg", "请填写用户");
            return map;
        }

        if (StringUtil.isEmpty(admin.getPassword())) {
            map.put("type", "error");
            map.put("msg", "请填写修改的密码");
            return map;
        }


        //调用service层方法
        int row = adminService.updateAdmin(admin);
        System.out.println("row:" + row);
        if (row <= 0) {
            map.put("type", "error");
            map.put("msg", "菜单信息修改失败！请联系管理员！");
            return map;
        }

        map.put("type", "success");
        map.put("msg", "修改成功");
        return map;
    }

    @RequestMapping("/findAdminForUserName")
    @ResponseBody
    public Map<String,Object> findAdminForUserName(String userName){
        Map<String, Object> map = new HashMap<String, Object>();
        System.out.println("userName:"+userName);
        //调用业务层

        List<Admin> list =adminService.findAdminForUserName(userName);

        if(list==null){
            map.put("type", "error");
            map.put("msg", "查找失败/或不存在该用户");
            return map;
        }
        map.put("type", "success");
        map.put("rows", list);
        map.put("total",list.size());
        return map;
    }
}
