package com.sweet.service.serviceImpl;

import com.sweet.dao.UserDao;
import com.sweet.pojo.User;
import com.sweet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    // 必须要加set方法,否则无法注入
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    // 用户登录的方法
    public User loginUser(User user) {
        return userDao.loginUser(user);
    }

    public int regist(User user) {
        return userDao.regist(user);
    }

    public int forgetPassword(User user) {
        return userDao.forgetPassword(user);
    }
}
