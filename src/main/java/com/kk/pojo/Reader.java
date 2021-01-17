package com.kk.pojo;

import lombok.Data;

import java.math.BigInteger;

@Data
public class Reader {
    private int id;
    private BigInteger sno;
    private String pwd;
    private String name;
    private String major;
    private String birth;
}
