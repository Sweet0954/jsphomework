package com.sweet.controller;

import com.sweet.pojo.Book;
import com.sweet.pojo.Cart;
import com.sweet.pojo.CartItem;
import com.sweet.pojo.Order;
import com.sweet.service.BookService;
import com.sweet.service.OrderService;
import com.sweet.service.serviceImpl.BookServiceImpl;
import com.sweet.service.serviceImpl.OrderServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
@SessionAttributes(value = {"cart"}, types = {Cart.class})
public class CartController {
    @Autowired
    private OrderService orderService = new OrderServiceImpl();
    @Autowired
    private BookService bookService = new BookServiceImpl();


    @RequestMapping("/addItem")
    public String addItem(@Param("id") int id, Model model, HttpSession session) throws Exception {
        System.out.println(id);
        // 获取到当前书籍
        Book book = bookService.queryBookById(id);
        // 把book信息转换为商品项
        CartItem cartItem = new CartItem(book.getId(), book.getName(), 1, book.getPrice(), book.getPrice());
        // 添加商品项
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            model.addAttribute("cart", cart);
        }
        cart.addItem(cartItem);
        System.out.println(cart);
        // 最后一个添加的商品名称
        // 6、返回购物车总的商品数量和最后一个添加的商品名称
        model.addAttribute("lastName", cartItem.getName());
        BigDecimal totalPrice = cart.getTotalPrice();
        model.addAttribute("totalPrice", totalPrice);
        return "cart";
    }

    // 跳到更新购物车页面
    @RequestMapping("updateCart")
    public String updateCart(@Param("id") int id, HttpSession session, Model model) {
        Cart cart = (Cart) session.getAttribute("cart");
        Map<Integer, CartItem> items = cart.getItems();
        CartItem cartItem = items.get(id);
        model.addAttribute("cartItem", cartItem);
        return "updateCart";
    }

    // 修改商品数量
    @RequestMapping("update")
    public String update(Model model, @Param("id") int id, @Param("count") int count, HttpSession session) {
        // 获取Cart购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        cart.updateCount(id,count);
        Map<Integer, CartItem> items = cart.getItems();
        CartItem cartItem = items.get(id);
        model.addAttribute("cartItem", cartItem);
        model.addAttribute("msg", "修改成功!请返回原页面刷新");
        return "updateCart";
    }

    // 删除商品项
    @RequestMapping("delete")
    public String delete(@Param("id") int id, Model model, HttpSession session) {
        // 获取购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        cart.deleteItem(id);
        return "cart";
    }

    // 返回当前选择的商品总金额
    @RequestMapping("totalPrice")
    public String totalPrice(Model model, HttpSession session) {
        // 获取购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        BigDecimal totalPrice = cart.getTotalPrice();
        model.addAttribute("totalPrice", totalPrice);
        return "cart";
    }

    // 清空购物车，结算保存在数据库中
    @RequestMapping("addOrder/{id}")
    public String clearCart(@PathVariable int id, Model model, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        String order = orderService.createOrder(cart, id);
        System.out.println(order);
        cart.clear();
        model.addAttribute("cart", cart);
        List<Order> orderList = orderService.queryOrderById(id);
        model.addAttribute("orderList",orderList);
        return "order";
    }

    // 查找订单
    @RequestMapping("order/{id}")
    public String qqueryOrder(@PathVariable int id, Model model) {
        List<Order> orderList = orderService.queryOrderById(id);
        model.addAttribute("orderList",orderList);
        return "order";
    }
}
