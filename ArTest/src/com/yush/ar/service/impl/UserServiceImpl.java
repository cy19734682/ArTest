package com.yush.ar.service.impl;


import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.yush.ar.dao.UserDao;
import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.ShowPages;
import com.yush.ar.entity.Userlevel;
import com.yush.ar.entity.Users;
import com.yush.ar.listener.Sessionlistener;
import com.yush.ar.service.UserService;
import com.yush.ar.util.BaseAction;
import com.yush.ar.util.MkUtil;
import com.yush.ar.util.MyEncrypt;
@Service
//扫描控制组件
public class UserServiceImpl  implements UserService{
	@Resource
	private UserDao userDao;
	private int pageSize =15; // 每页显示10条记录
	private int currentPage=1;//当前页
	private int pageCount=0;
	private String pageBar;
	/**
	 * 登录验证
	 */
	public MkResult checkName(String name,String pwd,HttpServletRequest request) {
		MkResult mkResult=new MkResult();
		Users users = userDao.findByName(name);
		if(users==null){
			mkResult.setStatus(1);
			mkResult.setMsg("账号错误！");
		}else if(!users.getPassWord().equals(pwd)&&users.getPassWord()!=pwd){
			mkResult.setStatus(2);
			mkResult.setMsg("密码错误！");
		}else {
			Date dt=userDao.getLastLoginTime(users.getUserId());
			Date date=new Date();
			if(dt==null){
				userDao.addLoginPoint(users.getUserId());
				System.out.println("账号首次登陆！！");
			}else if(!MkUtil.genTimeStampString(dt).equals(MkUtil.genTimeStampString(date))){
				userDao.addLoginPoint(users.getUserId());
				System.out.println("今天第一次登陆!");
			}
			String ip=MkUtil.getClientIpAddress(request);
			HttpSession session=request.getSession();
			session.setAttribute("users", users);
			String randomkey=MkUtil.createRandon();
			userDao.setLastLoginTime(ip,users.getUserId(),randomkey);
			//userDao.saveLog(ip,users.getUserid(),randomkey);
			
			mkResult.setStatus(0);
			mkResult.setData(users.getUserId());
		}
		
		return mkResult;
	}
	
	@Override
	public MkResult getByIdUsers(String userid) {
		MkResult mkResult=new MkResult();
		Integer id=null;
		 if(userid!=null&&userid.matches("^[0-9]*[1-9][0-9]*$")){//判断页面输入的是否是正整数
			 id=Integer.parseInt(userid);
		 }
		Users users = userDao.getByIdUsers(id);
		mkResult.setStatus(0);
		mkResult.setData(users);
		return mkResult;
	}
	
	
	public MkResult addUsers(Users users,String openid, String type,String repassowrd,String kaptchaRandom, String kaptchaImage) {
		MkResult result = new MkResult();
	   int n=userDao.addUser(users,openid,type);
	   if(n>0&&openid==null&&type==null){
		   result.setStatus(0);
		   result.setMsg("注册成功");
	   }else if(n>0&&openid!=null&&type!=null){
		   Users userss = userDao.findByName(users.getUserName());
		   result.setData(userss);
		   result.setStatus(4);
		   result.setMsg("注册并绑定成功");
	   }
	   else if (!users.getPassWord().equals(repassowrd)&&users.getPassWord()==repassowrd) {
		   result.setStatus(1);
		   result.setMsg("两次密码输入不一致");
	   }else if(!kaptchaRandom.equals(kaptchaImage)&&kaptchaRandom!=kaptchaImage){
		   result.setStatus(2);
		   result.setMsg("验证码输入错误");
	   }else {
		   result.setStatus(3);
		   result.setMsg("网络错误");
	   }
		return result;
	}

	public Users checkUser(String username) {
		
		Users users= userDao.checkUser(username);
		/*System.out.println(users.getUsername());*/
		if(users!=null){
			return users;
		}
		return null;
	}

