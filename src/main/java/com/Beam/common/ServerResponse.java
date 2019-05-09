package com.Beam.common;

import java.io.Serializable;

public class ServerResponse implements Serializable {
    private static final long serialVersionUID = 8156187193274650130L;

    private Integer code;

    private String msg;

    private Object data;

    private Integer total;

    public static ServerResponse success(Object data){
        return new ServerResponse(200,"请求成功!",data);
    }

    public static ServerResponse success(int code,String msg,Object data){
        return new ServerResponse(code,msg,data);
    }

    public static ServerResponse success(Object data, int total){
        return new ServerResponse(200,"请求成功!",data,total);
    }

    public static ServerResponse error(){
        return new ServerResponse(400,"登录错误");
    }

    public static ServerResponse error(int code,String msg){
        return new ServerResponse(code,msg);
    }

    public ServerResponse(Integer code,String msg,Object data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    public ServerResponse(Integer code,String msg,Object data,Integer total){

        this.total = total;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    public ServerResponse(Integer code,String msg){
        this.msg = msg;
        this.code = code;
    }


    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Integer getTotal() {

        return total;
    }

    public Object getData() {
        return data;
    }

}
