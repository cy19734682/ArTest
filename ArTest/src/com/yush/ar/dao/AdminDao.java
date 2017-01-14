package com.yush.ar.dao;

import java.util.List;
import java.util.Map;

import com.yush.ar.entity.Admin;


public interface AdminDao {
	
	public Admin findByName(String username)throws Exception;
	
	public Admin findById(String adminid)throws Exception;
	
	public List<Map<String, Object>> listAdmins(Map<String, Object> map);
	public int countAdmin();
	public void editUser(Map<String, Object> map);

	public void addUser(Map<String, Object> map);

	public void delUser(Map<String, Object> map);
}