	public Users checkEmail(String email) {
		Users users= userDao.checkEmail(email);
		/*System.out.println(users.getUsername());*/
		if(users!=null){
			return users;
		}
		return null;
	}
	
	
	@Override
	public MkResult addTemUser(HttpServletRequest request) {
		MkResult result=new MkResult();
	  String username="";
	  String password="123456";
	  Users users=new Users();
	  do {
		  username=MkUtil.createTemUsername();
		  System.out.println(username);
	  } while (checkUser(username)!=null);
	    int n=userDao.addTemUser(username,password);
	    if(n>0){
	    	 users=getNameUsers(username);
	    	String ip=MkUtil.getClientIpAddress(request);
			String randomkey=MkUtil.createRandon();
			userDao.addLoginPoint(users.getUserId());
			userDao.setLastLoginTime(ip,users.getUserId(),randomkey);
			//userDao.saveLog(ip,users.getUserid(),randomkey);
	    }
	    result.setStatus(0);
	    result.setData(users);
	    result.setMsg("生成成功！！");
	    
		return result;
	}
	
	/**
	 * 第三方账号绑定
	 */
	@Override
	public MkResult bangdUsers(String username, String password,String openId,String type,HttpServletRequest request) {
		MkResult mkResult = new MkResult();
		Users users = userDao.findByName(username);
		if(users==null){
			mkResult.setStatus(1);
			mkResult.setMsg("账号错误！");
		}else if(!users.getPassWord().equals(password)&&users.getPassWord()!=password){
			mkResult.setStatus(2);
			mkResult.setMsg("密码错误！");
		}else {
			Date dt=userDao.getLastLoginTime(users.getUserId());
			Date date=new Date();
			if(dt==null){
				userDao.addLoginPoint(users.getUserId());
				System.out.println("账号首次登陆！！");
			}else if(!MkUtil.genTimeStampString(dt).equals(MkUtil.genTimeStampString(date))){
				userDao.addLoginPoint(users.getUserId());
				System.out.println("今天第一次登陆!");
				
			}
			String ip=MkUtil.getClientIpAddress(request);
			String randomkey=MkUtil.createRandon();
			userDao.setLastLoginTime(ip,users.getUserId(),randomkey);
			//userDao.saveLog(ip,users.getUserid(),randomkey);
			mkResult.setStatus(0);
			mkResult.setData(users);
			System.out.println(username+";"+openId);
			userDao.bangdUsers(username,openId,type);
		}
		
		return mkResult;
		
	}
	
	
	/**
	 * 根据用户名查询用户信息
	 */
	public Users getNameUsers(String username) {
		
		Users users=userDao.getNameUsers(username);
			
		return users;
	}
	
	
	@Override
	public MkResult perfectUser(Users usrs) {
		MkResult result = new MkResult();
		
		userDao.perfectUser(usrs);
		result.setStatus(0);
		return result;
	}

	@Override
	public MkResult editUser(Users users,Integer userid) {
		MkResult result = new MkResult();
		
		userDao.editUser(users,userid);
		System.out.println(users.getUserName());
		result.setStatus(0);
		result.setMsg("修改成功");
		
		return result;
	}
	
	/**
	 * 注销账号
	 */
	@Override
	public MkResult logout(Users users) {
		MkResult mkResult=new MkResult();
		System.out.println("ID："+users.getUserId());
		int n=userDao.clearIp(users.getUserId());
		System.out.println(users.getRandomKey());
		int m=userDao.setEndTime(users.getUserId(),users.getRandomKey());
		System.out.println(m);
		if(n>0||m>0){
			mkResult.setStatus(0);
			mkResult.setMsg("清除成功");
		}else {
			mkResult.setStatus(1);
			mkResult.setMsg("程序错误！！");
		}
		return mkResult;
	}
	
