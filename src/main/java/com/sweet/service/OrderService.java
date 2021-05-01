package com.sweet.service;

import com.sun.org.apache.xpath.internal.operations.Or;
import com.sweet.pojo.Cart;
import com.sweet.pojo.Order;

import java.util.List;

public interface OrderService {
    // 创建订单项
    String createOrder(Cart cart, Integer userId);
    // 通过id查找订单
    List<Order> queryOrderById(int id);
}
