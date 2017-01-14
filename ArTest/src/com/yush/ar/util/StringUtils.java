package com.yush.ar.util;

import java.util.UUID;
/**
 * String类型装换工具类
 * @author Chen Yue
 *2015年4月8日,下午11:15:59
 */
public class StringUtils {
     
	public static boolean isEmpty(String source) {
		return source == null || source.isEmpty();
	} 
	
	public static boolean notEmpty(String source) {
		return !isEmpty(source);
	}
	
	public static String uuid36() {
		return UUID.randomUUID().toString();
	}
	
	public static String uuid32() {
		return uuid36().replace("-", "");
	}
}
