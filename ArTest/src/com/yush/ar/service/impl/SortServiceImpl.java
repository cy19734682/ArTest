package com.yush.ar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yush.ar.dao.SortDao;
import com.yush.ar.entity.MkResult;
import com.yush.ar.service.SortService;


@Service
public class SortServiceImpl implements SortService{
	@Resource
	private SortDao sortDao;
	/**
	 * 查询类别列表
	 */
	@Override
	public MkResult listSort() {
		MkResult bkResult=new MkResult();
		List<Map<String, Object>>listSort=sortDao.listSort();
		bkResult.setStatus(0);
		bkResult.setData(listSort);
		return bkResult;
	}
	
	/**
	 * 新增类别
	 */
	@Override
	public MkResult addSort(String parentId, String sortName, String description) {
		MkResult bkResult=new MkResult();
		
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("parentId", parentId);
		map.put("sortName", sortName);
		map.put("note", 1);
		map.put("description", description);
		
		sortDao.addSort(map);
		sortDao.updateNote(map);
		bkResult.setStatus(0);
		bkResult.setMsg("添加成功！！");
		return bkResult;
	}
	
	/**
	 * 删除类别
	 */
	@Override
	public MkResult delSort(String sortId,String parentId) {
		MkResult bkResult=new MkResult();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("sortId", sortId);
		map.put("parentId", parentId);
		map.put("note", 0);
		sortDao.delSort(map);
		int isnote=sortDao.isNote(map);
		if(isnote<=0){
			sortDao.updateNote(map);
		}
		bkResult.setStatus(0);
		bkResult.setMsg("删除成功！！");
		return bkResult;
	}
	
	/**
	 * 修改类别
	 */
	@Override
	public MkResult updateSort(String sortId, String parentId, String sortName,
			String description) {
		MkResult bkResult=new MkResult();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("sortId", sortId);
		map.put("parentId", parentId);
		map.put("sortName", sortName);
		map.put("description", description);
		
		sortDao.updateSort(map);
		
		bkResult.setStatus(0);
		bkResult.setMsg("修改成功！！");
		return bkResult;
	}

}
