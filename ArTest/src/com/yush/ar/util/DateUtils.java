package com.yush.ar.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 
 *
 * @author tan jun
 * 
 */
public class DateUtils {

	/**
	 * 转换器
	 */
	private static SimpleDateFormat sdf = new SimpleDateFormat();
	/**
	 * 默认转换格式
	 */
	public static final String DEFAULT_PATTERN = "yyyy-MM-dd";
	public static final String TIME_PATTERN = "yyyyMMddHHmmss";
	public static final String TIMESIM_PATTERN = "yyyyMMddhhmmssSSS";
	/**
	 * 默认转换格式
	 * 
	 * @param source
	 *     时间
	 * @return
	 *     string
	 */
	public static String format(Date source) {
		return format(source, DEFAULT_PATTERN);
	}
	
	public static String format1(Date source) {
		return format(source, TIME_PATTERN);
	}
	public static String format2(Date source) {
		return format(source, TIMESIM_PATTERN);
	}
	
	/**
	 * 其他格式
	 * 
	 * @param source
	 *     来的时间
	 * @param pattern
	 *     格式
	 * @return
	 *     转后的时间
	 */
	public static String format(Date source, String pattern) {
		if(source == null) {
			return null;
		}
		sdf.applyPattern(pattern);
		
		return sdf.format(source);
	}
	
	/**
	 * String 转 Date
	 * 默认转换格式
	 * @param source
	 *     字符
	 * @return
	 *     默认转换字符
	 */
	public static Date parse(String source) {
		return parse(source, DEFAULT_PATTERN);
	}
	
	/**
	 * 其他格式  String 转 Date
	 * 
	 * @param source
	 *     字符
	 * @param pattern
	 *     格式
	 * @return
	 *  
	 */
	public static Date parse(String source, String pattern) {
		
		if(StringUtils.isEmpty(source)) {
			return null;
		}
		
		sdf.applyPattern(pattern);
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * Date 转化 java.sql.Date
	 * 
	 * @param date 
	 *    
	 * @return
	 *     
	 */
	public static java.sql.Date toSqlDate(Date date) {
		return new java.sql.Date(date.getTime());
	}
	
	/**
	 * Date 转化  java.sql.Timestamp
	 * 
	 * @param date
	 *     
	 * @return
	 *     
	 */
	public static java.sql.Timestamp toTimestamp(Date date) {
		return new java.sql.Timestamp(date.getTime());
	}
}
