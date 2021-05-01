package com.sweet.dao;

import com.sweet.pojo.User;

public interface UserDao {
    // 登录,查找用户的信息
    User loginUser(User user);
    // 注册账号
    int regist(User user);
    // 忘记密码
    int forgetPassword(User user);
}
