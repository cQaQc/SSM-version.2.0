package com.kk.service.impl;

import com.kk.dao.BookMapper;
import com.kk.pojo.Books;
import com.kk.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookDao;


    @Override
    public int addBook(Books books) {
        return bookDao.addBook(books);
    }

    @Override
    public int deleteBook(int id) {
        return bookDao.deleteBook(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookDao.updateBook(books);
    }

    @Override
    public Books queryById(int id) {
        return bookDao.queryById(id);
    }

    @Override
    public List<Books> queryAllBook() {
        return bookDao.queryAllBook();
    }

    @Override
    public List<Books> fyAllBook() {
        return bookDao.fyAllBook();
    }
}
