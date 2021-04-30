package com.sweet.service.serviceImpl;

import com.sweet.dao.BookDao;
import com.sweet.pojo.Book;
import com.sweet.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    // 必须要加上set方法
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public List<Book> queryBookByPage(int pageNumber) {
        // 分页传参更改
        pageNumber = (pageNumber - 1) * 4;
        return bookDao.queryBookByPage(pageNumber);
    }

    public Object queryBookTotal() {
        return bookDao.queryBookTotal();
    }

    public List<Book> queryBookByPrice(int pageNumber, int min, int max) {
        // 分页传参更改
        pageNumber = (pageNumber - 1) * 4;
        return bookDao.queryBookByPrice(pageNumber,min, max);
    }

    public Object queryBookTotalByPrice(int min, int max) {
        return bookDao.queryBookTotalByPrice(min, max);
    }

    public Book queryBookById(int id) {
        return bookDao.queryBookById(id);
    }

    public int updateBook(Book book) {
        return bookDao.updateBook(book);
    }

    public int addBook(Book book) {
        if (book.getImgPath() == null) {
            return bookDao.addBookNoImg(book);
        } else {
            return bookDao.addBook(book);
        }
    }

    public int deleteBook(int id) {
        return bookDao.deleteBook(id);
    }
}