	/**
	 * 查询积分
	 */
	public Userlevel getListLevel(Integer point){
		//Long l1=System.currentTimeMillis();
		List<Userlevel>userlevels=userDao.getAllLevel();
		 Userlevel userlevel=new Userlevel();
		//int point=25610;
		if(userlevels.size()>0){ 
		 for(int i=0;i<userlevels.size();i++){
			 if(i==userlevels.size()-1) break;
			int a1=userlevels.get(i).getUserlevelpoints();
			String la1=userlevels.get(i).getUserlevelname();
			int a2=userlevels.get(i+1).getUserlevelpoints();
			String lb1=userlevels.get(i+1).getUserlevelname();
			if(point==a1){
				userlevel.setCurrentLevelpoints(a1);
				userlevel.setCurrentLevel(la1); 
				userlevel.setNextLevelpoints(a2);
				userlevel.setNextLevel(lb1);
				userlevel.setNeedPoint(userlevel.getNextLevelpoints()-point);
			}
			else if(a1<point&&a2>point){
			userlevel.setCurrentLevelpoints(a1);
			userlevel.setCurrentLevel(la1);
			userlevel.setNextLevelpoints(a2);
			userlevel.setNextLevel(lb1);
			userlevel.setNeedPoint(userlevel.getNextLevelpoints()-point);
			}else if(point>=a2){
				userlevel.setCurrentLevelpoints(a2);
				userlevel.setNextLevelpoints(a2);
				userlevel.setCurrentLevel(lb1);
				userlevel.setNextLevel(lb1);
			}
		}
		}
		return userlevel;
        
	}
	
	

	/**
	 * Unity3D 注册
	 */
	@SuppressWarnings("unused")
	@Override
	public String registerUser(String name, String password,String retry_password,String email) {
		String msg="";
		 if(name.equals("")&&name==null){
			 msg="emptyName";
		 }else if(name.length()<4){
			 msg="nameLength";
		 }else if(userDao.getNameUsers(name)!=null){
			 msg="isUser";
		 }else if(password.equals("")&&password==null){
			 msg="emptyPw";
		 } else if(password.length()<4){
			 msg="PwLength";
		 } else if (!password.equals(retry_password)) {
			 msg="equalsPw";
		 }else if(email.equals("")&&email==null){
			 msg="emptyEmail";
		 } else if(MkUtil.regEmail(email)==false) {
			 msg="regEmail";
		 }else if(userDao.checkEmail(email)!=null){
			 msg="checkEmail";
		 }else {
			 int n=userDao.registerUser(name,password,email);
			 if(n>0){
				msg="success";
			 }else{
				msg="fail";
			 }
		}
		return msg;
	}
	
	/**
	 * Unity3D 登录
	 */
	@Override
	public String unityLogin(String name, String password) {
		String msg="";
		if(name==""&&name.equals("")){
			msg="nameisnull";
		}else if(password==""&&password.equals("")){
			msg="pwisnull";
		}else{
			Users users = userDao.findByName(name);
			if(users!=null){
				msg="success";
			}else{
				msg="fail";
			}
		}
		return msg;
	}

	@Override
	public Map<String, String> unityTemp() {
		  Map<String, String>msg=new HashMap<String, String>();
		  String username="";
		  String password="123456";
		  do {
			  username=MkUtil.createTemUsername();
			  System.out.println(username);
		  } while (checkUser(username)!=null);
		  
		  int n=userDao.addTemUser(username,password);
		  if(n>0){
			 msg.put("success",username+"|"+password);
		  }else {
			 msg.put("success", "fail");
		 }
		return msg;
	}

