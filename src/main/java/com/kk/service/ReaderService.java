package com.kk.service;

import com.kk.pojo.Admin;
import com.kk.pojo.Reader;

public interface ReaderService {
    Reader select(Reader rd);

    void altpwd(Reader rd);
}
