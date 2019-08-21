package com.Beam.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
    public static String format="yyyy-MM-dd HH:mm:ss";

    public static String format2="yyyy-MM-dd";

    public static String getSystemDate(){
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        String format = sdf.format(new Date());
        return format;
    }

    public static String getYearMonthDay(){
        SimpleDateFormat sdf=new SimpleDateFormat(format2);
        String format = sdf.format(new Date());
        return format;
    }

    public static String addSeconds(Date date, int seconds) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.SECOND, seconds);
        SimpleDateFormat sdf=new SimpleDateFormat(format);
        return sdf.format(calendar.getTime());
    }

    public static void main(String ... arg){
        try {
            boolean after = com.Beam.utils.TimeUtils.isAfter("2019-01-04 14:00:00", "2019-01-05 14:00:00", format);
            System.out.println(after);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

}
