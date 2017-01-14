package com.yush.ar.oauth;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.yush.ar.dao.UserDao;
import com.yush.ar.entity.Users;
import com.yush.ar.util.BaseAction;
import com.yush.ar.util.MyEncrypt;

@Service
public class OAuthService extends BaseAction{
	    
		@Resource
		private UserDao userDao;
	    
	    /**
		 * 获取登录授权
	     * @param type 
		 * @return
		 */
	    public String getLoginUrl(String type) {
	        return OAuthConfig.getOAuthService(type);
	    }
	
	    /**
	     * 使用 code 换取 access token
	     *
	     * @param code 成功登陆后 第三方 Server 返回给回调 URL 的中间 code，用于换取 access token
	     * @return 返回 第三方 服务的 token
	     * @throws Exception 
	     */
	    public String getToAccessToken(String type,String code){
	    	String access_token=null;
			try {
				access_token = OAuthConfig.getAccessToken(type, code);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return access_token;
	    }
	    
	    /**
	     * 获取第三方账号的唯一ID
	     * @param type
	     * @param accessToken
	     * @return
	     */
	    public String getUserInfoId(String type,String accessToken){
	    	String openid = null;
			try {
				openid=OAuthConfig.getOAuthUserInfoId(accessToken, type);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return openid;
	    	
	    }
	    
	    /**
	     * 检查是否已绑定
	     * @param githubId
	     * @return
	     */
	    public Users  checkOauthUser(String type,String githubId){
	    	Users users=userDao.checkOauthUser(type,githubId);
			return users;
	    }
	    
}
