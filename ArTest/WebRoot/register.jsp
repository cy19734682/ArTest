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
<title>注册</title>
<link rel="stylesheet" href="resource/css/style.css">
<script src="resource/js/jquery-1.9.0.min.js"></script>

<script type="text/javascript">

	/*  $(function(){
		$("#submit").click(function(){
			var saveDataAry=[];  
			  var email1 = $(".email").val();
		      var username1 = $(".username").val();
		      var password1=$(".password").val();
		      //var confirm_password1 = $(".confirm_password").val().trim();
		      var phone_number1 = $(".phone_number").val();
		      var data1={email:email1,username:username1,password:password1,mobilePhone:phone_number1};
		      $.ajax({
		          url:"user/register1.do",
		          type:"post",
		          dataType:"json",
		          data:data1,
		          success:function(result){
		            //result是服务器返回的json结果
		            if(result.status){
		              alert(result.data);
		            }else {
		              alert(result.msg);
		            }
		          },
		          error:function(){
		              alert("发生异常，请重试！");
		            }
		       });
			
		});
	});	  */
</script>

</head>
<body>

<div class="register-container">
	<h1>注   册</h1>
	
	<div class="connect">
		<p>Link the world. Share to world.</p>
	</div>
	
	<form action="user/register.do" method="post" id="registerForm">
		<div>
			<input type="text" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="username" class="username" id="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" id="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="mobilePhone" class="mobilePhone" placeholder="输入手机号码" autocomplete="off" id="number"/>
		</div>
		<div>
			<input type="text"  class="kaptchaImage" name="kaptchaImage" style="width:150px;" id="kaptchaImage"
			 placeholder="输入验证码" autocomplete="off"/>
			 <img src="image/captcha-image.do" width="110" height="40" id="kaptchaImage" 
			 	onclick="changeValidateCode(this);" style="margin-bottom:-15px;"/>   
		</div>

		<button id="submit" type="submit">注 册</button>
	</form>
	<a href="login.jsp">
		<button type="button" class="register-tis">已经有账号？</button>
	</a>

</div>

</body>
   <script type="text/javascript">      
       /*  $(function(){           
            $('#kaptchaImage').click(function () {//生成验证码  
             $(this).hide().attr('src', 'image/captcha-image.do?' + Math.floor(Math.random()*100) ).fadeIn();
            })      
          });    */
          
  </script>  
  <script src="resource/js/common.js"></script> 
<!--背景图片自动更换-->
<!-- <script src="resource/js/supersized.3.2.7.min.js"></script>
<script src="resource/js/supersized-init.js"></script> -->
<!--表单验证-->
<script src="resource/js/base.js"></script>
 <script src="resource/js/jquery.validate.min.js"></script> 
</html>