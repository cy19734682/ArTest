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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>临时账户</title>
<link rel="stylesheet" href="resource/css/style.css">
<script src="resource/js/jquery-1.9.0.min.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

<div class="register-container">
	<h1>临时用户</h1>
	
	<div class="connect">
		<p>恭喜你登录成功！你的临时账户为:${users.username}</p>
		<p style="margin-top:10px;">你可以继续完善资料，也可以<a href="user/toGoIndex.do" style="color:green;height:0;">跳过</a>此步骤！</p>
	</div>
	
	<form action="user/perfectUser.do" method="post" id="registerForm">
	     <input type="hidden" name="userid" value="${users.userid}"/>
		<div>
			<input type="text" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="mobilePhone" class="mobilePhone" placeholder="输入手机号码" autocomplete="off" id="number"/>
		</div>
		

		<button id="submit" type="submit">完  成</button>
	</form>
	<a href="user/toGoIndex.do">
		<button type="button" class="register-tis">跳过此步骤</button>
	</a>

</div>

</body>
<script type="text/javascript">

</script>
<script src="resource/js/base.js"></script>
 <script src="resource/js/common.js"></script> 
<!--背景图片自动更换-->
<!-- <script src="resource/js/supersized.3.2.7.min.js"></script>
<script src="resource/js/supersized-init.js"></script> -->
<!--表单验证-->
 <script src="resource/js/jquery.validate.min.js"></script> 
</html>