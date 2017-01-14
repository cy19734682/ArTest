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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>"/>
<meta property="wb:webmaster" content="b926b02ed11b5e5d" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>首页</title>
<link rel="stylesheet" href="resource/css/style.css">
<script src="resource/js/jquery-1.9.0.min.js"></script>

<script type="text/javascript">
/*  $(document).ready(function(){  */

	
   
/*  });  */
</script>

</head>
<body>
	  <h1>这是一个主页</h1>
	<c:choose>
		<c:when test="${users!=null}">
		    <div class="userinfo">
			 <div><a href="index.jsp">主页</a>&nbsp;&nbsp;<a href="videoTest.jsp">视频列表</a>&nbsp;&nbsp;
			 <a href="u/to_userinfo">个人中心</a>&nbsp;&nbsp;<a href="JavaScript:logout();">注销</a></div>
			 <h2>欢迎来到未来！！！我的勇士:${users.username}</h2>
			 </div>
		</c:when>
		<c:otherwise>
		     <div class="userinfo"><a href="index.jsp">主页</a>&nbsp;&nbsp;<a href="videoTest.jsp">视频列表</a>&nbsp;&nbsp;
		     <a href="user/login">登录</a>&nbsp;&nbsp; <a href="register.jsp">注册</a></div>
		</c:otherwise>	
	</c:choose>
</body>
<!--背景图片自动更换-->
<script src="resource/js/base.js"></script>
<!-- <script src="resource/js/supersized.3.2.7.min.js"></script>
<script src="resource/js/supersized-init.js"></script> -->
<!--表单验证-->
</html>