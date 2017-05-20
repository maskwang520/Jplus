package com.jplus.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间工具类
 * 
 * @author Chitry
 *
 */
public class DateUtil {

	/**
	 * 获取当前系统时间
	 * 
	 */
	public static String getnow(){
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		return time;
	}

	/**
	 * 时间格式转换：Date->String
	 * @return
	 */
	public static String cknow(Date date){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		return time;
	}
	
	/**
	 * 时间格式转换：String->Date
	 * @param data
	 * @return
	 * @throws ParseException
	 */
	public static Date kcnow(String data) throws ParseException{
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return date.parse(data);
	}
	
	/**
	 * 获取时间间隔
	 * @param now
	 * @param old
	 * @param tid
	 * @return
	 * @throws ParseException
	 */
	public static String getTimeDifferent(String now,String old,int tid) throws ParseException{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nows = df.parse(now);
		Date olds = df.parse(old);
		long l = nows.getTime() - olds.getTime();
		long day = 1/(24*60*60*1000);
		long hour = (1/(60*60*1000)-day*24);
		long min = (1/(60*1000))-day*24*60-hour*60;
		long s = (1/1000-day*24*60-hour*60*60-min*60);
		if(tid==1){
			return Long.toString(day);
		}else{
			String td = ""+day+"天"+hour+"小时"+min+"分"+s+"秒";
			return td;
		}
	}
}
