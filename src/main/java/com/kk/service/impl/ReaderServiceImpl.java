package com.kk.service.impl;

import com.kk.dao.ReaderMapper;
import com.kk.pojo.Reader;
import com.kk.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public Reader select(Reader rd) {
    return readerMapper.select(rd);
    }

    @Override
    public void add(Reader rd){
        readerMapper.add(rd);
    }

    @Override
    public Reader check(Map map) {
        return readerMapper.check(map);
    }


    @Override
    public void altpwd(Reader rd) {
        readerMapper.altpwd(rd);
    }

    @Override
    public void del(int id) {
        readerMapper.del(id);
    }

    @Override
    public List allReader() {
        return readerMapper.allReader();
    }
}
