package com.Beam.utils;

import java.io.UnsupportedEncodingException;
import org.apache.commons.codec.binary.Base64;

public class Base64Utils {

    public static void main(String ... arg){

        String s=getBase64(getBase64("b37ef7ed27bc8adf06ced4583024bb4d#19#0607170126#1#1#2017"));
        System.out.println(s);
        System.out.println(getFromBase64(getFromBase64(s)));


    }

    // 加密
    public static String getBase64(String str) {
        byte[] b = null;
        String s = null;
        try {
            b = str.getBytes("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if (b != null) {
            s=Base64.encodeBase64String(b);
        }
        return s;
    }
 
    // 解密
    public static String getFromBase64(String s) {
        byte[] b = null;
        String result = null;
        if (s != null) {
            Base64 decoder = new Base64();
            try {
                b = decoder.decode(s);
                result = new String(b, "utf-8");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}