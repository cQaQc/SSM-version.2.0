package com.kk.utils;

import lombok.Data;

@Data
public class AjaxResult {

    private boolean success;

    private String msg;
    private String stu;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

}
