package com.sweet.service;

import com.sweet.pojo.User;
import com.sweet.service.serviceImpl.UserServiceImpl;
import org.junit.Test;


public class UserServiceTest {
    private UserService userService = new UserServiceImpl();

    @Test
    public void test1() {
        User user = userService.loginUser(new User("admin", "admin"));
        System.out.println(user);
    }
}
