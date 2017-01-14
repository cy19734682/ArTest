<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%> 
<!doctype html>
<html class="no-js">
<head>
  <base href="<%=basePath %>"/>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${userInfo.data.userName}的个人资料 - AR后台管理系统</title>
  <meta name="description" content="${userInfo.data.userName}的个人资料">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/amazeui.address.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->
 <jsp:include page="common/top.jsp"/>
<div class="am-cf admin-main">
  <!-- sidebar start -->
   <jsp:include page="common/left.jsp"/>
  <!-- sidebar end -->
  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / 
        	<small>${userInfo.data.userName}的个人信息</small></div>
      </div>
      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="am-g">
                <div class="am-u-md-4">
                  <img class="am-img-circle am-img-thumbnail" src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/200/h/200/q/80" alt=""/>
                </div>
                <div class="am-u-md-8">
                  <p>你可以使用<a href="#">gravatar.com</a>提供的头像或者使用本地上传头像。 </p>
                  <form class="am-form">
                    <div class="am-form-group">
                      <input type="file" id="user-pic">
                      <p class="am-form-help">请选择要上传的文件...</p>
                      <button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="user-info">
                <p>等级信息</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar" style="width: 60%"></div>
                </div>
                <p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong></p>
              </div>
              <div class="user-info">
                <p>信用信息</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar am-progress-bar-success" style="width: 80%"></div>
                </div>
                <p class="user-info-order">信用等级：正常当前 信用积分：<strong>80</strong></p>
              </div>
            </div>
          </div>
        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal" action="admins/editUser" method="post">
           <input type="hidden" name="userId" value="${userInfo.data.userId}"/>
           
           <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">用户名</label>
              <div class="am-u-sm-9">
                <input type="text" id="user-name" name="userName" value="${userInfo.data.userName}" placeholder="用户名">
              </div>
            </div>
             <div class="am-form-group">
              <label for="password" class="am-u-sm-3 am-form-label">密码</label>
              <div class="am-u-sm-9">
                <input type="password" id="password" placeholder="密码" value="${userInfo.data.passWord}" placeholder="密码">
              </div>
            </div>
             <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件</label>
              <div class="am-u-sm-9">
                <input type="email" id="user-email" value="${userInfo.data.email}" name="email" placeholder="输入你的电子邮件">
              </div>
            </div>
            <div class="am-form-group">
              <label for="user-email" class="am-u-sm-3 am-form-label">出生日期</label>
              <div class="am-u-sm-9">
                 <div class="am-form-group am-form-icon">
	                  <i class="am-icon-calendar"></i>
	                  <input type="date" class="am-form-field am-input-sm"  name="birthday"  
	                  		  value="${userInfo.data.birthday}" placeholder="生日">
	                </div>
              </div>
            </div>
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">昵称</label>
              <div class="am-u-sm-9">
                <input type="text" id="user-name" name="realName" value="${userInfo.data.realName}" placeholder="昵称" >
              </div>
            </div>
             <div class="am-form-group">
              <label for="city" class="am-u-sm-3 am-form-label">地址</label>
              <div class="am-u-sm-9" id="address">
                <input type="text" id="city" name="city" value="${userInfo.data.city}" placeholder="地址" >
              </div>
            </div>
            <div class="am-form-group">
              <label for="city" class="am-u-sm-3 am-form-label">性别</label>
              <div class="am-u-sm-9" id="gender">
               <c:choose>
               		<c:when test="${userInfo.data.gender=='男'}">
		                <label class="am-btn am-btn-default am-btn-xs">
		                  	<input type="radio" name="gender" id="option1" checked="checked">男
		                </label>
		                <label class="am-btn am-btn-default am-btn-xs">
		                 	 <input type="radio" name="gender" id="option2">女
		                </label>
               		</c:when>
               		<c:when test="${userInfo.data.gender=='女'}">
		                <label class="am-btn am-btn-default am-btn-xs">
		                  	<input type="radio" name="gender" id="option1">男
		                </label>
		                <label class="am-btn am-btn-default am-btn-xs">
		                 	 <input type="radio" name="gender" id="option2" checked="checked">女
		                </label>
               		</c:when>
               		<c:otherwise>
               			<label class="am-btn am-btn-default am-btn-xs">
		                  	<input type="radio" name="gender" id="option1">男
		                </label>
		                <label class="am-btn am-btn-default am-btn-xs">
		                 	 <input type="radio" name="gender" id="option2">女
		                </label>
               		</c:otherwise>
               </c:choose>
              </div>
            </div>
            <div class="am-form-group">
              <label for="user-phone" class="am-u-sm-3 am-form-label">电话</label>
              <div class="am-u-sm-9">
                <input type="tel" id="user-phone" name="mobilephone" value="${userInfo.data.mobilePhone}"
                 placeholder="输入你的电话号码  ">
              </div>
            </div>
            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="submit" class="am-btn am-btn-primary">保存修改</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>

  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/address.min.js"></script>
<script src="assets/js/iscroll.min.js"></script>
<script src="assets/js/app.js"></script>

<script type="text/javascript">
	$(function() { $('#address').address({
		scrollToCenter: true,
		footer: true
	  });
	 });
</script>
</body>
</html>
