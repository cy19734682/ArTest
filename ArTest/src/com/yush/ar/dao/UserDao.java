package com.yush.ar.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yush.ar.entity.Userlevel;
import com.yush.ar.entity.Users;

public interface UserDao {
	public Users findByName(String username);
	
	public Users getByIdUsers(Integer userid);

	public int addUser(@Param("users")Users users,@Param("openId")String openId,@Param("type")String type);

	public Users checkUser(String username);

	public Users checkEmail(String email);

	public int addTemUser(@Param("username")String username,@Param("password") String password);

	public Users getNameUsers(String username);

	public int perfectUser(Users users);

	public int editUser(@Param("users")Users users,@Param("userid")Integer userid);

	public List<Userlevel> getAllLevel();

	public int registerUser(@Param("username")String username, @Param("password")String password,
			@Param("email")String email);

	public int addLoginPoint(Integer userid);

	public Date getLastLoginTime(Integer userid);

	public int setLastLoginTime(@Param("ip")String ip, @Param("userid")Integer userid,@Param("randomkey")String randomkey);

	public int saveLog(@Param("ip")String ip, @Param("userid")Integer userid,@Param("randomkey")String randomkey);

	public int clearIp(Integer userid);

	public int setEndTime(@Param("userid")Integer userid,@Param("randomkey")String randomkey);

	public Users checkOauthUser(@Param("type")String type,@Param("openId")String openId);

	public void bangdUsers(@Param("username")String username,@Param("openId")String openId, @Param("type")String type);

	public int countUser(Map<String, Object> map);

	public List<Map<String, Object>> listUser(Map<String, Object> map);

	public void updateUserState(Map<String, Object> map);

	public int countUserFensi(Map<String, Object> map);
	public int countUserGuanzhu(Map<String, Object> map);
	public List<Map<String, Object>> listUserFensi(Map<String, Object> map);
	public List<Map<String, Object>> listUserGuanzhu(Map<String, Object> map);
	
}
