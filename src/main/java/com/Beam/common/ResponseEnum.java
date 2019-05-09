package com.Beam.common;

public enum  ResponseEnum {
    SUCCESS(200,"请求成功!"),
    ERROR  (400,  "请求失败!");

    private Integer code;
    private String msg;
    private Integer total;



    ResponseEnum(Integer code, String msg){
        this.code = code;
        this.msg = msg;

    }
    ResponseEnum(Integer code, String msg, Integer total){
        this.code = code;
        this.msg = msg;
        this.total = total;
    }


    public Integer getTotal() {
        return total;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
