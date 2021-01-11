package com.kk.dao;

import com.kk.pojo.Reader;

public interface ReaderMapper {
    Reader select(Reader rd);

    void altpwd(Reader rd);
}
