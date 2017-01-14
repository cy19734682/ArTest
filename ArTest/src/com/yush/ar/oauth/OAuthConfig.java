package com.yush.ar.oauth;


import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.github.scribejava.apis.FacebookApi;
import com.github.scribejava.apis.GitHubApi;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.yush.ar.util.MyEncrypt;
import com.yush.ar.util.PropertyUtil;

public class OAuthConfig {
	
	    public static final String CALLBACK_URL = "%s/oauth/%s/callback.do";
	    
		public	static String host=PropertyUtil.getProperty("oAuth.host");
		/**
		 * github配置
		 */
	    public	static  String githubscope=PropertyUtil.getProperty("oAuth.github.scope");
	    public	static  String state=PropertyUtil.getProperty("oAuth.github.state");
	    public	static  String githubClientId=PropertyUtil.getProperty("oAuth.github.clientId");
	    public	static  String githubClientSecret=PropertyUtil.getProperty("oAuth.github.clientSecret");
	    public	static  String githubauthorize_url=PropertyUtil.getProperty("oAuth.github.authorize_url");
	    public	static  String githubatokenUrl=PropertyUtil.getProperty("oAuth.github.atokenUrl");
	    public  static  String gitgetUserInfo_url=PropertyUtil.getProperty("oAuth.github.getUserInfo_url");
	   
	    /**
	     * baidu配置
	     * 
	     */
	    public	static  String baiduClientId=PropertyUtil.getProperty("oAuth.baidu.clientId");
	    public	static  String baiduClientSecret=PropertyUtil.getProperty("oAuth.baidu.clientSecret");
	    public	static  String baiduauthorize_url=PropertyUtil.getProperty("oAuth.baidu.authorize_url");
	    public	static  String baiduatokenUrl=PropertyUtil.getProperty("oAuth.baidu.atokenUrl");
	    public	static  String baidugetUserInfo_url=PropertyUtil.getProperty("oAuth.baidu.getUserInfo_url");
	    
	    /**
	     * baidu配置
	     * 
	     */
	    public	static  String weiboClientId=PropertyUtil.getProperty("oAuth.weibo.clientId");
	    public	static  String weiboClientSecret=PropertyUtil.getProperty("oAuth.weibo.clientSecret");
	    public	static  String weiboauthorize_url=PropertyUtil.getProperty("oAuth.weibo.authorize_url");
	    public	static  String weiboatokenUrl=PropertyUtil.getProperty("oAuth.weibo.atokenUrl");
	    public	static  String weibogetUserInfo_url=PropertyUtil.getProperty("oAuth.weibo.getUserInfo_url");
	    
	    /**
	     * qq配置
	     * 
	     */
	    public	static  String qqClientId=PropertyUtil.getProperty("oAuth.qq.clientId");
	    public	static  String qqClientSecret=PropertyUtil.getProperty("oAuth.qq.clientSecret");
	    public	static  String qqcallback_url=PropertyUtil.getProperty("oAuth.qq.callback_url");
	    public	static  String qqauthorize_url=PropertyUtil.getProperty("oAuth.qq.authorize_url");
	    public	static  String qqatokenUrl=PropertyUtil.getProperty("oAuth.qq.atokenUrl");
	    public	static  String qqgetOpenid_url=PropertyUtil.getProperty("oAuth.qq.getOpenid_url");
	    public	static  String qqgetUserInfo_url=PropertyUtil.getProperty("oAuth.qq.getUserInfo_url");
	    /**
	     * 获取github
	     * @return
	     */
	  /*  public  static OAuth20Service getGitHubOAuthService(){
	        return new ServiceBuilder()
	            .apiKey(fbClientId)
	            .apiSecret(fbClientSecret)
	            .callback(String.format(CALLBACK_URL, host,"facebook"))
	            .build(FacebookApi.instance());
	    }*/
	    
	    /**
	     * 获取第三方登录授权并回调
	     * @return
	     */
	    public  static String getOAuthService(String type){
	    	String authorize_url = "";
	    	System.out.println("哈哈哈哈哈哈哈");
	    	if(type!=null&&!type.equals("")){
	    	String callbackurl=String.format(CALLBACK_URL,host,type);
	    	 if(type.equalsIgnoreCase("baidu")){
	    		authorize_url=String.format(baiduauthorize_url, baiduClientId,callbackurl);
	    	 }
	    	 else if(type.equalsIgnoreCase("github")){
	    		authorize_url=String.format(githubauthorize_url, githubClientId,callbackurl);
	    	 }
	    	 else if(type.equalsIgnoreCase("weibo")){
	    		 authorize_url=String.format(weiboauthorize_url, weiboClientId,callbackurl); 
	    	 }else if(type.equalsIgnoreCase("qq")){
	    		 authorize_url=String.format(qqauthorize_url, qqClientId,callbackurl); 
	    	 }
	    	 
	    	}
	        return authorize_url;
	    }
	    
