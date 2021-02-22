package com.kk.service.impl;

import com.kk.dao.BookMapper;
import com.kk.pojo.Books;
import com.kk.pojo.LendHistory;
import com.kk.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;


    @Override
    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    @Override
    public void minusOne() {
        bookMapper.minusOne();
    }

    @Override
    public int deleteBook(int id) {
        return bookMapper.deleteBook(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    @Override
    public Books queryById(int id) {
        return bookMapper.queryById(id);
    }

    @Override
    public List<Books> queryAllBook(HashMap map) {
        return bookMapper.queryAllBook(map);
    }

    @Override
    public List<LendHistory> lendHistory(String user) {
        return bookMapper.lendHistory(user);
    }

    @Override
    public void addLendHis(LendHistory lend) {
           bookMapper.addLendHis(lend);
    }

    @Override
    public int deleteHis(int id) {
        return 0;
    }

    @Override
    public int updateHis(Books books) {
        return 0;
    }

    @Override
    public LendHistory queryHisById(int id) {
        return null;
    }

    @Override
    public List<LendHistory> queryAll() {
        return bookMapper.queryAll();
    }

    @Override
    public Books lendBook() {
        return null;
    }

    @Override
    public List<Books> lendList() {
        return null;
    }

    @Override
    public void addLendBook(Books lend) {
        bookMapper.addLendBook(lend);
    }

    @Override
    public int deleteLend(int id) {
        bookMapper.deleteLend(id);
        return 0;
    }

    @Override
    public int updateLend(Books books) {
        return 0;
    }

    @Override
    public Books queryLenById(int id) {
        return bookMapper.queryLenById(id);
    }

    @Override
    public List<Books> fyAllBook() {
        return bookMapper.fyAllBook();
    }

}
