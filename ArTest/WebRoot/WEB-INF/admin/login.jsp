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
<html>
<head lang="en">
  <base href="<%=basePath %>"/>
  <meta charset="UTF-8">
  <title>登录 - AR后台管理系统</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>AR后台管理系统</h1>
  <!--   <p>Integrated Development Environment<br/>代码编辑，代码生成，界面设计，调试，编译</p> -->
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3>重庆隽远数字科技有限公司</h3>
    <hr>
    <br>
    <br>
    <form  class="am-form">
      <label for="username">用户名:</label>
      <input type="text"  id="username"  value="${mkResult.data.userName}" placeholder="用户名" >
      <br>
      <label for="password">密码:</label>
      <input type="password"  id="password" value="${mkResult.data.passWord}" placeholder="密码">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox" class="ace" checked="checked">
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="button" id="login"  value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
     <!--    <input type="submit"  value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr"> -->
      </div>
    </form>
    <hr>
    <p>© 2016 AllMobilize, Inc. Licensed under MIT license.</p>
  </div>
</div>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
	  $("#password").keydown(function(event){
	  	if(event.keyCode!=13){
	  		return;
	  	};
	   	var username = $("#username").val().trim();
        var password = $("#password").val().trim();
         var remember = $("#remember-me").is(':checked')
            $.ajax({
          url:"admins/login",
          type:"post",
          data:{"username":username,"password":password,"remember":remember},
          dataType:"json",
          success:function(result){
            //result是服务器返回的json结果
            if(result.status==0){
              window.location.href="admins/toIndex"; 
            }else {
              alert(result.msg);
            }
          },
          error:function(){
              alert("发生异常，请重试！");
            }
            });
	  
	  });
      $("#login").click(function(){
        var username = $("#username").val().trim();
        var password = $("#password").val().trim();
        var remember = $("#remember-me").is(':checked')
            $.ajax({
          url:"admins/login",
          type:"post",
          data:{"username":username,"password":password,"remember":remember},
          dataType:"json",
          success:function(result){
            //result是服务器返回的json结果
            if(result.status==0){
              window.location.href="admins/toIndex";
            }else {
              alert(result.msg);
            }
          },
          error:function(){
              alert("发生异常，请重试！");
            }
            });
        }); 
        });   
</script>
</body>
</html>
