package com.yush.ar.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yush.ar.entity.MkResult;


public interface AdminService {
  public MkResult checkName(String username,String password, Boolean remember, HttpServletRequest request, HttpServletResponse response) throws Exception;

public MkResult listAdmin(String pagenow);

public MkResult editUser(String userid, String password, String name)throws Exception;

public MkResult addUser(String username, String password, String name)throws Exception;

public MkResult delUser(String userid, HttpServletRequest request);

public MkResult toLogin(HttpServletRequest request) throws Exception;


}
