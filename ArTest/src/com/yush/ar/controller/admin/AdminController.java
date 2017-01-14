package com.yush.ar.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.Users;
import com.yush.ar.service.AdminService;
import com.yush.ar.service.ArService;
import com.yush.ar.service.ConfigService;
import com.yush.ar.service.SortService;
import com.yush.ar.service.UserService;
import com.yush.ar.util.BaseAction;


@Controller
@RequestMapping("/admins")
public class AdminController extends BaseAction{
	@Resource
	private  AdminService adminService;
	@Resource
	private  SortService sortService;
	@Resource
	private ConfigService configService;
	@Resource
	private UserService userService;
	@Resource
	private  ArService arService;
	
		/**
		 * 跳转到登录页面
		 * @param map
		 * @return
		 */
		@RequestMapping("/toLogin")
		public String toLogin(Map<String, Object>map) throws Exception {
			MkResult mkResult=adminService.toLogin(request);
			map.put("mkResult", mkResult);
			return "/WEB-INF/admin/login.jsp";
		} 
		

		/**
		 * 跳转到登录页面
		 * @param map
		 * @return
		 */
		@RequestMapping("/toIndex")
		public String toIndex(){
			return "/WEB-INF/admin/index.jsp";
		} 
		
	//用户相关
		/**
		 * 后台登录
		 * @param username
		 * @param password
		 * @param request
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/login")
		public MkResult checkName(String username,String password,Boolean remember,HttpServletRequest request)throws Exception{
			MkResult bkResult=adminService.checkName(username, password,remember,request,response);
			return bkResult;
		}
		
		/**
		 * 修改用户信息
		 * @param username
		 * @param password
		 * @param request
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/editAdmin")
		public MkResult editAdmin(String userid,String password,String name)throws Exception{
			MkResult bkResult=adminService.editUser(userid,password,name);
			return bkResult;
		}
		/**
		 * 添加用户信息
		 * @param username
		 * @param password
		 * @param request
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/addAdmin")
		public MkResult addAdmin(String username,String password,String name)throws Exception{
			MkResult bkResult=adminService.addUser(username,password,name);
			return bkResult;
		}
		/**
		 * 查询用户列表
		 * @param map
		 * @return
		 */
		@RequestMapping("/adminInfo")
		public String adminInfo(String pagenow,Map<String, Object>map){
			MkResult bkResult=adminService.listAdmin(pagenow);
			map.put("listAdmin", bkResult);
			return "/WEB-INF/admin/listAdmin.jsp";
		}
		
