package com.sweet.service;

import com.sweet.pojo.Cart;

public interface OrderService {
    String createOrder(Cart cart, Integer userId);
}
