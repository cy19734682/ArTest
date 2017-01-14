package com.yush.ar.dao;

import java.util.List;
import java.util.Map;

public interface ArDao {

	int countAr(Map<String, Object> map);

	List<Map<String, Object>> listAr(Map<String, Object> map);

	void updateArState(Map<String, Object> map);

	void deleteAr(Map<String, Object> map);

	void updateArRecommend(Map<String, Object> map);
	
	List<Map<String, Object>> listArRecommend(Map<String, Object> map);
	
	Map<String, Object>getByIdAr(Map<String, Object> map);
	
	Map<String, Object>getPrevAr(Map<String, Object> map);
	Map<String, Object>getNextAr(Map<String, Object> map);
	
	List<Map<String, Object>> listRelativeAr(Map<String, Object> map);
	void addClickCount(Map<String, Object> map);
}
