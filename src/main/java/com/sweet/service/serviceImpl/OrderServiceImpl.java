package com.sweet.service.serviceImpl;

import com.sweet.dao.BookDao;
import com.sweet.dao.OrderDao;
import com.sweet.dao.OrderItemDao;
import com.sweet.pojo.*;
import com.sweet.service.OrderService;
import com.sweet.util.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    @Autowired
    private BookDao bookDao;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderItemDao orderItemDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public void setOrderItemDao(OrderItemDao orderItemDao) {
        this.orderItemDao = orderItemDao;
    }

    public String createOrder(Cart cart, Integer userId) {
        // 订单号====唯一性
        String orderId = IdUtils.getId();
        // 创建一个订单对象
        Order order = new Order(orderId, new Date(), cart.getTotalPrice(), 0, userId);
        // 保存订单
        orderDao.saveOrder(order);

        // 遍历购物车中每一个商品项转换为订单项保存到数据库
        for (Map.Entry<Integer, CartItem>entry : cart.getItems().entrySet() ) {
            // 获取每一个购物车中的商品项
            CartItem cartItem = entry.getValue();
            // 转换为每一个订单项
            OrderItem orderItem = new OrderItem(null, cartItem.getName(), cartItem.getCount(), cartItem.getPrice(), cartItem.getTotalPrice(), orderId);

            // 保存订单项到数据库
            orderItemDao.addOrderItem(orderItem);

            // 更新销量和库存
            Book book = bookDao.queryBookById(cartItem.getId());
            book.setSales( book.getSales() + cartItem.getCount() );

            bookDao.addBook(book);
        }
        // 清空购物车
        cart.clear();

        return orderId;
    }
}
