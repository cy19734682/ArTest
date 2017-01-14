package com.yush.ar.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.Userlevel;
import com.yush.ar.entity.Users;
import com.yush.ar.util.BaseAction;

public interface UserService{
	public MkResult checkName(String name,String pwd, HttpServletRequest request);
	/*public MkResult addUsers(Users users);*/

	public MkResult addUsers(Users usrs,String openid, String type, String repassowrd, String kaptchaRandom, String kaptchaImage);

	public Users checkUser(String username);
	
	public MkResult getByIdUsers(String userId);

	public Users checkEmail(String email);

	public MkResult addTemUser(HttpServletRequest request);

	public Users getNameUsers(String username);

	public MkResult perfectUser(Users usrs);

	public MkResult editUser(Users users, Integer userid);
	
	
	public String registerUser(String name, String password, String retry_password, String email);

	public String unityLogin(String name, String password);

	public Map<String, String> unityTemp();

	public MkResult logout(Users users);
	public void forceLogoutUser(Integer uid);

	public MkResult bangdUsers(String username, String password,String openId,String type, HttpServletRequest request);

	public MkResult listUser(String pagenow, String state);

	public MkResult updateUserState(String userIds, int state);

	public MkResult getFeisiList(String userId, String pagenow,int type);

}
