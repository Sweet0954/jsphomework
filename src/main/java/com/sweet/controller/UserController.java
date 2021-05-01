package com.sweet.controller;

import com.sweet.pojo.User;
import com.sweet.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@RequestMapping("/book")
@SessionAttributes(names = "user")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @PostMapping("/login")
    public String list(String username, String password, Model model) {
        User user = new User(username, password);
        System.out.println(user);
        User loginUser = userService.loginUser(user);
        if (loginUser != null) {
            model.addAttribute("user", loginUser);
            return "redirect:/book/home";
        } else {
            model.addAttribute("msg", "用户名或者密码错误");
            model.addAttribute("user", user);
            return "index";
        }
    }

    @PostMapping("/user/regist")
    public String regist(Model model, @Param("username") String username, @Param("password") String password, @Param("email") String email) {
        User user = new User(username, password, email);
        int regist = userService.regist(user);
        if (regist == 1) {
            model.addAttribute("msg", "注册成功");
        } else {
            model.addAttribute("msg", "注册失败");
        }
        return "regist";
    }
}
