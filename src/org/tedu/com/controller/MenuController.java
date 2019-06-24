package org.tedu.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @anthor: Banana
 * @function:
 * @date: 2019/6/24
 */
@Controller
public class MenuController {

    //返回列表页面
    @RequestMapping("/list")
    public ModelAndView toList(ModelAndView modelAndView){
        //给model添加视图
        modelAndView.setViewName("menuList");
        return modelAndView;
    }
}
