package org.tedu.com.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.tedu.com.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @anthor: Banana
 * @function: 登录拦截器
 * @date: 2019/6/24
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 请求之前拦截
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse, Object o) throws Exception {
        //判断用户是否为null
        User user = (User) httpServletRequest.getSession().getAttribute("admin");
        if(user==null){
            String path=httpServletRequest.getServletContext().getContextPath();
            httpServletResponse.sendRedirect(path+"/login");
            System.out.println(path+"/login");
            return false;
        }
        return true;
    }

    /**
     * 请求时拦截
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 请求之后拦截
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
