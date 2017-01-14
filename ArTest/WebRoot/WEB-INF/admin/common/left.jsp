<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%> 
<!DOCTYPE html>
<html lang="en">
		
		 <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
		    <div class="am-offcanvas-bar admin-offcanvas-bar">
		      <ul class="am-list admin-sidebar-list">
		        <li><a href="admin-index.html"><span class="am-icon-home"></span> 首页</a></li>
		        <li class="admin-parent">
		          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-male"></span> 用户管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
		          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav">
		            <li><a href="admins/listUser?state=0"><span class=""></span> 用户列表</a></li>
		            <li><a href="admins/listUser?state=1"><span class=""></span>用户停用列表</a></li>
		          </ul>
		        </li>
		         <li class="admin-parent">
		          <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-suitcase"></span>AR资源管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
		          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
		            <li><a href="admins/listAr?state=1"><span class=""></span> 资源审核</a></li>
		            <li><a href="admins/listAr?state=0"><span class=""></span>AR资源列表</a></li>
		            <li><a href="admins/listAr?state=2"><span class=""></span>资源回收站</a></li>
		          </ul>
		        </li>
		         <li class="admin-parent">
		          <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-sort"></span>类别管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
		          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
		            <li><a href="admins/sortConfig"><span class=""></span>类别列表</a></li>
		          </ul>
		        </li>
		         <li class="admin-parent">
		          <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-gear"></span>系统管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
		          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
		            <li><a href="admins/adminInfo"><span class=""></span>管理员管理</a></li>
		            <li><a href="admins/listConfig"><span class=""></span>系统管理</a></li>
		          </ul>
		        </li>
		      </ul>
		
		      <div class="am-panel am-panel-default admin-sidebar-panel">
		        <div class="am-panel-bd">
		          <p><span class="am-icon-bookmark"></span> 公告</p>
		          <p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
		        </div>
		      </div>
		
		      <div class="am-panel am-panel-default admin-sidebar-panel">
		        <div class="am-panel-bd">
		          <p><span class="am-icon-tag"></span> wiki</p>
		          <p>Welcome to the Amaze UI wiki!</p>
		        </div>
		      </div>
		    </div>
		  </div>	
					
</body>
</html>

