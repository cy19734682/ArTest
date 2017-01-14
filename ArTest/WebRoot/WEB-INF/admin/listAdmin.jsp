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
 	<title>管理员列表 - AR后台管理系统</title>
  <meta name="description" content="管理员列表">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/amazeui.page.css"/>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>管理员列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="openadd();"><span class="am-icon-plus"></span> 新增</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        </div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
		              <tr>
						<th>用户名</th>
						<th>名称</th>
						<th>级别</th>
						<th>操作</th>
					 </tr>
              </thead>
              <tbody>
	              	<c:choose>
			       	 <c:when test="${admin.power==0}">
			        	<c:forEach items="${listAdmin.data.listadmins}" var="l">
			   			<tr>
			   				<td>${l.userName}</td>
			   				<td>${l.name}</td>
			   				<td> 
			   					 <c:choose>
				   				   		<c:when test="${l.power==0}">
				   				   			<span class="label label-sm label-warning">系统管理员</span>
				   				   		</c:when>
				   				   		<c:otherwise>
				   				   		<span class="label label-sm label-success">普通管理员</span>
				   				   		</c:otherwise>
				   				   </c:choose>
				   			</td>
					   				<c:choose>
					   					 <c:when test="${admin.adminId==l.adminId}">
					   					 	<td>
						   					 <div class="am-btn-toolbar">
			                  			 	  <div class="am-btn-group am-btn-group-xs">
						   							 <button type="button" id="openeditpw" data1="${l.adminId}" data2="${l.userName}"
						   								data3="${l.passWord}" data4="${l.name}"
						   							  	class="am-btn am-btn-default am-btn-xs am-text-secondary">
				                      				 <span class="am-icon-pencil-square-o"></span>编辑</button>
			                      				 </div>
			                      				 </div>
						   					</td>
					   					 </c:when>
					   					 <c:otherwise>
					   					 	<td>
					   					 		 <div class="am-btn-toolbar">
			                  			 		  <div class="am-btn-group am-btn-group-xs">
							   						 <button type="button" id="openeditpw" data1="${l.adminId}" data2="${l.userName}"
						   								data3="${l.passWord}" data4="${l.name}"
						   							  	class="am-btn am-btn-default am-btn-xs am-text-secondary">
				                      				 <span class="am-icon-pencil-square-o"></span>编辑</button>
							   					  	<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
							   					 	 onclick="deleuser(${l.adminId});">
				                     				 <span class="am-icon-trash-o"></span> 删除</button>
								                   </div>
							   					 </div>	 
						   					</td>
					   					 </c:otherwise>
			   						</c:choose>
			   					 
			   			</tr>
			   		</c:forEach>
			        </c:when>
			   		 <c:otherwise>
			   		  <c:forEach items="${listAdmin.data.listadmins}" var="l">
			   		  	 <c:if test="${l.adminId==admin.adminId}">
				   			<tr>
				   				<td class="center">
									<label>
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
				   				<td>${l.userName}</td>
				   				<td>${l.name}</td>
				   				<td>
				   				   <c:choose>
				   				   		<c:when test="${l.power==0}">
				   				   			<span class="label label-sm label-warning">系统管理员</span>
				   				   		</c:when>
				   				   		<c:otherwise>
				   				   			<span class="label label-sm label-success">普通管理员</span>
				   				   		</c:otherwise>
				   				   </c:choose>
				   				</td>
				   				<td>
				   					 <div class="am-btn-toolbar">
			                  			  <div class="am-btn-group am-btn-group-xs">
					   							<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
							   					 	 onclick="deleuser(${l.adminId});">
				                     			<span class="am-icon-trash-o"></span> 删除</button>
				   						</div>
				   					</div>
				   				</td>
				   			</tr>
				   		 </c:if>	
			   		  </c:forEach>
			   		 </c:otherwise>
			   	  </c:choose>
              </tbody>
            </table>
            <div class="am-cf">
                                    共 ${listAdmin.data.pageLists.adminsize}条记录
              <div class="am-fr">
                <%-- <ul class="am-pagination">
                  <c:if test="${listUser.data.pageLists.pageBar!=null&&listUser.data.pageLists.pageBar!=''}">
						   			${listUser.data.pageLists.pageBar}
   					</c:if>
                </ul> --%>
                 <div data-am-page="{pages:${listAdmin.data.pageLists.pageCount},curr:${listAdmin.data.pageLists.currentPage}
                 		,jump:'admins/adminInfo?pagenow=%page%'}">
           		 </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
	<div class="am-popup" id="myModal">
	  <div class="am-popup-inner">
	    <div class="am-popup-hd">
	      <h4 class="am-popup-title"></h4>
	      <span data-am-modal-close
	            class="am-close">&times;</span>
	    </div>
	    <div class="am-popup-bd">
	     		<form class="am-form" role="form">
         		  <input type="hidden" id="userid"/>
         		 <div class="control-group user_name">
                          <label class="control-label" for="userName">用户名</label>
                              <input type="text" class="am-form-field" id="username" placeholder="用户名">
                      </div>
                      <div class="control-group new_pw">
                          <label class="control-label" for="newpassword">新密码</label>
                              <input type="password" class="am-form-field" id="newpassword" placeholder="新密码">
                      </div>
                      <div class="control-group re_pw">
                          <label class="control-label" for="repassword">确认密码</label>
                           <input type="password" class="am-form-field" id="repassword" placeholder="确认密码">
                      </div>
                      <div class="control-group names">
                          <label class="control-label" for="name">名字</label>
                              <input type="text" class="am-form-field" id="name" placeholder="名字">
                      </div>
                      <p>
                      	<button type="button" id="add"  class="am-btn am-btn-primary" onclick="adduser();" >提交</button>
                      	<button type="button" id="edt"  class="am-btn am-btn-primary" onclick="editpw();">保存</button>
                      	<button type="button" class="am-btn am-btn-danger" data-am-modal-close>关闭</button>
                      </p>
                  </form>
            </div>
	    </div>
	  </div>
	</div>
	
    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>

  </div>
  <!-- content end -->

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
  <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.page.js"></script>
