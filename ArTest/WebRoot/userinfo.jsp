<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>用户资料</title>
<link rel="stylesheet" href="resource/css/style.css">
<link rel="stylesheet" href="resource/css/goalProgress.css">
<script src="resource/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>

<div class="register-container">
	<c:choose>
		<c:when test="${users!=null}">
		    <div class="userinfo">
			  <a href="JavaScript:logout();">注销</a></div>
		</c:when>
		<c:otherwise>
		    <div class="userinfo">
		    <a href="user/login">登录</a>&nbsp;&nbsp; <a href="register.jsp">注册</a></div>
		</c:otherwise>	
	</c:choose>
	
	<h1>用户信息</h1>
	<div class="connect">
		<h2>用户:${usersinfo.username}</h2>
	</div>
		 <c:choose>
		 	<c:when test="${users!=null}">
		 		<a  href="u/${usersinfo.userid}/admin/edituser" title="修改个人资料"><button>修改个人资料</button></a> 
		 	</c:when>
		 	<c:otherwise>
				 <div class="oauth">
					     <a  href="JavaScript:;" title="关注">
							关注
						 </a> 
						  <a  href="JavaScript:;" title="私信">
							私信
						 </a> 
				 </div>	
		 	</c:otherwise>
		 </c:choose>

</div>

</body>
<script type="text/javascript">

</script>
<script src="resource/js/base.js"></script>
</html>