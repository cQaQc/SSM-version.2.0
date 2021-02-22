package com.kk.service;

import com.kk.pojo.Books;
import com.kk.pojo.LendHistory;

import java.util.HashMap;
import java.util.List;

public interface BookService {
    //bookes
    int addBook(Books books);

    void minusOne();

    int deleteBook(int id);

    int updateBook(Books books);

    Books queryById(int id);

    List<Books> queryAllBook(HashMap map);

    List<Books> fyAllBook();

    //lendhistory
    List<LendHistory> lendHistory(String user);

    void addLendHis(LendHistory lend);

    int deleteHis(int id);

    int updateHis(Books books);

    LendHistory queryHisById(int id);

    List<LendHistory> queryAll();

    //lendbook
    Books lendBook();

    List<Books> lendList();

    void addLendBook(Books lend);

    int deleteLend(int id);

    int updateLend(Books books);

    Books queryLenById(int id);

}
