package org.tedu.com.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.tedu.com.util.CpachaUtil;

@Controller
public class SystemController {


    @RequestMapping("/toIndex")
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


}
