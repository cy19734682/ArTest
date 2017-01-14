package com.yush.ar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.yush.ar.dao.AdminDao;
import com.yush.ar.dao.SortDao;
import com.yush.ar.entity.Admin;
import com.yush.ar.entity.MkResult;
import com.yush.ar.entity.ShowPages;
import com.yush.ar.service.AdminService;
import com.yush.ar.util.MkUtil;
import com.yush.ar.util.MyEncrypt;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminDao adminDao;
	@Resource
	private SortDao sortDao;
	private int pageSize =10; // 每页显示10条记录
	private int currentPage=1;//当前页
	private int pageCount=0;
	private String pageBar;
	
	@Override
	public MkResult toLogin(HttpServletRequest request) throws Exception {
		MkResult mkResult=new MkResult();
		MyEncrypt myEncrypt=new MyEncrypt();
		Admin admin=new Admin();
		try{   
		    Cookie[] cookies=request.getCookies();   
		    if(cookies!=null){   
		    for(int i=0;i<cookies.length;i++){   
		        if(cookies[i].getName().equals("adminsid")){   
		        String value =  cookies[i].getValue();  
		        if(value!=null&&!"".equals(value)){  
		           String adminid=cookies[i].getValue();   
		                 admin=adminDao.findById(adminid);
		                 String pw=myEncrypt.decrypt(admin.getPassWord());
		     			 admin.setPassWord(pw);
		                 mkResult.setStatus(0);
		                 mkResult.setData(admin);
		           	}  
		           }   
		       
		    }   
		   }   
		}catch(Exception e){   
		   e.printStackTrace();   
		}   
		
		return mkResult;
	}
	/**
	 * 检查用户名是否存在
	 * @throws Exception 
	 */
	@Override
	public MkResult checkName(String username, String password,Boolean remember,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		MkResult mkResult=new MkResult();
		MyEncrypt myEncrypt=new MyEncrypt();
		Admin admin = adminDao.findByName(username);
		if(admin==null){
			mkResult.setStatus(1);
			mkResult.setMsg("账号错误！");
		}else if(!admin.getPassWord().equals(myEncrypt.encrypt(password))){
			mkResult.setStatus(2);
			mkResult.setMsg("密码错误！");
		}else {
			mkResult.setStatus(0);
			String pw=myEncrypt.decrypt(admin.getPassWord());
			admin.setPassWord(pw);
			mkResult.setData(admin);
			HttpSession session=request.getSession();
			session.setAttribute("admin", admin);
			if(remember==true){
				 Cookie remeUser=new Cookie("adminsid",String.valueOf(admin.getAdminId()));
				 remeUser.setPath("/");
				 remeUser.setMaxAge(60*24*7);
				 response.addCookie(remeUser);
			}else{
				Cookie idCookie = new Cookie("adminsid", null);
				idCookie.setMaxAge(0); // 使cookie失效
				idCookie.setPath("/"); // 这个不能少
				response.addCookie(idCookie);
			}
		}
		return mkResult;
	}
	
	/**
	 * 查询用户列表
	 */
	@Override
	public MkResult listAdmin(String pagenow) {
		MkResult bkResult=new MkResult();
		if(pagenow==null||pagenow.equals("")){
			currentPage=1;
		}else{
			currentPage=Integer.parseInt(pagenow);
		}
		Map<String, Object>adminMap=new HashMap<String, Object>();//图片信息集合
		Map<String, Object>pageMap=new HashMap<String, Object>(); //页码相关内容
		try {
			int m=adminDao.countAdmin();
			Map<String, Object>map=new HashMap<String, Object>();
			if(m>0){
				pageCount=MkUtil.calPageCount(m,pageSize);
				int n=currentPage*pageSize-pageSize;
				map.put("start", n);
				map.put("end", pageSize);
				
				MyEncrypt myEncrypt=new MyEncrypt();
				List<Map<String, Object>>listadmins=adminDao.listAdmins(map);
			
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
				pageMap.put("adminsize", m);
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

	@Override
	public MkResult editUser(String userid, String password, String name) throws Exception {
		MkResult bkResult=new MkResult();
		MyEncrypt myEncrypt=new MyEncrypt();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("password", myEncrypt.encrypt(password));
		map.put("name", name);
		adminDao.editUser(map);
		bkResult.setMsg("修改成功~~");
		bkResult.setStatus(0);
		return bkResult;
	}

	@Override
	public MkResult addUser(String username, String password, String name)
			throws Exception {
		MkResult bkResult=new MkResult();
		MyEncrypt myEncrypt=new MyEncrypt();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", myEncrypt.encrypt(password));
		map.put("name", name);
		adminDao.addUser(map);
		bkResult.setMsg("添加成功~~");
		bkResult.setStatus(0);
		return bkResult;
	}

	@Override
	public MkResult delUser(String userid, HttpServletRequest request) {
		MkResult bkResult=new MkResult();
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		if(admin.getPower()!=0){
			bkResult.setMsg("你没有权限");
			bkResult.setStatus(1);
		}else{
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("userid", userid);
			adminDao.delUser(map);
			bkResult.setMsg("删除成功！！");
			bkResult.setStatus(0);
		}
		return bkResult;
	}

	
	
	

}
