package org.tedu.com.controller;

import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.tedu.com.entity.User;
import org.tedu.com.service.UserService;
import org.tedu.com.util.CpachaUtil;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SystemController {

    //注入业务层
    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    //测试环境
    public String test() {
        return "index";
    }


    @RequestMapping("/login")
    //测试环境
    public ModelAndView login(ModelAndView model) {
        model.setViewName("login");
        return model;
    }

    /*
     * 获取请求的验证码
     *
     */
    @RequestMapping(value = "/get_capcha", method = RequestMethod.GET)
    public void getCpacha(
            @RequestParam(name = "vcode", required = false, defaultValue = "4") Integer vcodeLen,
            @RequestParam(name = "w", required = false, defaultValue = "120") Integer width,
            @RequestParam(name = "h", required = false, defaultValue = "30") Integer height,
            @RequestParam(name = "type", required = false, defaultValue = "loginCpache") String cpacheType,
            HttpServletRequest req, HttpServletResponse res) {
        CpachaUtil cpacha = new CpachaUtil(vcodeLen, width, height);
        //生成验证码
        String generatorVcode = cpacha.generatorVCode();
        //将生成的验证码绑定到session中
        req.getSession().setAttribute("loginCpacha", generatorVcode);
        //生产验证码图片
        BufferedImage bff = cpacha.generatorVCodeImage(generatorVcode, true);
        //使用输出流将验证码图片返回给浏览器
        try {
            ImageIO.write(bff, "gif", res.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 用户登录
     */
    @RequestMapping("/toLoginAction")
    @ResponseBody
    public Map<String, String> loginAction(User user, String cpacha, HttpServletRequest request) {

        Map<String, String> map = new HashMap<String, String>();

        if (user == null) {
            map.put("type", "error");
            map.put("msg", "请填写用户信息");
            return map;
        }
        if (StringUtil.isEmpty(user.getUserName())) {
            map.put("type", "error");
            map.put("msg", "请填写用户名");
            return map;
        }

        if (StringUtil.isEmpty(user.getPassword())) {
            map.put("type", "error");
            map.put("msg", "请填写密码");
            return map;
        }

        String loginCpacha = request.getSession().getAttribute("loginCpacha").toString();
        System.out.println(loginCpacha);
        System.out.println(cpacha);
        if (!loginCpacha.toUpperCase().equals(cpacha.toUpperCase())) {
            map.put("type", "error");
            map.put("msg", "验证码不正确");
            return map;
        }

        //调用业务层
        User u = userService.selectAll(user.getUserName());

        if (u == null) {
            map.put("type", "error");
            map.put("msg", "该用户不存在");
            return map;
        }

        if (!u.getUserName().equals(user.getUserName())) {
            map.put("type", "error");
            map.put("msg", "用户名错误");
            return map;
        }

        if (!u.getPassword().equals(user.getPassword())) {
            map.put("type", "error");
            map.put("msg", "密码不正确");
            return map;
        }

        //将用户存在session里面
        request.getSession().setAttribute("admin",user.getUserName());

        map.put("type", "success");
        map.put("msg", "登录成功");

        return map;
    }

    @RequestMapping("/welcome")
    //欢迎界面
    public ModelAndView welcome(ModelAndView model) {
        model.setViewName("welcome");
        return model;
    }
}
