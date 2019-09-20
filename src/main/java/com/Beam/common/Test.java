package com.Beam.common;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {
    public static void main(String[] args) {
    
    }
/**
     为数据库图片加上
     “http://192.168.199.161:8080/images/BuDaiMo/region_1/”字段
     的方法

    List<String> pulsLink(Map<String, Object> map, String ziDuan){
        String string = (String) map.get(ziDuan);
        String [] strings = string.split("，");
        List<String> list = new ArrayList<>();
        for (int i = 0; i < strings.length; i++) {
            String str = strings[i];
            string = "http://192.168.199.161:8080/images/BuDaiMo/region_1/"+str;
            list.add(string);
        }
        return list;

    }
     **/
    String nowTime(){
        //设置日期格式
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // new Date()为获取当前系统时间
        return df.format(new Date());
    }
}
