package com.sweet.controller;

import com.sweet.pojo.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

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
    public String cartPage(Model model, HttpSession session) {
        // 返回当前选择的商品总金额
        // 获取购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        BigDecimal totalPrice = cart.getTotalPrice();
        model.addAttribute("totalPrice", totalPrice);
        return "cart";
    }

    // 添加图书
    @RequestMapping("addBook")
    public String addBook() {
        return "addBook";
    }

    // 注册页面
    @RequestMapping("regist")
    public String registUser() {
        return "regist";
    }
    // 找回密码
    @RequestMapping("forget")
    public String forgetUser() {
        return "forget";
    }
}
