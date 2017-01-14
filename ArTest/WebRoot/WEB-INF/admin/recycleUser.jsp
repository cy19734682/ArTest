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
 	<title>用户停用列表 - AR后台管理系统</title>
  <meta name="description" content="用户停用页面">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>用户停用列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" id="huanyuan" class="am-btn am-btn-default"><span class="am-icon-mail-forward"></span>恢复</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
         <!--  <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
          </div> -->
        </div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
				<th class="center">
					<label>
						<input type="checkbox" class="ace" />
						<span class="lbl"></span>
					</label>
				</th>
				<th>头像</th>
				<th>用户名</th>
				<th>邮箱</th>
				<th>昵称</th>
				<th>性别</th>
				<th>生日</th>
				<th>手机</th>
				<th>注册时间</th>
				<th>上次登录时间</th>
				<th>操作</th>
				</tr>
              </thead>
              <tbody>
              	<c:forEach items="${listUser.data.listadmins}" var="l">
		   			<tr>
		   				<td class="center userIds">
							<label>
								<input type="checkbox" value="${l.userId}" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>
		   				<td>
		   					<c:choose>
		   						<c:when test="${l.userhead!=''&&l.userhead!=null}">
		   							<img  src="${l.userhead}" width="40px" height="40px">
		   						</c:when>
		   						<c:otherwise>
		   							<img  src="assets/i/moren.jpg" width="40px" height="40px">
		   						</c:otherwise>
		   					</c:choose>
		   				</td>
		   				<td>${l.userName}</td>
		   				<td>${l.email}</td>
		   				<td>${l.realName}</td>
		   				<td>${l.gender}</td>
		   				<td>${l.birthday}</td>
		   				<td>${l.mobilePhone}</td>
		   				<td>${l.registerTime}</td>
		   				<td>${l.last_login_time}</td>
   					 	<td>
		   					<div class="am-btn-toolbar">
		                    <div class="am-btn-group am-btn-group-xs">
		                      <a href="JavaScript:;">
		                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleuser(${l.userId});">
		                      <span class="am-icon-mail-forward"></span>恢复</button>
		                      </a>
		                    </div>
		                  </div>
	   					</td>
		   					
		   			</tr>
		   		</c:forEach>
              </tbody>
            </table>
            <div class="am-cf">
                                    共 ${listUser.data.pageLists.userSize}条记录
              <div class="am-fr">
                <%-- <ul class="am-pagination">
                  <c:if test="${listUser.data.pageLists.pageBar!=null&&listUser.data.pageLists.pageBar!=''}">
						   			${listUser.data.pageLists.pageBar}
   					</c:if>
                </ul> --%>
                 <div data-am-page="{pages:${listUser.data.pageLists.pageCount},curr:${listUser.data.pageLists.currentPage}
                 		,jump:'admins/listUser?state=1&pagenow=%page%'}">
           		 </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
	<div class="am-popup" id="my-popup">
	  <div class="am-popup-inner">
	    <div class="am-popup-hd">
	      <h4 class="am-popup-title"></h4>
	      <span data-am-modal-close
	            class="am-close">&times;</span>
	    </div>
	    <div class="am-popup-bd">
	     		<table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th>头像</th>
                <th>用户名</th>
				<th>昵称</th>
				<th>性别</th>
				<th>注册时间</th>
              </tr>
              </thead>
              <tbody class="listfollower">
              </tbody>
            </table>
             <div class="am-cf">
              <div class="am-fr" id="fensipagination">
              </div>
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
</div>

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
	jQuery(function($) {
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
	})
	function deleuser(uid){
		layer.confirm('你确定要恢复吗？', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		  $.ajax({
		        url: "admins/huifuUser",
		        dataType: "json",
		        type: "post",
		        data:{userIds:uid} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/listUser?state=1";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    }) 
		});
	}	
	
		$("#huanyuan").click(function() {
            		layer.confirm('你确定要恢复吗？', {
		 			 btn: ['确认','取消'] //按钮
		     }, function(){
                var ids = "";
                if(!$(".userIds input[type='checkbox']").is(':checked')){
                	 layer.msg('请至少选择一个',{icon: 2});
                }else{
                $(".userIds input[type=checkbox]:checked").each(function() {
                    ids += $(this).val() + ',';
                }); 
                  $.post("admins/huifuUser", {
                    userIds: ids
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listUser?state=1";
							});
					}else{
						layer.alert(data.msg);
					}
                }); 
                }
              });
           });
</script>
</html>
