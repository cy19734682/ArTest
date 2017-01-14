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
<script type="text/javascript" src="resource/js/city.min.js"></script>
  <script type="text/javascript" src="resource/js/laydate.dev.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		  var point= $(".point").val();
		  /* var cuntp= $(".currentp").val();
		   var nextp=$(".next").val();
		  var a1=parseInt(nextp)-parseInt(cuntp);
		$('#sample_goal').goalProgress({
			goalAmount:parseInt(nextp)-parseInt(cuntp),
			currentAmount:parseInt(point)-parseInt(cuntp),
			speed: 0,
			textBefore: '',
			textAfter: ''
		}); */
		 var piclist,nextpoint,currentpoint;
		 /* $.ajax({
	          url:"user/toGetLevel.do",
	          type:"post",
	          dataType:"json",
	          data:"",
	          success:function(result){
	             if(result){ 
	            	  piclist = result.data;
	            	  nextpoint=piclist.nextLevelpoints;
	            	  currentpoint=piclist.currentLevelpoints;
					$('#sample_goal').goalProgress({
						goalAmount:parseInt(nextpoint)-parseInt(currentpoint),
						currentAmount:parseInt(point)-parseInt(currentpoint),
						speed: 0,
						textBefore: '',
						textAfter: ''
					});
					$('#sample_goal').attr("title","离下一等级还差"+(parseInt(nextpoint)-parseInt(point))+"积分");
	             }else {
				  alert("系统繁忙，请稍后再试!")
	            } 
	          } ,
	          error:function(){
	              alert("发生异常，请重试！");
	            }  
	       }); */
		 
			
		
		 
		  $("#city").citySelect({
				prov:"",
				city:""
			});
		
			laydate({
	            elem: document.getElementById('birthday')
	        });
	});

	
</script>

</head>
<body>

<div class="register-container">
	<h1>用户信息</h1>
	 <h2 style="color:green;">${msg}</h2>
	<div class="connect">
		<p>亲爱的:${usersinfo.username}</p>
		<p>你的邮箱是:${usersinfo.email}</p>
		<p>
	<%-- 	<div class="container">
			<span>积分:</span><div id="sample_goal"></div>
		</div>
		</p>
		 <input type="hidden" class="point" value="${usersinfo.userpoints}"/> --%>
	</div>
	 
	<form action="user/editUser.do" method="post" id="registerForm">
		<div>
			<input type="text" name="realName" class="realName" value="${usersinfo.realName}" placeholder="输入真实姓名" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="birthday" id="birthday" class="birthday" value="${usersinfo.birthday}" placeholder="输入生日"  />
		</div>
		<div>
			<%-- <input type="text" name="city" class="city" value="${usersinfo.city}" placeholder="输入所在城市" oncontextmenu="return false" onpaste="return false" /> --%>
		     <span id="city" class="liststyle">
			           <span class="year" id="Province">
			                      <%--  <input type="hidden" value="${fn:substring(aioUser.city,0,3)}" id="prov1"/> --%>
									<select class="prov js-example-basic-single" name="prov">
									</select>  
						</span>
			         	 <span class="year1" id="City">
			         	          <%--  <input type="hidden" value="${fn:substring(aioUser.city,4,10)}" id="city1"/> --%>
									<select class="city" name="city" disabled="disabled">
									</select> 
						  </span>
			         </span>
		</div>
		<button id="submit" type="submit">确  定</button>
	</form>
	 <a href="user/toGoIndex.do">
		<button type="button" class="register-tis">回 到 主 页</button>
	</a> 

</div>

</body>
<script type="text/javascript">

</script>
<script src="resource/js/base.js"></script>
   <script src="resource/js/goalProgress.js"></script> 
 <script src="resource/js/common.js"></script> 
 <script type="text/javascript" src="resource/js/jquery.cityselect.js"></script>
<!--背景图片自动更换-->
<!-- <script src="resource/js/supersized.3.2.7.min.js"></script>
<script src="resource/js/supersized-init.js"></script> -->
<!--表单验证-->
 <script src="resource/js/jquery.validate.min.js"></script> 
</html>