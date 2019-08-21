package com.Beam.utils;

import com.Beam.po.user;

import java.util.Calendar;

public class TokenUtils {

    public static String getToken(user user){
        Calendar c=Calendar.getInstance();
        String qms = MD5Utils.calc("qms"+c.get(Calendar.MILLISECOND));
        //拼接唯一登录用户token
        long l = System.currentTimeMillis();
        long time=l + 30*60*1000;
        String token = qms +"#"+user.getUser_id() + "#" + user.getUser_id() +"#"+user.getPassword()+"#"+user.getUser_name()+"#"+time;
        return Base64Utils.getBase64(Base64Utils.getBase64(token));
    }

    public static String[] resolveToken(String token){
        String tokenR=Base64Utils.getFromBase64(Base64Utils.getFromBase64(token));
        String[] split = tokenR.split("#");
        return split;
    }
}
