package com.yush.ar.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 分页类，设置currPage,pageCount,pageCodeCount,pageRows
 * */
public class ShowPages  implements Serializable {

	private int currPage;           //当前页码
	private int pageCount;          //页总数
	private String pageBar;         //页码条字符串
	
	private int pageCodeCount=10;   //显示的页码个数
	private int halfPageCode=3;     //页码个数的一半
	
	public int getHalfPageCode() {
		return halfPageCode;
	}
	public void setHalfPageCode(int halfPageCode) {
		this.halfPageCode = halfPageCode;
	}
	public int getPageCodeCount() {
		return pageCodeCount;
	}
	public void setPageCodeCount(int pageCodeCount) {
		this.pageCodeCount = pageCodeCount;
		if(pageCodeCount%2==0)
			halfPageCode=pageCodeCount/2;
		else
			halfPageCode=pageCodeCount/2+1;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	
	private String getHrefStr(int pageNumber)
	{
		String strHref="<a href='javascript:;' onclick='javascript:jumpPage("+pageNumber+");return false;'>";
		//String strHref="<a href='javascript:void(0)' onclick='javascript:jumpPage("+pageNumber+");'>";
		return strHref;
	}
	public String getPageBar() {
		if(this.pageCount==0) return "";
		
		
		StringBuffer sResult=new StringBuffer();
		//首页 href="#"
		String str="";
		if(currPage==1){
			str="<li><a>&laquo;</a></li>";
		}else {
			str="<li> "+getHrefStr(1)+"&laquo;</a></li>";
		}
		//sResult.append("<span>"+getHrefStr(this.currPage-1)+"上一页</a></span>");
		sResult.append(str);
		//sResult.append("<span class=\"page\"><</span>");
		//if(this.currPage>1)
			//sResult.append("<span class=\"page\">"+getHrefStr(this.currPage-1)+"上一页</a></span>");
		if(this.currPage-(halfPageCode-1)>1&&this.pageCount>pageCodeCount)
			sResult.append("<li><a>...</a></li>");
		int start=1;
		if(this.currPage>halfPageCode){
			if(this.pageCount-this.currPage<halfPageCode){
				start=this.pageCount-(pageCodeCount-1);
			}else{
				start=this.currPage-(halfPageCode-1);
			}
		}
		start=start<1?1:start;
		int end=this.pageCount;
		if(start+(pageCodeCount-1)<this.pageCount)
			end=start+(pageCodeCount-1);
		else
			end=this.pageCount;
		for(int i=start;i<=end;i++){
			if(this.currPage==i){
				sResult.append("<li class=\"active\"><a>"+i+"</a></li>");
			}else{
				sResult.append("<li>"+getHrefStr(i)+i+"</a></li>");
			}
		}
		if(end!=this.pageCount)
			sResult.append("<li><a>...</a></li>");
		/*if(this.currPage<this.pageCount)
			sResult.append("<span class="page"><a href='javascript:jumpPage("+(this.currPage+1)+");'>下一页</a></span>");*/
		//末页
		//sResult.append("<span>"+getHrefStr(this.currPage+1)+"下一页</a></span>");
		if(currPage==pageCount){
			str="<li><a>&raquo;</a> </li>";
		}else {
			str="<li> "+getHrefStr(this.pageCount)+"&raquo;</a> </li>";
		}
		sResult.append(str);
		return sResult.toString();
	}
	public void setPageBar(String pageBar) {
		this.pageBar = pageBar;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