		/**
		 * 删除用户
		 * @param map
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/delAdmin")
		public MkResult delAdmin(String userid){
			MkResult bkResult=adminService.delUser(userid,request);
			return bkResult;
		}
		/**
		 * 用户注销
		 * @return
		 */
		@RequestMapping("/loginout")
		public String loginout(){
			session.removeAttribute("admin");
			return "redirect:admins/toLogin";
		}
		
		
		//系统配置相关
		/**
		 * 查询系统配置列表
		 * @param map
		 * @return
		 */
		@RequestMapping("/listConfig")
		public String listConfig(Map<String, Object>map){
			MkResult bkResult=configService.listConfig();
			map.put("listConfig", bkResult);
			return "/WEB-INF/admin/listConfig.jsp";
		}
		/**
		 * 新增系统配置列表
		 * @param map
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/addConfig")
		public MkResult addConfig(String configLable,String configName,String configValue){
			MkResult bkResult=configService.addConfig(configLable,configName,configValue);
			return bkResult;
		}
		/**
		 * 修改系统配置列表
		 * @param map
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/editConfig")
		public MkResult editConfig(String configId,String configLable,String configName,String configValue){
			MkResult bkResult=configService.editConfig(configId,configLable,configName,configValue);
			return bkResult;
		}
		/**
		 * 删除系统配置列表
		 * @param map
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/delConfig")
		public MkResult delConfig(String configId){
			MkResult bkResult=configService.delConfig(configId);
			return bkResult;
		}
		
		
		//类别相关
		/**
		 * 查询类别列表
		 * @return
		 */
		@RequestMapping("/sortConfig")
		public String sortConfig(){
			return "/WEB-INF/admin/sortConfig.jsp";
		}
		/**
		 * 查询类别列表
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/listSort")
		public MkResult listSort(){
			MkResult bkResult=sortService.listSort();
			return bkResult;
		}
		/**
		 * 添加类别
		 * @param parentId
		 * @param sortName
		 * @param description
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/addSort")
		public MkResult addSort(String parentId,String sortName,String description){
			MkResult bkResult=sortService.addSort(parentId, sortName, description);
			return bkResult;
		}
		/**
		 * 删除类别
		 * @param sortId
		 * @param parentId
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/delSort")
		public MkResult delSort(String sortId,String parentId){
			MkResult bkResult=sortService.delSort(sortId,parentId);
			return bkResult;
		}
		/**
		 * 修改类别信息
		 * @param sortId
		 * @param parentId
		 * @param sortName
		 * @param description
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/updateSort")
		public MkResult updateSort(String sortId,String parentId,String sortName,String description){
			MkResult bkResult=sortService.updateSort(sortId,parentId,sortName,description);
			return bkResult;
		}
		
		//用户相关
		/**
		 * 用户列表
		 */
		@RequestMapping("/listUser")
		public String listUser(String pagenow,String state,Map<String, Object>map){
			MkResult bkResult=userService.listUser(pagenow,state);
			map.put("listUser", bkResult);
			if (state.equals("0")) {
				return "/WEB-INF/admin/listUser.jsp";
			}else{
				return "/WEB-INF/admin/recycleUser.jsp";
			}
		}
		/**
		 * 根据ID查询用户信息
		 * @param uid
		 * @param map
		 * @return
		 */
		@RequestMapping("/getByIdUser")
		public String getByIdUser(String uid,Map<String, Object>map){
			MkResult bkResult=userService.getByIdUsers(uid);
			map.put("userInfo", bkResult);
			return "/WEB-INF/admin/editUser.jsp";
			
		}
		/**
		 * 修改用户资料
		 * @param users
		 * @return
		 */
		@RequestMapping(value="/editUser",method=RequestMethod.POST)
		public String editUser(@ModelAttribute("form") Users users){
			System.out.println("哈哈哈哈哈哈哈");
			userService.editUser(users,users.getUserId());
			return "redirect:/admins/listUser?state=0";
			
		}
		/**
		 * 查询用户粉丝列表
		 * @param userId
		 * @param pagenow
		 * @return
		 */
		@ResponseBody
		@RequestMapping("feisiList")
		public MkResult feisiList(String userId,String pagenow){
			MkResult bkResult=userService.getFeisiList(userId,pagenow,0);//0粉丝列表，1关注列表
			return bkResult;
		}
		/**
		 * 查询用户关注列表
		 * @param userId
		 * @param pagenow
		 * @return
		 */
		@ResponseBody
		@RequestMapping("guanzhuList")
		public MkResult guanzhuList(String userId,String pagenow){
			MkResult bkResult=userService.getFeisiList(userId,pagenow,1);//0粉丝列表，1关注列表
			return bkResult;
		}
		/**
		 * 删除用户
		 * @param imgIds
		 * @return
		 */
		@ResponseBody
		@RequestMapping("recycleUser")
		public MkResult recycleUser(String userIds){
			MkResult bkResult=userService.updateUserState(userIds,1);
			return bkResult;
		}
		/**
		 * 恢复用户
		 * @param imgIds
		 * @return
		 */
		@ResponseBody
		@RequestMapping("huifuUser")
		public MkResult huifuUser(String userIds){
			MkResult bkResult=userService.updateUserState(userIds,0);
			return bkResult;
		}
		
		//AR相关
		@RequestMapping("/listAr")
		public String listAr(String keyword,String tag,String sortId,Integer pagenow,Integer pagesize,
				String recommend,String state,Map<String, Object>map)throws UnsupportedEncodingException{
			MkResult bkResult=arService.listAr(keyword,tag,sortId,pagenow,pagesize,recommend,state);
			map.put("bkResult", bkResult);
			if(state.equals("0")){
				return "/WEB-INF/admin/listAr.jsp";
			}else if(state.equals("1")){
				return "/WEB-INF/admin/tempAr.jsp";
			}else{
				return "/WEB-INF/admin/recycleAr.jsp";
			}
			
		}
		/**
		 * 修改AR资源状态
		 * @param imgIds
		 * @return
		 */
		@ResponseBody
		@RequestMapping("updateArState")
		public MkResult updateArState(String arIds,String state,Integer type){//type:1审核、2删除、3恢复
			MkResult bkResult=arService.updateArState(arIds,state,type);
			return bkResult;
		}
		/**
		 * 删除AR资源
		 * @param imgIds
		 * @return
		 */
		@ResponseBody
		@RequestMapping("deleteAr")
		public MkResult deleteAr(String arIds){
			MkResult bkResult=arService.deleteAr(arIds);
			return bkResult;
		}
		
		/**
		 * 推荐资源
		 * @param arId
		 * @param recommend
		 * @return
		 */
		@ResponseBody
		@RequestMapping("updateArRecommend")
		public MkResult updateArRecommend(String arId,Integer recommend){
			MkResult bkResult=arService.updateArRecommend(arId,recommend);
			return bkResult;
		}
}
