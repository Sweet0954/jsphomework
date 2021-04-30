package com.sweet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/book")
public class PageController {

    // 显示主页
    @RequestMapping("/home")
    public String homePage() {
        return "home";
    }
    // 注销登录
    @RequestMapping("/index")
    public String indexPage(HttpServletRequest request) {
        // 销毁session
        request.getSession().invalidate();
        return "index";
    }

    // 书店详情
    //@RequestMapping("/info")
    //public String infoPage() {
    //    return "welcome";
    //}

    // 购物车
    @RequestMapping("/cart")
    public String cartPage() {
        return "cart";
    }

    // 添加图书
    @RequestMapping("addBook")
    public String addBook() {
        return "addBook";
    }

}
