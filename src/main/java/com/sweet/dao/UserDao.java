package com.sweet.dao;

import com.sweet.pojo.User;

public interface UserDao {
    // 登录,查找用户的信息
    User loginUser(User user);
}
