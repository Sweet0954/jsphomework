package com.sweet.service;

import com.sweet.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    // 分页查询书籍
    List<Book> queryBookByPage(int pageNumber);
    // 查询总记录
    Object queryBookTotal();
    // 根据价格查询书籍
    List<Book> queryBookByPrice(int pageNumber,int min, int max);
    // 查询该价格区间的总记录数
    Object queryBookTotalByPrice(int min, int max);
    // 根据id查询书籍
    Book queryBookById(int id);
    // 修改书籍信息
    int updateBook(Book book);
    // 添加书籍
    int addBook(Book book);
    // 根据id删除书籍
    int deleteBook(int id);
}
