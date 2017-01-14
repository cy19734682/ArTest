package com.yush.ar.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yush.ar.entity.Users;

public class MkUtil{
	private static final String[] HEADERS_TO_TRY = { 
	    "X-Forwarded-For",
	    "Proxy-Client-IP",
	    "WL-Proxy-Client-IP",
	    "HTTP_X_FORWARDED_FOR",
	    "HTTP_X_FORWARDED",
	    "HTTP_X_CLUSTER_CLIENT_IP",
	    "HTTP_CLIENT_IP",
	    "HTTP_FORWARDED_FOR",
	    "HTTP_FORWARDED",
	    "HTTP_VIA",
	    "REMOTE_ADDR" };
	/**
	 * 
	 * ID生成器xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
	 * @return
	 */
	public static String createId() {
		String id=createRandomCharData(5);
		for(int i=0;i++<=4;){
			id+="-"+createRandomCharData(5);
		}
		return id;
	}
	public static String createPicId(){
		String id=createRandomCharData(10);
		return id;
	}
	public static String createRandon(){
		String id=createRandomCharData(8);
		return id;
	}
	
	public static String  createTemUsername(){
		String id=createRandomCharData(6);
		
		return "yk_"+id;
	}
	
	/**
	 * 随机数生成，生成length位随机数
	 * @param length
	 * @return
	 */
	public static String  createRandomCharData(int length) {
		StringBuilder sb = new StringBuilder();
		Random rand = new Random();// 随机用以下三个随机生成器
		Random randdata = new Random();
		int data = 0;
		for (int i = 0; i < length; i++) {
			int index = rand.nextInt(3);
			// 目的是随机选择生成数字，大小写字母
			switch (index) {
			case 0:
				data = randdata.nextInt(10);// 仅仅会生成0~9
				sb.append(data);
				break;
			case 1:
				data = randdata.nextInt(26) + 65;// 保证只会产生65~90之间的整数
				sb.append((char) data);
				break;
			case 2:
				data = randdata.nextInt(26) + 97;// 保证只会产生97~122之间的整数
				sb.append((char) data);
				break;
			}
		}
		
		
		String result = sb.toString();
		return result;
	}
	
	
	public static String getMd5(String inStr)  
    {  
        String outStr=null;  
        if(inStr ==null)  
        {  
            outStr = null;  
        }  
        else if("".equals(inStr))  
        {  
            outStr = "";  
        }  
        else  
        {  
            try  
            {  
                MessageDigest md = MessageDigest.getInstance("MD5");  
                md.update(inStr.getBytes());  
                byte b[] = md.digest();  
                StringBuffer buf = new StringBuffer();  
                for(int i=1;i<b.length;i++)  
                {  
                    int c = b[i]>>>4 & 0xf;  
                    buf.append(Integer.toHexString(c));  
                    c = b[i]& 0xf;  
                    buf.append(Integer.toHexString(c));  
                }  
                outStr = buf.toString();  
            }  
            catch (NoSuchAlgorithmException e)  
            {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
        }  
        return outStr;  
    }  
	
	/**
	 * 获取用户session
	 * @param session
	 * @return
	 */
	public static Users getSessionUser(HttpSession session){
		Users users=(Users) session.getAttribute("users");
		
		return users;
	}
	
	/**
	 * 验证邮箱
	 * @param email
	 * @return
	 */
	public static boolean regEmail(String email){
		  boolean flag = false;
		  try{
		    String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		    Pattern regex = Pattern.compile(check);
		    Matcher matcher = regex.matcher(email);
		    flag = matcher.matches();
		   }catch(Exception e){
		    flag = false;
		   }
		  return flag;
  }
	
	
	 public static String genTimeStampString(Date date) {
	        java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(
	                "yyyy-MM-dd");
	        return df.format(date);
	   }
	 
	 /**
	  * 获取IP地址
	  * @param request
	  * @return
	  */
	 public static String getClientIpAddress(HttpServletRequest request) {
		    for (String header : HEADERS_TO_TRY) {
		        String ip = request.getHeader(header);
		        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
		            return ip;
		        }
		    }
		    return request.getRemoteAddr();
		}
	 /**
	  * 计算页数
	  * @param a
	  * @param b
	  * @return
	  */
	public static int   calPageCount(int   a,int   b){   
	    return   (a+b   -1)/b;   
	}
	 public static String getProjectHost(HttpServletRequest request){
		 String path = request.getContextPath();
	     String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	     return basePath;
	 }
	
}
