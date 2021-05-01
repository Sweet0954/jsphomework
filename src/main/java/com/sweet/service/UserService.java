package com.sweet.service;

import com.sweet.pojo.User;

public interface UserService {
    // 用户登陆
    User loginUser(User user);
    // 注册账号
    int regist(User user);
    // 忘记密码
    int forgetPassword(User user);
}
