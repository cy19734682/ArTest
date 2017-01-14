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
 	<title>路径配置列表 - AR后台管理系统</title>
  <meta name="description" content="配置列表">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>系统配置列表</small></div>
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
						  <th>配置参数标签</th>
					   	  <th>配置参数名称</th>
					   	  <th>配置参数值</th>
						  <th>操作</th>
					 </tr>
              </thead>
              <tbody>
              		<c:forEach items="${listConfig.data}" var="l">
			   			<tr>
			   				<td>${l.configLable}</td>
			   				<td>${l.configName}</td>
			   				<td>${l.configValue}</td>
	   					 	<td>
			   					 <div class="am-btn-toolbar">
		                  			  <div class="am-btn-group am-btn-group-xs">
		                  			  		<button type="button" id="openeditpw" data1="${l.configId}" data2="${l.configLable}"
		   									data3="${l.configName}" data4="${l.configValue}" 
			   							  	class="am-btn am-btn-default am-btn-xs am-text-secondary">
	                      					 <span class="am-icon-pencil-square-o"></span>编辑</button>
				   							<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
						   					 	 onclick="deleuser(${l.configId});">
			                     			<span class="am-icon-trash-o"></span> 删除</button>
			   						</div>
			   					</div>
		   					</td>
			   			</tr>
					</c:forEach>
	              	
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
         		  	  <input type="hidden" id="configId"/>
	         		 <div class="control-group config_Lable">
                           <label class="control-label" for="configLable">配置参数标签</label>
                               <input type="text" class="am-form-field" id="configLable" placeholder="配置参数标签">
                       </div>
                       <div class="control-group config_Name">
                           <label class="control-label" for="configName">配置参数名称</label>
                               <input type="text" class="am-form-field" id="configName" placeholder="配置参数名称">
                       </div>
                       <div class="control-group config_Value">
                           <label class="control-label" for="configValue">配置参数值</label>
                            <input type="text" class="am-form-field" id="configValue" placeholder="配置参数值">
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
            $(".am-popup-title").text("修改系统配置信息");
		    $("input").val("");
		    $("#configId").val($(this).attr('data1'));
		    $("#configLable").val($(this).attr('data2'));
		    $("#configName").val($(this).attr('data3'));
		    $("#configValue").val($(this).attr('data4'));
		    $("#add").hide();
		    $("#edt").show();
		    $("#myModal").modal("open");
         });
		
		function openadd() {
		    $(".am-popup-title").text("新增系统配置");
		    $("input").val("");
		    $("#add").show();
		    $("#edt").hide();
		    $("#myModal").modal("open");
		}
		
		function editpw(){
	
		    if ($("#configLable").val() == "") {
		        layer.tips('不能为空', '#configLable');
		        return;
		    }
		    if ($("#configName").val() == "") {
		        layer.tips('不能为空', '#configName');
		        return;
		    }
		     if ($("#configValue").val() == "") {
		        layer.tips('不能为空', '#configValue');
		        return;
		    }
		    var formdata = {
		        configId: $("#configId").val(),
		        configLable: $("#configLable").val(),
		        configName: $("#configName").val(),
		        configValue: $("#configValue").val(),
		    }
			 $.ajax({
		        url: "admins/editConfig",
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
							  window.location.href = "admins/listConfig";
						});
		            
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    })
		}
		
		
		function adduser(){
		    if ($("#configLable").val() == "") {
		        layer.tips('不能为空', '#configLable');
		        return;
		    }
		    if ($("#configName").val() == "") {
		        layer.tips('不能为空', '#configName');
		        return;
		    }
		     if ($("#configValue").val() == "") {
		        layer.tips('不能为空', '#configValue');
		        return;
		    }
		    var formdata = {
		        configLable: $("#configLable").val(),
		        configName: $("#configName").val(),
		        configValue: $("#configValue").val(),
		    }
		    
			 $.ajax({
		        url: "admins/addConfig.do",
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
							  window.location.href = "admins/listConfig";
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
		        url: "admins/delConfig.do",
		        dataType: "json",
		        type: "post",
		        data:{configId:uid} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/listConfig";
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
