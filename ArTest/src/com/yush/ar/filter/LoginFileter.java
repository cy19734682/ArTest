package com.yush.ar.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yush.ar.util.MkUtil;



public class LoginFileter implements Filter{

	private FilterConfig config = null;  
	private final String[] NULL_STRING_ARRAY = new String[0];  
    private final String URL_SPLIT_PATTERN = "[, ;\r\n]";//逗号  空格 分号  换行 
    /** 
     * 白名单 
     */ 
    private String[] whiteListURLs = null; 
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest request1=(HttpServletRequest) request;   
        HttpServletResponse response1  =(HttpServletResponse) response;    
        HttpSession session = request1.getSession(true); 
        String url=request1.getServletPath();
        
        if (isWhiteURL(url)) {
	    	 //System.out.println("filter whitelist,url="+url);
   		 chain.doFilter(request, response);
   		 return;
		} 
		if(session==null||session.getAttribute("admin") == null){
			response1.sendRedirect(MkUtil.getProjectHost(request1)+"admin/log_in.jsp");
			return ;
		};
		chain.doFilter(request, response);
		
	}
   
	
	private String[] strToArray(String urlStr) {  
        if (urlStr == null) {  
            return NULL_STRING_ARRAY;  
        }  
        String[] urlArray = urlStr.split(URL_SPLIT_PATTERN);  
        List<String> urlList = new ArrayList<String>();  
        for (String url : urlArray) {  
            url = url.trim();  
            if (url.length() == 0) {  
                continue;  
            }  
            urlList.add(url);  
        }  
        return urlList.toArray(NULL_STRING_ARRAY);  
    } 
	
	private boolean isWhiteURL(String currentURL) {  
        for (String whiteURL : whiteListURLs) {  
        	if(currentURL.toLowerCase().indexOf(whiteURL.toLowerCase())>-1)
        	{
        		return true;
        	}
        }  
        return false;  
    }
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		this.config = fConfig;  
		String whiteListUrl = this.config.getInitParameter("tologin");
		whiteListURLs=strToArray(whiteListUrl);
		
	}

}
