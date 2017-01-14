package com.yush.ar.entity;

import java.util.List;

public class Users {
	
	
	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 密码
	 */
	private String passWord;
	/**
	 * 是否注册
	 */
	private String isRegistered;
	/**
	 * 所属角色
	 */
	private String roleId;

	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 真实姓名
	 */
	private String realName;
	/**
	 * 性别
	 */
	private String gender;
	/**
	 * 出生日期
	 */
	private String birthday;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 手机
	 */
	private String mobilePhone;
	/**
	 * 注册时间
	 */
	private String registerTime;
	/**
	 * 账号状态（是否为正式账号）0-正式账号，1-临时账号（可以修改一次用户名）
	 */
	private String userStatus;
	/**
	 * qq
	 */
	private String qq;
	/**
	 * 微博
	 */
	private String weiBo;
	/**
	 * github
	 */
	private String gitHub;
	/**
	 * baiDu
	 */
	private String baiDu;
	
	/**
	 * 邮箱状态（是否激活）0-激活，1-未激活
	 */
	private int emailStatus;
	
	/**
	 * ip地址
	 */
	private String loginIP;
	
	private String randomKey;
	private String last_login_time;
	private static Users instance;

	
	public static Users getInstance() {
		if (instance == null) {
			// response=_response;
			// response.setContentType("text/json;charset=utf-8");
			// response.setCharacterEncoding("UTF-8");
			instance = new Users();
		}
		return instance;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public String getIsRegistered() {
		return isRegistered;
	}


	public void setIsRegistered(String isRegistered) {
		this.isRegistered = isRegistered;
	}


	public String getRoleId() {
		return roleId;
	}


	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getRealName() {
		return realName;
	}


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getMobilePhone() {
		return mobilePhone;
	}


	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}


	public String getRegisterTime() {
		return registerTime;
	}


	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}


	public String getUserStatus() {
		return userStatus;
	}


	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getWeiBo() {
		return weiBo;
	}


	public void setWeiBo(String weiBo) {
		this.weiBo = weiBo;
	}


	public String getGitHub() {
		return gitHub;
	}


	public void setGitHub(String gitHub) {
		this.gitHub = gitHub;
	}


	public String getBaiDu() {
		return baiDu;
	}


	public void setBaiDu(String baiDu) {
		this.baiDu = baiDu;
	}


	public int getEmailStatus() {
		return emailStatus;
	}


	public void setEmailStatus(int emailStatus) {
		this.emailStatus = emailStatus;
	}


	public String getLoginIP() {
		return loginIP;
	}


	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}


	public String getRandomKey() {
		return randomKey;
	}


	public void setRandomKey(String randomKey) {
		this.randomKey = randomKey;
	}


	public String getLast_login_time() {
		return last_login_time;
	}


	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}


	public static void setInstance(Users instance) {
		Users.instance = instance;
	}

}
