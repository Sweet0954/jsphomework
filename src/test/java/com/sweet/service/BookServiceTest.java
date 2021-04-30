package com.sweet.service;

import com.sweet.pojo.Book;
import com.sweet.service.serviceImpl.BookServiceImpl;
import org.junit.Test;

import java.util.List;

public class BookServiceTest {
    private BookService bookService = new BookServiceImpl();

    @Test
    public void test1() {
        int pageNumber = 1;
        System.out.println(bookService);
        List<Book> bookList = bookService.queryBookByPage(pageNumber);
        for (Book book : bookList) {
            System.out.println(book);
        }
    }
}
