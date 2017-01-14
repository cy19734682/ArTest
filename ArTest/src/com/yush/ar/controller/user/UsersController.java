package com.yush.ar.controller.user;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.code.kaptcha.Constants;
import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.Users;
import com.yush.ar.service.UserService;
import com.yush.ar.util.BaseAction;

@Controller
@RequestMapping("/user")
public class UsersController extends BaseAction{
	@Resource
	private UserService userService;// 注入
	
	
	/**
	 *注册成功后跳转到登录页面
	 * @return
	 */
	@RequestMapping("/login")
	public String toLogin(){
		 String tourl=request.getHeader("referer");
		 if(tourl == null ||!tourl.startsWith("http://127.0.0.1:8090/ArTest")){
			 System.out.println("不是从本网站来！！");
			 return "index.jsp";
		 }else{
		     session.setAttribute("jumpUrl",tourl);
		     return "/login.jsp";
		 }
	}
	
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param arrt
	 * @return
	 */
	@RequestMapping("/ulogin")
	@ResponseBody
	// 将NoteResult转成json输出
	public MkResult  execute(String username, String password,RedirectAttributes arrt) {
		MkResult  mkResult = userService.checkName(username,password,request);
		   String jumpUrl=(String) session.getAttribute("jumpUrl");
		   if(mkResult.getStatus()==0){
			   if(jumpUrl!=null&&!jumpUrl.equals("")){
				   mkResult.setData(jumpUrl);
				   session.removeAttribute("jumpUrl");
			   }else {
				   mkResult.setData("index.jsp");
			  }
		   }
		return mkResult;
	}
	
