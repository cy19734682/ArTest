package com.yush.ar.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

public class BaseAction {
	protected HttpServletRequest request;

	protected HttpServletResponse response;

	protected HttpSession session;


	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

	this.request = request;

	this.response = response;

	this.session = request.getSession();
   }
}
