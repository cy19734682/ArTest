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
 	<title>资源回收站 - AR后台管理系统</title>
  <meta name="description" content="资源回收站">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">资源管理</strong> / <small>资源回收站</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" id="huifu" class="am-btn am-btn-default"><span class="am-icon-mail-forward"></span>恢复</button>
              <button type="button" id="delete" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <form  action="admins/listAr" method="get">
	          <div class="am-input-group am-input-group-sm">
	            <input type="hidden" name="state" value="2">
	            <input type="text" name="keyword" class="am-form-field">
	        	  <span class="am-input-group-btn">
	           		 <button class="am-btn am-btn-default" type="submit">搜索</button>
	          	</span>
	          </div>
          	</form>
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
					 <th>名称</th>
			         <th>封面图片</th>
			         <th>上传人</th>
			         <th>资源类别</th>
			         <th>上传时间</th>
			         <th>操作</th>
			      </tr>
              </thead>
              <tbody>
	              <c:if test="${bkResult.data.listar!=null}">
					<c:forEach items="${bkResult.data.listar}" var="l" varStatus="st">
						<tr>
						  <td class="center arIds">
								<label>
									<input type="checkbox" value="${l.arId}" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${l.arName}</td>
							<td>
								<img  src="${arCoverImg}" width="40px" height="40px"> 
											</td>
							<td>${l.userName}</td>
							<td>${l.sortName}</td>
							<td>${l.createTime}</td>
							<td>
							 <div class="am-btn-toolbar">
                  			  <div class="am-btn-group am-btn-group-xs">
		                     	<button type="button" onclick="huifu(${l.arId});" class="am-btn am-btn-default am-btn-xs am-text-secondary">
		                     	 		<span class="am-icon-mail-forward"></span>恢复</button>
		                    	<button type="button" onclick="deleuser(${l.arId});" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
		                      			<span class="am-icon-trash-o"></span> 删除</button>
		                     </div>
		                     </div>
		   					</td>
						</tr>
					</c:forEach>
				</c:if>		
              </tbody>
            </table>
            <div class="am-cf">
                                    共 ${bkResult.data.pageLists.arsize}条记录
              <div class="am-fr">
                 <div data-am-page="{pages:${bkResult.data.pageLists.pageCount},curr:${bkResult.data.pageLists.currentPage}
                 		,jump:'admins/listAr?keyword=${bkResult.data.filterResult.keyword}&pagenow=%page%&state=2'}">
           		 </div>
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
	function huifu(arId){
		layer.confirm('你确定要恢复吗？', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		  $.ajax({
		        url: "admins/updateArState",
		        dataType: "json",
		        type: "post",
		        data:{"arIds":arId,"state":0,"type":3} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/listAr?state=2";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    }) 
		});
		}	
	
		$("#huifu").click(function() {
            		layer.confirm('你确定要恢复吗？', {
		 			 btn: ['确认','取消'] //按钮
		     }, function(){
                var ids = "";
                if(!$(".arIds input[type='checkbox']").is(':checked')){
                	 layer.msg('请至少选择一个',{icon: 2});
                }else{
                $(".arIds input[type=checkbox]:checked").each(function() {
                    ids += $(this).val() + ',';
                }); 
                  $.post("admins/updateArState", {
                    "arIds":ids,"state":0,"type":3
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listAr?state=2";
							});
					}else{
						layer.alert(data.msg);
					}
                }); 
                }
              });
           });
		
		
		function deleuser(arId){
		layer.confirm('删除后不可恢复！你确定要删除吗？', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		  $.ajax({
		        url: "admins/deleteAr",
		        dataType: "json",
		        type: "post",
		        data:{"arIds":arId} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/listAr?state=2";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    }) 
		});
		}	
		$("#delete").click(function() {
            		layer.confirm('删除后不可恢复！你确定要删除吗？', {
		 			 btn: ['确认','取消'] //按钮
		     }, function(){
                var ids = "";
                if(!$(".arIds input[type='checkbox']").is(':checked')){
                	 layer.msg('请至少选择一个',{icon: 2});
                }else{
                $(".arIds input[type=checkbox]:checked").each(function() {
                    ids += $(this).val() + ',';
                }); 
                  $.post("admins/deleteAr", {
                    "arIds":ids
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listAr?state=2";
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
