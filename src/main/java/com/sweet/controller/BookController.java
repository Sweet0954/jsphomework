package com.sweet.controller;

import com.sweet.pojo.Book;
import com.sweet.service.BookService;
import com.sweet.util.WebUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;
    private List<Book> bookList;
    private int bookTotal;
    private  int min;
    private  int max;

    // 分页
    @RequestMapping("/page/{pageNumber}")
    public String bookPage(Model model, @PathVariable("pageNumber") int pageNumber, HttpServletRequest request) {
        System.out.println(request.getParameter("min"));
        System.out.println(request.getParameter("max"));
        if ((request.getParameter("min") == null || "".equals(request.getParameter("min").trim())) && ((request.getParameter("max") == null) || "".equals(request.getParameter("min").trim()))) {
            bookList  = bookService.queryBookByPage(pageNumber);
            bookTotal = Integer.parseInt(String.valueOf(bookService.queryBookTotal()));
        } else {
            min = WebUtils.parseInt(request.getParameter("min"), 0);
            max = WebUtils.parseInt(request.getParameter("max"), Integer.MAX_VALUE);
            bookList = bookService.queryBookByPrice(pageNumber,min, max);
            bookTotal = Integer.parseInt(String.valueOf(bookService.queryBookTotalByPrice(min, max)));
            model.addAttribute("min", min);
            model.addAttribute("max", max);
        }
        System.out.println(bookList);
        int bookPageTotal = bookTotal / 4;
        // 求总页数
        if (bookTotal % 4 > 0){
            bookPageTotal += 1;
        }
        model.addAttribute("bookList", bookList);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("bookTotal", bookTotal);
        model.addAttribute("bookPageTotal", bookPageTotal);
        return "welcome";
    }

    @RequestMapping("/allBook")
    public String list(Model model, @Param("pageNumber") int pageNumber) {
        bookTotal = Integer.parseInt(String.valueOf(bookService.queryBookTotal()));
        int bookPageTotal = bookTotal / 4;
        // 求总页数
        if (bookTotal % 4 > 0){
            bookPageTotal += 1;
        }
        if (pageNumber > bookPageTotal) {
            bookList  = bookService.queryBookByPage(pageNumber - 1 );
            pageNumber--;
        } else {
            bookList  = bookService.queryBookByPage(pageNumber);
        }
        model.addAttribute("bookList", bookList);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("bookTotal", bookTotal);
        model.addAttribute("bookPageTotal", bookPageTotal);
        return "allBook";
    }

    // 修改书籍
    @RequestMapping("/updateBook")
    public String updateBook(Model model, int id) {
        Book book = bookService.queryBookById(id);
        System.out.println(book);
        model.addAttribute("book", book);
        return "updateBook";
    }

    @RequestMapping("/update")
    public String update(Model model, @Param("id") int id, @Param("name") String name, @Param("author") String author, @Param("version") String version, @Param("price") String price) {
        Book book = new Book(id, name, author, version, new BigDecimal(price));
        int i = bookService.updateBook(book);
        model.addAttribute("msg", "修改成功!请返回数据页面,刷新查看");
        return "updateBook";
    }


    // 添加书籍
    @RequestMapping("/add")
    public String addBook(Model model, @Param("name") String name, @Param("author") String author,
                          @Param("version") String version, @Param("price") String  price, @Param("img_path") String img_path, @Param("link") String link, @Param("extractioncode") String extractioncode ) {
        Book book = new Book(name, author, version, new BigDecimal(price) , img_path, link, extractioncode);
        int i = bookService.addBook(book);
        System.out.println(i);
        model.addAttribute("msg", "添加成功!请返回数据页面,刷新查看");
        return "addBook";
    }

    // 删除图书
    @RequestMapping("/deleteBook")
    public String deleteBook(@Param("pageNumber") int pageNumber, @Param("id") int id, Model model) {
        int result = bookService.deleteBook(id);
        bookTotal = Integer.parseInt(String.valueOf(bookService.queryBookTotal()));
        int bookPageTotal = bookTotal / 4;
        // 求总页数
        if (bookTotal % 4 > 0){
            bookPageTotal += 1;
        }
        if (pageNumber > bookPageTotal) {
            bookList  = bookService.queryBookByPage(pageNumber - 1 );
            pageNumber--;
        } else {
            bookList  = bookService.queryBookByPage(pageNumber);
        }
        model.addAttribute("bookList", bookList);
        model.addAttribute("pageNumber", pageNumber);
        model.addAttribute("bookTotal", bookTotal);
        model.addAttribute("bookPageTotal", bookPageTotal);
        return "allBook";
    }
}
