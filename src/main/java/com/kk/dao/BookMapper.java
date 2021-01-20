package com.kk.dao;

import com.kk.pojo.Books;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

public interface BookMapper {
//    增
    int addBook(Books books);

    int deleteBook(int id);

    int updateBook(Books books);

    Books queryById(int id);

    List<Books> queryAllBook(HashMap map);

    List<Books> fyAllBook();
}
