package com.tgzzzxweb;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Date;
import java.sql.*;

import ognl.DefaultTypeConverter;

public class DateConverter extends DefaultTypeConverter {

    private String[] patterns = new String[] { "yyyy","yyyyMMdd", "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm:ss", "HH:mm", "yyyy-MM-dd" };

    @SuppressWarnings("rawtypes")
    public Object convertValue(Map context, Object value, Class toType) {
        try {
            if (toType == Date.class) {
                String dataStr = ((String[]) value)[0];
                System.out.println(dataStr);
                for (int i = 0; i < patterns.length; i++) {
                    if (patterns[i].length() == dataStr.length()) {
                        SimpleDateFormat f = new SimpleDateFormat(patterns[i], java.util.Locale.US);
                        Date date = f.parse(dataStr);
                        System.out.println(date);
                        java.sql.Date date1 = new java.sql.Date(date.getTime());
                        return date;
                    }
                }
            } else if (toType == String.class) {
                String dataStr = ((Date) value).toString();
                System.out.println(dataStr);
                return dataStr;
            }
            else if(toType == java.sql.Time.class){
                String dataStr = ((String[]) value)[0];
                SimpleDateFormat format = new SimpleDateFormat("HH:mm");
                java.util.Date d = null;
                d = format.parse(dataStr);
                java.sql.Time time = new java.sql.Time(d.getTime());
                System.out.println(time);
                //System.out.println(time.valueOf(dataStr));
                return time;
            }
            else if(toType == java.sql.Date.class){
                String dataStr = ((String[]) value)[0];
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date d = null;
                d = format.parse(dataStr);
                java.sql.Date date = new java.sql.Date(d.getTime());
                return date;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;

    }
}