	/**
	 * 注册用户
	 * @param usrs
	 * @param arrt
	 * @param repassowrd
	 * @return
	 */
	//@RequestMapping(value = "/register", method = {RequestMethod.POST})
	@RequestMapping("/register")
	public String register(@ModelAttribute("form") Users usrs,RedirectAttributes arrt,@RequestParam("OpenId")String OpenId,
	@RequestParam("type")String type,@RequestParam("confirm_password")String repassowrd,@RequestParam("kaptchaImage")String kaptchaImage,
	  Map<String, Object>map){
		
		String kaptchaRandom=(String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		System.out.println(usrs.getUserName()+";"+OpenId);
		MkResult result=userService.addUsers(usrs,OpenId,type,repassowrd,kaptchaRandom,kaptchaImage);
		map.put("result", result);
		if(result.getStatus()==0){
			return "redirect:/user/toLogin";
		}else if(result.getStatus()==4){
			return  "redirect:/index.jsp";
		} else {
			return "/register.jsp";
		}
		

	}
	
	/**
	 * 检查用户名是否存在
	 * @param username
	 * @return
	 */
	@RequestMapping("/checkUser")
	@ResponseBody
	public boolean checkUser(String username){
		
		Users users = userService.checkUser(username);
		 if(users==null){
			 return true;
		 }
		return false;
	}
	
	/**
	 * 检查邮箱是否存在
	 * @param email
	 * @return
	 */
	@RequestMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(String email){
		
		Users users = userService.checkEmail(email);
		 if(users==null){
			 return true;
		 }
		return false;
	}
	
	/**
	 * 检查邮箱是否存在
	 * @param email
	 * @return
	 */
	@RequestMapping("/checkRandom")
	@ResponseBody
	public boolean checkRandom(String kaptchaImage){
		String random=(String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if(kaptchaImage.equalsIgnoreCase(random)){
			return true;
		}
		
		return false;
	}
	
	
	@RequestMapping("/addTemUsers")
	public String addTemUser() throws Exception{
		MkResult result = userService.addTemUser(request);
		Users users=(Users) result.getData();
		if(users!=null){
			session.setAttribute("users",users);
			return "redirect:/user/toTempUser";
		}else{
			return "redirect:/user/login";
	    }
	}
	
	/**
	 * 第三方账号绑定
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/bangdUsers")
	@ResponseBody
	public MkResult bangdUsers(String username, String type,String password,String OpenId) throws Exception{
		
		MkResult  mkResult=userService.bangdUsers(username,password,OpenId,type,request);
		System.out.println(username+"登录了");
		   if(mkResult.getStatus()==0){
			   Users users=(Users) mkResult.getData();
			   session.setAttribute("users", users);
		   }
		   
		return mkResult;
	}
	
	/**
	 *生成临时账户后登录并跳转到确认页面
	 * @return
	 */
	@RequestMapping("/toTempUser")
	public String toTempUser(){
		
		return "/tempUser.jsp";
	}
	
	
	@RequestMapping("/perfectUser")
	public String perfectUser(@ModelAttribute("form") Users usrs,@RequestParam("confirm_password")String repassowrd,Map<String, Object>map){
		
		if(usrs.getPassWord().equals(repassowrd)){
			MkResult result=userService.perfectUser(usrs);
			 if(result.getStatus()==0){
				 Users users=userService.getNameUsers(usrs.getUserName());
				 if(users!=null){
					session.setAttribute("users",users);
				}
			 }
			 return "redirect:/user/toGoIndex";
		
		}else {
			map.put("states",0);
			return "/toTempUser";
		}
		

	}
	
	@RequestMapping("/toGoIndex")
	public String toGoIndex(){
		
		return "/index.jsp";
	}
	
	/**
	 * 注销账号
	 * @param title
	 * @param body
	 * @param abstr
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public MkResult execute(){
		MkResult result =new MkResult();
		//Users users=(Users) session.getAttribute("users");
		//result=userService.logout(users);
		//userService.forceLogoutUser(users.getUserid());
		//delCookie();
		//System.out.println(users.getUsername()+"注销了！！");
		session.removeAttribute("users");
		 String tourl=request.getHeader("referer");
		 if(tourl == null ||!tourl.startsWith("http://127.0.0.1:8090/ArTest")){
			 System.out.println("不是从本网站来！！");
		 }
		
		return result;
	}
	
	
	
	/**
	 * 提供给untiy的注册方法
	 */
	@RequestMapping("/registerUser")
	@ResponseBody
	public void registerUser(String name,String password,String retry_password,String email){
		System.out.println(name+" "+password+" "+retry_password+" "+email);
	  
		String msg=userService.registerUser(name,password,retry_password,email);
		if(msg.equals("success")&&msg=="success"){
		    Users users=userService.getNameUsers(name);
		    session.setAttribute("users",users);
		}
		System.out.println("输出:"+msg);
		response.setContentType("text/html");  
	    response.setCharacterEncoding("utf-8");  
	 	PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.println(msg);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 提供给untiy的登录方法
	 */
	@RequestMapping("/unityLogin")
	@ResponseBody
	public void unityLogin(String name,String password){
		
		String msg=userService.unityLogin(name,password);
		if(msg.equals("success")&&msg=="success"){
		    Users users=userService.getNameUsers(name);
		    session.setAttribute("users",users);
		}
		System.out.println("输出:"+msg);
		response.setContentType("text/html");  
	    response.setCharacterEncoding("utf-8");  
	 	PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.println(msg);
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 提供给untiy的游客登录方法
	 */
	@RequestMapping("/unityTemp")
	@ResponseBody
	public void unityTemp(){
		
		 Map<String,String> msg=userService.unityTemp();
		   
		 if(msg.get("success")!="fail"&&!msg.get("success").equals("fail")){
			 String[] us=msg.get("success").split("\\|");
			 String name=us[0];
			 Users users=userService.getNameUsers(name);
			 session.setAttribute("users",users);
		 };
		System.out.println("输出:"+msg.get("success"));
		response.setContentType("text/html");  
	    response.setCharacterEncoding("utf-8");  
	 	PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.println(msg.get("success"));
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}


