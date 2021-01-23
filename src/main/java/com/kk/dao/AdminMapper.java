package com.kk.dao;


import com.kk.pojo.Admin;

import java.util.Map;

public interface AdminMapper {

    Admin select(Admin ad);

    Admin check(Map map);

    void altpwd(Admin ad);
}
