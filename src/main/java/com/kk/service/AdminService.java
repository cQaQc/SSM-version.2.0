package com.kk.service;


import com.kk.pojo.Admin;

public interface AdminService {
    Admin select(Admin ad);

    void altpwd(Admin ad);
}
