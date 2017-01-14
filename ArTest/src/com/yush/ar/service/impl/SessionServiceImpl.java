package com.yush.ar.service.impl;

import javax.annotation.Resource;

import com.yush.ar.dao.UserDao;
import com.yush.ar.entity.Users;
import com.yush.ar.service.SessionService;

public class SessionServiceImpl implements SessionService{
	@Resource
	private UserDao userDao;
	
	public void logout(Users users) {
		System.out.println("ID："+users.getUserId());
		userDao.clearIp(users.getUserId());
		System.out.println(users.getRandomKey());
		userDao.setEndTime(users.getUserId(),users.getRandomKey());
	}
}
