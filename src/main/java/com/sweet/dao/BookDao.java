package com.sweet.dao;

import com.sweet.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    // 分页查询所有书籍
    List<Book> queryBookByPage(int pageNumber);
    // 查询总记录数
    Object queryBookTotal();
    // 根据价格查询书籍
    List<Book> queryBookByPrice(@Param("pageNumber") int pageNumber, @Param("min") int min, @Param("max") int max);
    // 查询该价格区间的总记录数
    Object queryBookTotalByPrice(@Param("min") int min, @Param("max") int max);
    // 根据id查询书籍
    Book queryBookById(@Param("id") int id);
    // 修改书籍信息
    int updateBook(Book book);
    // 添加书籍
    int addBook(Book book);
    int addBookNoImg(Book book);
    // 根据id删除书籍
    int deleteBook(@Param("id") int id);
}
