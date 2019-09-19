package com.Beam.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DatePrimaryKey {

//        获取6位随机数加10位时间戳
public static String getDatePrimaryKey() {
        return getRandomCAN(6) + getSimpleDateFormat();
    }
    
//        获取当前时间戳
    public static String getSimpleDateFormat(){
        String[] strNow = new SimpleDateFormat("MMddHHms").format(new Date()).toString().split("-");
        String str="";
        for (String string : strNow) {
            str=str + string;
        }
        return str;
    }
    
//    获取随机数和字母结合
    public static String getRandomCAN(int length) {
        StringBuffer valSb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            String charOrNum = Math.round(Math.random()) % 2 == 0 ? "char" : "num"; // 输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                // 字符串
                int choice = Math.round(Math.random()) % 2 == 0 ? 65 : 97;  // 取得大写字母还是小写字母
                
                valSb.append((char) (choice + Math.round(Math.random() * 25)));
                
            } else if ("num".equalsIgnoreCase(charOrNum)) {
                // 数字
                valSb.append(String.valueOf(Math.round(Math.random() * 9)));
            }
        }
        return valSb.toString();
    }
}
