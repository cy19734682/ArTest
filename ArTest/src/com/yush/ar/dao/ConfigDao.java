package com.yush.ar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ConfigDao {
	public String getEssayPath(@Param("configName")String configName);

	public List<Map<String, Object>> listConfig();

	public void addConfig(Map<String, Object>map);

	public void editConfig(Map<String, Object> map);

	public void delConfig(Map<String, Object> map);
}
