package com.kk.service;


import com.kk.pojo.Admin;

import java.util.Map;

public interface AdminService {
    Admin select(Admin ad);

    Admin check(Map map);

    void altpwd(Admin ad);
}