<script src="assets/layer-v2.3/layer/layer.js"></script>
<script src="assets/js/app.js"></script>
</body>
<script type="text/javascript">
	
			$("body").on("click","#openeditpw",function(){
            $(".am-popup-title").text("修改用户信息");
		    $(".user_name").hide();
		    $("input").val("");
		    $("#userid").val($(this).attr('data1'));
		    $("#newpassword").val($(this).attr('data3'));
		    $("#repassword").val($(this).attr('data3'));
		    $("#name").val($(this).attr('data4'));
		    $("#add").hide();
		    $("#edt").show();
		    $("#myModal").modal("open");
         });
		
		function openadd() {
		    $(".am-popup-title").text("新增用户");
		    $(".user_name").show();
		    $("input").val("");
		    $("#add").show();
		    $("#edt").hide();
		    $("#myModal").modal("open");
		}
		
		function editpw(){
		    if ($("#newpassword").val() == "") {
		        layer.tips('不能为空', '#newpassword');
		        return;
		    }
		    if ($("#repassword").val() == "") {
		        layer.tips('不能为空', '#repassword');
		        return;
		    }
		    if ($("#newpassword").val()!=$("#repassword").val()) {
		        layer.tips('2次密码输入不一致', '#repassword');
		        return;
		    }
		     if ($("#name").val() == "") {
		        layer.tips('不能为空', '#name');
		        return;
		    }
		    var formdata = {
		        userid: $("#userid").val(),
		        name: $("#name").val(),
		        password: $("#newpassword").val(),
		        repassword: $("#repassword").val(),
		    }
			 $.ajax({
		        url: "admins/editAdmin",
		        dataType: "json",
		        type: "post",
		        data: formdata,
		        success: function (data) {
		           if(data.status==0){
		            $("#myModal").modal("hide");
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							   $("input").val("");
							  window.location.href = "admins/adminInfo";
						});
		            
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    })
		}
		
		
		function adduser(){
			 if ($("#username").val() == "") {
		        layer.tips('不能为空', '#username');
		        return;
		    }
		    if ($("#newpassword").val() == "") {
		        layer.tips('不能为空', '#newpassword');
		        return;
		    }
		    if ($("#repassword").val() == "") {
		        layer.tips('不能为空', '#repassword');
		        return;
		    }
		     if ($("#repassword").val()!=$("#newpassword").val()) {
		        layer.tips('2次密码输入不一致', '#repassword');
		        return;
		    }
		     if ($("#name").val() == "") {
		        layer.tips('不能为空', '#name');
		        return;
		    }
		    var formdata = {
		        username: $("#username").val(),
		        password: $("#newpassword").val(),
		        name: $("#name").val(),
		    }
			 $.ajax({
		        url: "admins/addAdmin",
		        dataType: "json",
		        type: "post",
		        data: formdata,
		        success: function (data) {
		           if(data.status==0){
		              $("#myModal").modal("hide");
		             	layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							   $("input").val("");
							  window.location.href = "admins/adminInfo";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    })
		}
	
	function deleuser(uid){
		layer.confirm('你确定要删除吗？', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		  $.ajax({
		        url: "admins/delAdmin",
		        dataType: "json",
		        type: "post",
		        data:{userid:uid} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/adminInfo";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    }) 
		});
	}
</script>
</html>
