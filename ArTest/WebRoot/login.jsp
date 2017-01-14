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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登陆丨Sharelink</title>
<link rel="stylesheet" href="resource/css/style.css">
<script src="resource/js/jquery-1.9.0.min.js"></script>
  <script type="text/javascript">
  $(function(){
  	  var states= $(".states").val();		
      if(states=="0"){
    	  alert("注册成功！！！");
      }else if(states=="2"){
    	  alert("用户名或密码错误！！！")
      } 
      
      
      $(".youke").click(function(){
 		 window.location.href="user/addTemUsers";
 	 });
      
  });
  </script>

</head>
<body>

<div class="login-container">
	<h1>登  录</h1>
	
	<div class="connect">
		<p>Link the world. Share to world.</p>
	</div>
	
	<form action="user/ulogin" method="post" id="loginForm">
	        <input type="hidden" class="states" value="${states}"/>
		<div>
			<input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
		</div>
		<button id="submit" onclick="loginAtion();" type="button">登 陆</button>
	</form>
		 <div class="oauth">
			     <a  href="oauth/github/login.do" title="github登录">
					<img  src="resource/images/githubico.png">
				 </a> 
				  <a  href="oauth/baidu/login.do" title="百度登录">
					<img  src="resource/images/baiduico.png">
				 </a> 
				  <a  href="oauth/weibo/login.do" title="微博登录">
					<img  src="resource/images/weiboico.png">
				 </a> 
				   <a  href="oauth/qq/login.do" title="QQ登录">
					<img  src="resource/images/qqico.png">
				 </a> 
		 </div>	
		<div> 
			 <a class="clsa youke" href="JavaScript:;">
				<button type="button" class="register-tis">游客身份继续？</button>
			</a> 
		</div>
		<div>
			 <a class="clsa" href="register.jsp">
				<button type="button" class="register-tis">还有没有账号？</button>
			</a> 
		</div>

</div>

</body>
<script type="text/javascript">
		function loginAtion(){  
		    if(validateFormValidateor.form()){  
		        $("#loginForm").ajaxSubmit({  
		            success:function(data){  
		            	if(data){
		            	    if(data.status==1){
		            	    	alert(data.msg);
		            	    }else if(data.status==2){
		            	    	alert(data.msg);
		            	    }else{
		            	    	window.location.href=data.data;
		            	    }
		            	}
		            },
		            error:function(){
		            	alert("发生异常，请重试")
		            }
		         });  
		    }  
		}  
		$(".password").keydown(function(event){
		  	if(event.keyCode!=13){
		  		return;
		  	};
		  	loginAtion();
		});
	
</script>
<script src="resource/js/base.js"></script>
<script src="resource/js/common.js"></script>
<script src="resource/js/jquery.form.js"></script>
<!--背景图片自动更换-->
<!-- <script src="resource/js/supersized.3.2.7.min.js"></script>
<script src="resource/js/supersized-init.js"></script> -->
<!--表单验证-->
<script src="resource/js/jquery.validate.min.js?var1.14.0"></script>
</html>