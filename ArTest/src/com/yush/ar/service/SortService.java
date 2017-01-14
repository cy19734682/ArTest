package com.yush.ar.service;

import com.yush.ar.entity.MkResult;


public interface SortService {
	public MkResult listSort();

	public MkResult addSort(String parentId, String sortName, String description);

	public MkResult delSort(String sortId,String parentId);

	public MkResult updateSort(String sortId, String parentId, String sortName,
			String description);
}
