package com.yush.ar.service;

import java.io.UnsupportedEncodingException;

import com.yush.ar.entity.MkResult;

public interface ArService {

	MkResult listAr(String keyword,String tag, String sortId, Integer pagenow,
			Integer pagesize,String recommend, String state)throws UnsupportedEncodingException;

	MkResult updateArState(String arIds, String state, Integer type);

	MkResult deleteAr(String arIds);

	MkResult updateArRecommend(String arId, Integer recommend);

}
