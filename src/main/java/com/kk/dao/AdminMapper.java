package com.kk.dao;


import com.kk.pojo.Admin;

public interface AdminMapper {

    Admin select(Admin ad);

    void altpwd(Admin ad);
}
