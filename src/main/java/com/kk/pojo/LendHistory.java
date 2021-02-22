package com.kk.pojo;

import lombok.Data;

@Data
public class LendHistory {
    private int id;
    private String name;
    private int bookID;
    private String bookName;
    private String lendTime;
    private String backTime;
    private int count;
    private int state;  // 1.已归还  2.未还
}
