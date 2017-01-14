package com.yush.ar.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yush.ar.dao.ConfigDao;
import com.yush.ar.entity.MkResult;
import com.yush.ar.service.ConfigService;
@Service
public class ConfigServiceImpl implements ConfigService{
	@Resource
	private ConfigDao configDao;
	
	@Override
	public MkResult listConfig() {
		MkResult bkResult=new MkResult();
		List<Map<String, Object>>list=configDao.listConfig();
		bkResult.setData(list);
		bkResult.setMsg("加载成功");
		bkResult.setStatus(0);
		return bkResult;
	}

	@Override
	public MkResult addConfig(String configLable, String configName,String configValue) {
		MkResult bkResult=new MkResult();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("configLable", configLable);
		map.put("configName", configName);
		map.put("configValue", configValue);
		configDao.addConfig(map);
		bkResult.setMsg("添加成功");
		bkResult.setStatus(0);
		return bkResult;
	}

	@Override
	public MkResult editConfig(String configId, String configLable,
			String configName, String configValue) {
		MkResult bkResult=new MkResult();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("configId", configId);
		map.put("configLable", configLable);
		map.put("configName", configName);
		map.put("configValue", configValue);
		configDao.editConfig(map);
		bkResult.setMsg("修改成功");
		bkResult.setStatus(0);
		return bkResult;
		
	}

	@Override
	public MkResult delConfig(String configId) {
		MkResult bkResult=new MkResult();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("configId", configId);
		configDao.delConfig(map);
		bkResult.setMsg("删除成功");
		bkResult.setStatus(0);
		return bkResult;
	}

}