	@Override
	public void forceLogoutUser(Integer uid) {
		 // 删除单一登录中记录的变量
        if (Sessionlistener.hUserName.get(uid) != null) {
		HttpSession hs = (HttpSession) Sessionlistener.hUserName.get(uid);
		Sessionlistener.hUserName.remove(uid);
		                  @SuppressWarnings("rawtypes")
						Enumeration e = hs.getAttributeNames();
		                  if(e!=null){
		                  while (e.hasMoreElements()) {
		                           String sessionName = (String) e.nextElement();
                           // 清空session
                           hs.removeAttribute(sessionName);
                  }
                  }
                  // hs.invalidate();
         }
		
	}
	
	
	@Override
	public MkResult listUser(String pagenow,String state) {
		MkResult bkResult=new MkResult();
		if(pagenow==null||pagenow.equals("")){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(pagenow);
		}
		Map<String, Object>adminMap=new HashMap<String, Object>();//图片信息集合
		Map<String, Object>pageMap=new HashMap<String, Object>(); //页码相关内容
		try {
			Map<String, Object>map=new HashMap<String, Object>();
			 map.put("state", state);
			 	int m=userDao.countUser(map);
				pageCount=MkUtil.calPageCount(m,pageSize);
				int n=currentPage*pageSize-pageSize;
				map.put("start", n);
				map.put("end", pageSize);
				MyEncrypt myEncrypt=new MyEncrypt();
				List<Map<String, Object>>listadmins=userDao.listUser(map);
			if(listadmins.size()>0){
				for (int i = 0; i < listadmins.size(); i++) {
					listadmins.get(i).put("passWord", myEncrypt.decrypt((String)(listadmins.get(i).get("passWord")) ));
				}
				adminMap.put("listadmins", listadmins);
				
				if(currentPage>=pageCount){
					currentPage=pageCount;
				}
				ShowPages sp=new ShowPages();
				sp.setCurrPage(currentPage);
				sp.setPageCodeCount(10);
				sp.setPageCount(pageCount);
				String strPage=sp.getPageBar();
				pageBar=strPage;
				pageMap.put("pageBar", pageBar);
				pageMap.put("currentPage", currentPage);
				pageMap.put("pageCount", pageCount);
				pageMap.put("userSize", m);
				adminMap.put("pageLists", pageMap);
				
				bkResult.setMsg("加载成功！！！");
				bkResult.setStatus(0);
			}else{
				bkResult.setMsg("未查询到数据！！！");
				bkResult.setStatus(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bkResult.setData(adminMap);
		return bkResult;
	}

	@Override
	public MkResult updateUserState(String userIds, int state) {
		MkResult bkResult=new MkResult();
		  String[] idArray = userIds.split(",");
		  if(idArray.length>0){
			  Map<String, Object>map=new HashMap<String, Object>();
			  map.put("state", state);
			  map.put("userIds", idArray);
			  userDao.updateUserState(map);
			  bkResult.setMsg("修改成功！！");
			  bkResult.setStatus(0);
		  }  
		return bkResult;
	}

	@Override
	public MkResult getFeisiList(String userId,String pagenow,int type) {
		MkResult bkResult=new MkResult();
		if(pagenow==null||pagenow.equals("")){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(pagenow);
		}
		int pageSize=10;
		Map<String, Object>adminMap=new HashMap<String, Object>();//图片信息集合
		Map<String, Object>pageMap=new HashMap<String, Object>(); //页码相关内容
		try {
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("type", type);
			int m=userDao.countUserFensi(map);
				pageCount=MkUtil.calPageCount(m,pageSize);
				int n=currentPage*pageSize-pageSize;
				map.put("start", n);
				map.put("end", pageSize);
				List<Map<String, Object>>listadmins=userDao.listUserFensi(map);
				if(listadmins.size()>0){
				adminMap.put("listadmins", listadmins);
				if(currentPage>=pageCount){
					currentPage=pageCount;
				}
				ShowPages sp=new ShowPages();
				sp.setCurrPage(currentPage);
				sp.setPageCodeCount(10);
				sp.setPageCount(pageCount);
				String strPage=sp.getPageBar();
				pageBar=strPage;
				pageMap.put("pageBar", pageBar);
				pageMap.put("currentPage", currentPage);
				pageMap.put("pageCount", pageCount);
				adminMap.put("pageLists", pageMap);
				bkResult.setMsg("加载成功！！！");
				bkResult.setStatus(0);
			}else{
				bkResult.setMsg("未查询到数据！！！");
				bkResult.setStatus(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bkResult.setData(adminMap);
		return bkResult;
	}



	
	
}