	    /**
	     * 获取用户access_token
	     * @return
	     * @throws Exception 
	     */
	    public  static String getAccessToken(String type,String code){
	    	String atokenUrl = "";
	    	JSONObject ret;
	    	String resstr;
	    	String access_token="";
	    	try {
		    	if(type!=null&&!type.equals("")){
			    	 String callbackurl=String.format(CALLBACK_URL,host,type);
			    	 if(type.equalsIgnoreCase("baidu")){
			    		 atokenUrl=String.format(baiduatokenUrl, baiduClientId,baiduClientSecret,callbackurl,code);
			    		 resstr = MyEncrypt.get(atokenUrl);
			    		 ret=JSON.parseObject(resstr);
			    		 access_token=(String) ret.get("access_token");
			    	 }
			    	 else if(type.equalsIgnoreCase("github")){
			    		 atokenUrl=String.format(githubatokenUrl, githubClientId,githubClientSecret,code,callbackurl); 
			    		 resstr = MyEncrypt.get(atokenUrl);
			    		 access_token=MyEncrypt.paramSplit(resstr).get("access_token");
			    	 }
			    	 else if(type.equalsIgnoreCase("weibo")){
			    		 atokenUrl=String.format(weiboatokenUrl, weiboClientId,weiboClientSecret,callbackurl,code); 
			    		 resstr = MyEncrypt.post(atokenUrl); //微博要用post请求。玛德智障
			    		 ret=JSON.parseObject(resstr);
			    		 access_token=(String)ret.get("access_token");
			    	 }
			    	 else if(type.equalsIgnoreCase("qq")){
			    		 atokenUrl=String.format(qqatokenUrl, qqClientId,qqClientSecret,callbackurl,code); 
			    		 resstr = MyEncrypt.get(atokenUrl);
			    		 access_token=MyEncrypt.paramSplit(resstr).get("access_token");
			    	 }
		    	}
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return access_token;
	    }
	    
	    /**
	     * 获取用户唯一ID
	     * @return
	     */
	    public static String getOAuthUserInfoId(String accessToken,String type){
	    	String userInfo_url;
	        JSONObject json;
	        String strjson;
	        String openid=null;
			try {
				if(type!=null&&!type.equals("")){
					 if(type.equalsIgnoreCase("baidu")){
						 userInfo_url = String.format(baidugetUserInfo_url, accessToken);
						 strjson = MyEncrypt.get(userInfo_url);
						 json=JSON.parseObject(strjson);
						 openid=json.get("userid").toString();
					}else if(type.equalsIgnoreCase("github")){
					 	userInfo_url = String.format(gitgetUserInfo_url, accessToken);
					 	strjson = MyEncrypt.get(userInfo_url);
					 	 json=JSON.parseObject(strjson);
					    openid=json.get("id").toString();
					}else if(type.equalsIgnoreCase("weibo")){
					 	userInfo_url = String.format(weibogetUserInfo_url, accessToken);
					 	 strjson = MyEncrypt.post(userInfo_url); //微博要用post请求。玛德智障
					 	 json=JSON.parseObject(strjson);
					     openid=json.get("uid").toString();
					}
					else if(type.equalsIgnoreCase("qq")){
						 System.out.println("access_token:"+accessToken);
					 	 userInfo_url = String.format(qqgetOpenid_url, accessToken);
					 	 strjson = MyEncrypt.get(userInfo_url); //返回 callback( {"client_id":"YOUR_APPID","openid":"YOUR_OPENID"} ); 格式的包
					 	 
					 	  Matcher m = Pattern.compile("\"openid\"\\s*:\\s*\"(\\w+)\"").matcher(strjson);//用正则表达式取出openid
					        if(m.find()){
					        	openid = m.group(1);
					        }else {
					           throw new Exception("server error!");
							}
					     //String sda= String.format(qqgetUserInfo_url,accessToken,qqClientId,openid);//获取QQ的用户信息
					     //strjson = MyEncrypt.get(sda);
					     //System.out.println(strjson);
					     
					}
				}	
					
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
			return openid;
	    }
	    
	    
	    
}
