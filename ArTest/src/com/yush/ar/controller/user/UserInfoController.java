package com.yush.ar.controller.user;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.Users;
import com.yush.ar.service.UserService;
import com.yush.ar.util.BaseAction;
import com.yush.ar.util.MkUtil;
@Controller
@RequestMapping("/u")
public class UserInfoController extends BaseAction{
	@Resource
	private UserService userService;// 注入
	
	/**
	 * 跳转到用户中心
	 * @return
	 */
	@RequestMapping("/{userId}")
	public String to_UserInfo(@PathVariable(value = "userId")String userId,Map<String, Object>map){
		 MkResult mkResult=userService.getByIdUsers(userId);
		 if(mkResult.getData()==null){
			return "/404.jsp"; 
		 }
		 map.put("mkResult",mkResult);
		return "/userinfo.jsp";
	}
	
	/**
	 * 跳转到资料修改页面
	 * @return
	 */
	@RequestMapping("/{userId}/admin/edituser")
	public String toUserInfo(@PathVariable(value = "userId")String userId,Map<String, Object>map){
		MkResult mkResult=userService.getByIdUsers(userId);
		if(mkResult.getData()==null){
			     return "/404.jsp"; 
		}else{
			Users users=MkUtil.getSessionUser(session);
			if(users!=null){
				map.put("mkResult",mkResult);
				return "/edituser.jsp"; 
			}else{
				return "redirect:/u/"+userId; 
			}
		}
		
	}
	
}
