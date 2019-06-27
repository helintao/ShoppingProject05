package org.tedu.com.controller;

import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.tedu.com.entity.Menu;
import org.tedu.com.entity.Page;
import org.tedu.com.service.MenuService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/24
 */
@Controller
public class MenuController {

    //注入业务层对象
    @Autowired
    private MenuService menuService;

    //返回列表页面
    @RequestMapping("/list")
    public ModelAndView toList(ModelAndView modelAndView) {
        //给model添加视图
        modelAndView.setViewName("menuList");
        return modelAndView;
    }

    //添加菜单信息
    @RequestMapping(value = "/addMenu", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> addMenu(Menu menu) {
        Map<String, String> map = new HashMap<String, String>();
        //对menu进行判断
        if (menu == null) {
            map.put("type", "error");
            map.put("msg", "请填写菜单信息");
            return map;
        }

        if (StringUtil.isEmpty(menu.getName())) {
            map.put("type", "error");
            map.put("msg", "请填写菜单名称");
            return map;
        }

        if (StringUtil.isEmpty(menu.getUrl())) {
            map.put("type", "error");
            map.put("msg", "请填写菜单路径");
            return map;
        }

        if (StringUtil.isEmpty(menu.getIcon())) {
            map.put("type", "error");
            map.put("msg", "请选择菜单图标");
            return map;
        }

        if (menu.getParentId() == null) {
            menu.setParentId(0);
        }

        //调用service层方法
        int row = menuService.addMenu(menu);
        System.out.println("row:" + row);
        if (row <= 0) {
            map.put("type", "error");
            map.put("msg", "菜单信息添加失败！请联系管理员！");
            return map;
        }

        map.put("type", "success");
        map.put("msg", "添加成功");
        return map;
    }

    @RequestMapping(value = "/findMenuList", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findMenuList(Page page, String name) {
        Map<String, Object> map = new HashMap<String, Object>();
        //手动封装参数
        Map<String, Object> queryMap = new HashMap<String, Object>();
        queryMap.put("offset", page.getOffset());
        queryMap.put("pageSize", page.getRows());
        queryMap.put("name", name);

        //调用业务层

        List<Menu> list = menuService.findAllMenuList(queryMap);
        map.put("rows", list);
        map.put("total", 10);

        return map;
    }

    //删除菜单
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> delete(String id) {
        Map<String, String> map = new HashMap<String, String>();
        if (id == null) {
            map.put("type", "error");
            map.put("msg", "请选择你要删除的菜单");
            return map;
        }

        int rows = menuService.delete(id);
        if (rows <= 0) {
            map.put("type", "error");
            map.put("msg", "删除失败！");
            return map;
        }
        map.put("type", "success");
        map.put("msg", "删除成功！");
        return map;
    }


    @RequestMapping("/upDateMenu")
    @ResponseBody
    public Map<String,String> upDateMenu(Menu menu){
        Map<String,String>  map =new HashMap<String, String>();
        //对menu进行判断
        if (menu == null) {
            map.put("type", "error");
            map.put("msg", "请填写菜单信息");
            return map;
        }

        if (StringUtil.isEmpty(menu.getName())) {
            map.put("type", "error");
            map.put("msg", "请填写菜单名称");
            return map;
        }

        if (StringUtil.isEmpty(menu.getUrl())) {
            map.put("type", "error");
            map.put("msg", "请填写菜单路径");
            return map;
        }

        if (StringUtil.isEmpty(menu.getIcon())) {
            map.put("type", "error");
            map.put("msg", "请选择菜单图标");
            return map;
        }

        if (menu.getParentId() == null) {
            menu.setParentId(0);
        }

        //调用service层方法
        int row = menuService.updateMenu(menu);
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
}
