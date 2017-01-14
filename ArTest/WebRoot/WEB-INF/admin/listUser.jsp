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
 	<title>用户列表 - AR后台管理系统</title>
  <meta name="description" content="这是一个 table 页面">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> / <small>用户列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
             <!--  <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button> -->
              <button type="button" id="delete" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        <!--   <div class="am-form-group">
            <select data-am-selected="{btnSize: 'sm'}">
              <option value="option1">所有类别</option>
              <option value="option2">IT业界</option>
              <option value="option3">数码产品</option>
              <option value="option3">笔记本电脑</option>
              <option value="option3">平板电脑</option>
              <option value="option3">只能手机</option>
              <option value="option3">超极本</option>
            </select>
          </div> -->
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
				<th>粉丝</th>
				<th>关注</th>
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
		   				<td>
		   					 <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary fensi"
		   					 data1="${l.userName}" data2="${l.userId}" title="粉丝">
		                       <span class="am-icon-user-plus"></span>${l.count1}</button>
		   				</td>
		   				<td>
		   					<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary guanzhu"
		   					 data1="${l.userName}" data2="${l.userId}" title="关注">
		                       <span class="am-icon-heart"></span>${l.count2}</button>
		   				</td>
		   				<td>${l.registerTime}</td>
		   				<td>${l.last_login_time}</td>
   					 	<td>
		   					<div class="am-btn-toolbar">
		                    <div class="am-btn-group am-btn-group-xs">
		                      <a href="admins/getByIdUser?uid=${l.userId}">
		                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary">
		                      	<span class="am-icon-pencil-square-o"></span> 编辑</button>
		                      </a>
		                      <a href="JavaScript:;">
		                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleuser(${l.userId});">
		                      <span class="am-icon-trash-o"></span> 删除</button>
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
                 		,jump:'admins/listUser?state=0&pagenow=%page%'}">
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
	 function loadFsUser(userid,pagenow,lx){
	  	    var fsurl;	
	  	    if(lx==0){
	  	       fsurl="admins/feisiList";
	  	    }else{
	  	       fsurl="admins/guanzhuList";
	  	    }
	  	   $.ajax({
		        url: fsurl,
		        dataType: "json",
		        type: "post",
		        data:{userId:userid,pagenow:pagenow} ,
		        success: function (data) {
		           if(data.status==0){
		            	 var  userhead,userName,realName,gender,registerTime;
		            	 var sdata=data.data.listadmins; 
		            	 $(".listfollower").html("");	
						 $("#fensipagination").html("");	
		            	 var headImg="";
		            	 var s_tr="";
		            	 for(var i=0;i<sdata.length;i++){
		            	 		userhead=typeof(sdata[i].userhead) == "undefined"?"":sdata[i].userhead;
		            	 		headImg=userhead==""?"assets/i/moren.jpg":userhead;
		            	 		userName=typeof(sdata[i].userName) == "undefined"?"":sdata[i].userName;
		            	 		realName=typeof(sdata[i].realName) == "undefined"?"":sdata[i].realName;
		            	 		gender=typeof(sdata[i].gender) == "undefined"?"":sdata[i].gender;
		            	 		registerTime=typeof(sdata[i].registerTime) == "undefined"?"":sdata[i].registerTime;
		            	 		s_tr+="<tr><td><img  src=\""+headImg+"\" width=\"40px\" height=\"40px\"></td>"+
		            	 		"<td>"+userName+"</td><td>"+realName+"</td><td>"+gender+"</td><td>"+getMyDate(registerTime)+"</td></tr>";
		            	 }
		            	 $(".listfollower").append(s_tr);
		            	 
      					   $("#fensipagination").page({
		                        pages:data.data.pageLists.pageCount,
		                        groups:5, //连续显示分页数
		                        curr:pagenow,
		                        /* prev:false,
		                        next:false, */
		                        render: function(context, $element, index) { //[context：对this的引用，$element：当前元素，index：当前索引]
					                $element.click(function(){
					                   if(index == 'prev'){
					                      index=pagenow-1;
					                   }
					                   if(index == 'next'){
					                      index=pagenow+1;
					                   }
					                  loadFsUser(userid,index,lx);
					                });
					       		}
		                    })  
                    
		           }else{
		              	 $(".listfollower").append("<tr><td colspan=\"7\">该用户还没有粉丝</td></tr>");
		           }
		        }
		    })
	  };
	
	$("body").on("click",".fensi",function(){
           $(".am-popup-title").text($(this).attr('data1')+"的粉丝列表");
			var userid=$(this).attr('data2');
			 $(".listfollower").html("");	
			 $("#fensipagination").html("");	
			 loadFsUser(userid,1,0); 
		    $("#my-popup").modal("open");
         });
      
	$("body").on("click",".guanzhu",function(){
          $(".am-popup-title").text($(this).attr('data1')+"的关注列表");
		var userid=$(this).attr('data2');
		 $(".listfollower").html("");	
		$("#fensipagination").html("");	
		 loadFsUser(userid,1,1);
	    $("#my-popup").modal("open");
        });	   
     
     function deleuser(userId){
     	layer.confirm('你确定要删除吗？', {
		 			 btn: ['确认','取消'] //按钮
		     }, function(){
                  $.post("admins/recycleUser", {
                    userIds: userId
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listUser?state=0";
							});
					}else{
						layer.alert(data.msg);
					}
                }); 
                });
     }   
        
	$("#delete").click(function() {
            		layer.confirm('你确定要删除吗？', {
		 			 btn: ['确认','取消'] //按钮
		     }, function(){
                var ids = "";
                if(!$(".userIds input[type='checkbox']").is(':checked')){
                	 layer.msg('请至少选择一个',{icon: 2});
                }else{
                $(".userIds input[type=checkbox]:checked").each(function() {
                    ids += $(this).val() + ',';
                }); 
                  $.post("admins/recycleUser", {
                    userIds: ids
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listUser?state=0";
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
