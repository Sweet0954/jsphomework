package com.sweet.dao;

import com.sweet.pojo.Order;

import java.util.List;

public interface OrderDao {
    int saveOrder(Order order);
    /*通过用户id查找订单*/
    List<Order> queryOrderById(int id);
}
