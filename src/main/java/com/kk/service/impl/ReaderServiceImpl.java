package com.kk.service.impl;

import com.kk.dao.ReaderMapper;
import com.kk.pojo.Reader;
import com.kk.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderMapper readerMapper;
    @Override
    public Reader select(Reader rd) {
    return readerMapper.select(rd);
    }

    @Override
    public void altpwd(Reader rd) {
readerMapper.altpwd(rd);
    }
}
