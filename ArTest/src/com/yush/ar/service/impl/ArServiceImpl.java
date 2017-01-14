package com.yush.ar.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yush.ar.dao.ArDao;
import com.yush.ar.entity.MkResult;
import com.yush.ar.service.ArService;
import com.yush.ar.util.MkUtil;
@Service
public class ArServiceImpl implements ArService{
	@Resource
	private ArDao arDao;
	private int pageSize =3; // 每页显示10条记录
	private int currentPage=1;//当前页
	private int pageCount=0;
	private String pageBar;
	
	@Override
	public MkResult listAr(String keyword,String tag, String sortId, Integer pagenow,
			Integer pagesize,String recommend, String state) throws UnsupportedEncodingException {
		MkResult bkresult = new MkResult();
		String ky=null;
		String kytag=null;
		if(keyword!=null&&!keyword.equals("")){
			 ky=new String(keyword.getBytes("ISO-8859-1"), "UTF-8");
		}
		if(tag!=null&&!tag.equals("")){
			kytag=new String(tag.getBytes("ISO-8859-1"), "UTF-8");
		}
		if(pagenow==null||pagenow.equals("")){
			pagenow=1;
		}
		if(pagenow<=0){
			pagenow=1;
		}
		if(state==null||state.equals("")){
			state="0";
		}
		Map<String, Object>essayMap=new HashMap<String, Object>();
		Map<String, Object>map=new HashMap<String, Object>();
		map.put("keyword", ky);
		map.put("sortId", sortId);
		map.put("recommend", recommend);
		map.put("state", state);
		map.put("tag", kytag);
		int m=arDao.countAr(map);
		Map<String, Object>pageMap=new HashMap<String, Object>(); //页码相关内容
			pageCount=MkUtil.calPageCount(m,pageSize);
			int n=pagenow*pageSize-pageSize;
			map.put("start", n);
			map.put("end", pageSize);
			List<Map<String, Object>>listar=arDao.listAr(map);
			if(listar.size()>0){
			essayMap.put("listar", listar);
			pageMap.put("currentPage", pagenow);
			pageMap.put("pageCount", pageCount);
			pageMap.put("arsize", m);
			essayMap.put("pageLists", pageMap);
			
			bkresult.setMsg("加载成功！！！");
			bkresult.setStatus(0);
		}else{
			bkresult.setMsg("没有查找到数据！！！");
			bkresult.setStatus(1);
		}
		Map<String, Object> filterResult=new HashMap<String, Object>(); //返回页面的过滤条件
		filterResult.put("state", state);
		filterResult.put("sortId", sortId);
		filterResult.put("recommend", recommend);
		filterResult.put("keyword", ky);
		filterResult.put("tag", kytag);
		essayMap.put("filterResult", filterResult);
		bkresult.setData(essayMap);
		return bkresult;
	}

	@Override
	public MkResult updateArState(String arIds, String state,Integer type) {
		MkResult bkResult=new MkResult();
		  String[] idArray = arIds.split(",");
		  if(idArray.length>0){
			  Map<String, Object>map=new HashMap<String, Object>();
			  map.put("state", state);
			  map.put("type", type);
			  map.put("arIds", idArray);
			  arDao.updateArState(map);
			  if(type==1){
			   bkResult.setMsg("审核成功！！");
			  }else if(type==2){
			   bkResult.setMsg("删除成功！！");
			  }else{
			   bkResult.setMsg("恢复成功！！"); 	  
			  }
			  bkResult.setStatus(0);
		  }  
		return bkResult;
	}

	@Override
	public MkResult deleteAr(String arIds) {
		MkResult bkResult=new MkResult();
		  String[] idArray = arIds.split(",");
		  if(idArray.length>0){
			  Map<String, Object>map=new HashMap<String, Object>();
			  map.put("arIds", idArray);
			  arDao.deleteAr(map);
			  bkResult.setMsg("彻底删除成功！！");
			  bkResult.setStatus(0);
		  }  
		return bkResult;
	}

	@Override
	public MkResult updateArRecommend(String arId, Integer recommend) {
			MkResult bkResult=new MkResult();
		  Map<String, Object>map=new HashMap<String, Object>();
		  map.put("arId", arId);
		  map.put("recommend", recommend);
		  arDao.updateArRecommend(map);
		  if(recommend==0){
		   bkResult.setMsg("推荐成功");
		  }else{
		   bkResult.setMsg("取消成功");
		  }
		  
		  bkResult.setStatus(0);
		  return bkResult;
	}

}
