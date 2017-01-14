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
 <title>类别配置 - AR后台管理系统</title>
  <meta name="description" content="类别配置">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <style type="text/css">
		.tree {
    min-height:20px;
    padding:5px;
    width:100%;
  /*   height:600px; */
    float:left;
    margin-bottom:20px;
    background-color:#fbfbfb;
    border:1px solid #999;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05)
}
.tree ul{
	margin-top: 0; 
	margin-bottom:0;
}
.tree .treeul{
-webkit-padding-start: 5px;
}
.tree li {
    list-style-type:none;
    margin:0;
    padding:10px 5px 0 5px;
    position:relative
}
.tree li::before, .tree li::after {
    content:'';
    left:-20px;
    position:absolute;
    right:auto
}
.tree li::before {
    border-left:1px solid #999;
    bottom:50px;
    height:100%;
    top:0;
    width:1px
}
.tree li::after {
    border-top:1px solid #999;
    height:20px;
    top:25px;
    width:25px
}
.tree li span {
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
    border:1px solid #999;
    border-radius:5px;
    display:inline-block;
    padding:3px 8px;
    text-decoration:none
}
.tree li.parent_li>span {
    cursor:pointer
}
.tree>ul>li::before, .tree>ul>li::after {
    border:0
}
.tree li:last-child::before {
    height:30px
}
.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
    background:#eee;
    border:1px solid #94a0b4;
    color:#000
}
  </style>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">类别管理</strong> / <small>类别列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        </div>
      </div>
      <div class="am-g">
        <div class="am-u-sm-12 tree well">
			            <div class="am-u-sm-12 am-u-md-6">
								<ul class="treeul">
									<li>
										<span><i class="am-icon-folder"></i></span> 
										<a href="JavaScript:;" onclick="getSortInfo({'sortId':0,'sortName':'全部'});" >全部</a>
										<ul class="treenote">
										
										</ul>
									</li>
									
								</ul>
						  </div>
						  <div class="am-u-sm-12 am-u-md-6">	
						               <div class="am-btn-toolbar">
							            <div class="am-btn-group am-btn-group-xs">
							              	<button type="button" class="am-btn am-btn-default" id="addSort">
							              	<span class="am-icon-plus"></span>新建子类</button>
							              	<button type="button" class="am-btn am-btn-default" id="delSort">
							              	<span class="am-icon-trash-o"></span>删除</button>
							            </div>
							          </div>
						  			<form class="am-form" role="form">
						  				<div class="form-group sortId">
										    <label for="articleTitle">类别编号:</label>
										    <input type="text" class="am-form-field" id="sortId"  disabled="disabled"  placeholder="">
									    </div>
										<div class="form-group sortName">
										    <label for="articleTitle">类别名称:</label>
										    <input type="text" class="am-form-field" id="sortName" placeholder="请输入类别名称">
									    </div>
									    <div class="form-group parentId">
										    <label for="articleTitle">父级编号:</label>
										    <input type="text" class="am-form-field" id="parentId" disabled="disabled"  >
									    </div>
									    <div class="form-group description">
										    <label for="articleTitle">类别描述</label>
										    <input type="text" class="am-form-field" id="description"  name="blog_title">
									    </div>
										 <button type="button" id="hand" style="display:none;" class="am-btn am-btn-primary">提交</button>
										 <button type="button" id="upSort"  class="am-btn am-btn-primary">修改</button>
								</form>
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
<script src="assets/layer-v2.3/layer/layer.js"></script>
<script src="assets/js/app.js"></script>
</body>
<script type="text/javascript">
			 loadSort();
    		
    		 $(document).on("click",".tree li.parent_li > span", function (e) {
		        var children = $(this).parent('li.parent_li').find(' > ul > li');
		        if (children.is(":visible")) {
		            children.hide('fast');
		            $(this).attr('title', 'Expand this branch').find(' > i').addClass('glyphicon-plus').removeClass('glyphicon-minus');
		        } else {
		            children.show('fast');
		            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('glyphicon-minus').removeClass('glyphicon-plus');
		        }
		        e.stopPropagation();
    		 });
    		
    		function loadSort(){
    			$.ajax({
    	        url:"admins/listSort.do",
    	        type:"post",
    	        data:"",
    	        async: false,
    	        dataType:"json",
    	        success:function(result){
    	        	if(result.data!=null){
    	        		 var sdata,sortId,sortName,description,parentId,note;
						sdata=result.data;
						$(".treenote").html("");
						var s_li="";
	    	        	for(var i=0;i<sdata.length;i++){
	    	        		sortId=sdata[i].sortId;
	    	        		sortName=sdata[i].sortName;
	    	        		parentId=sdata[i].parentId;
	    	        		description=sdata[i].description
	    	        		note=sdata[i].note;
	    	        		if(parentId==0){
	    	        			  if(note==1){  
									  s_li+="<li>"+
											"<span><i class=\"am-icon-folder\"></i></span><a href=\"javascript:;\" onclick='getSortInfo("+JSON.stringify(sdata[i])+");'>"+sortName+"</a>"+
									  		 "<ul>";
									for(var j=0;j<sdata.length;j++){
										var sortId1=sdata[j].sortId;
				    	        		var sortName1=sdata[j].sortName;
				    	        		var parentId1=sdata[j].parentId;
				    	        		var description=sdata[j].description;
				    	        		var note1=sdata[j].note;
				    	        		
				    	        		if(sortId==parentId1){
				    	        		   if(note1==0){
				    	        			s_li+="<li>"+
												"<span><i class=\"am-icon-file\"></i></span><a href=\"javascript:;\" onclick='getSortInfo("+JSON.stringify(sdata[j])+");'>"+sortName1+"</a>"+
												  "</li>";
											}else{ 
											s_li+="<li>"+
														"<span><i class=\"am-icon-folder\"></i></span><a href=\"javascript:;\" onclick='getSortInfo("+JSON.stringify(sdata[j])+");'>"+sortName1+"</a>"+
												  "</li>";
											 } 
				    	        		  } 
									  }
											s_li+="</ul>"+	
											  "</li>";
								
								 } 
								 else{
								    s_li+="<li>"+
										"<span><i class=\"am-icon-file\"></i></span><a href=\"javascript:;\" onclick='getSortInfo("+JSON.stringify(sdata[i])+");'>"+sortName+"</a>"+
									  "</li>"; 
								} 
							
						 }	  
	    	        	}
	    	        	$(".treenote").append(s_li);
    	          }else{
    	          	 alert("查询失败！！");
    	          }
    			}
    		}); 
    		
    		 $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    		
    		}
    		
    		function  loadInput(){
    			$("input").val("");
    			$(".sortId").show();
    	   		$("#hand").hide();
    			$("#upSort").show();
    		}
    		
    		function getSortInfo(redata){
    			$("input").val("");
    			$(".sortId").show();
    			$("#sortId").val(redata.sortId);
    			$("#sortName").val(redata.sortName);
    			$("#parentId").val(redata.parentId);
    			$("#description").val(redata.description);
    			$("#upSort").show();
    	   		$("#hand").hide();
    		}
    		
    	   $("#addSort").click(function(){
    	   		$("#parentId").val($("#sortId").val());
    	       if($("#parentId").val()!=""){
    	   		$(".sortId").hide();
    	   		$("#sortName").val("");
    	   		$("#description").val("");
    	   		$("#upSort").hide();
    	   		$("#hand").show();
    	      }else{
    	      	 layer.msg("请选择一个类别",{icon: 2});
    	      }
    	   });
    	   
    	   $("#hand").click(function(){
    	   		var parentId=$("#parentId").val().trim();
    	   		var sortName=$("#sortName").val().trim();
    	   		var description=$("#description").val().trim();
    	   		var data={parentId:parentId,sortName:sortName,description:description};
    	   		if(sortName==""){
    	   		   layer.msg("类别名称不能为空",{icon: 2});
    	   		}else{
    	   		 $.ajax({
		          url:"admins/addSort.do",
		          type:"post",
		          dataType:"json",
		          data:data,
		          success:function(result){
					if(result.status==0){
					  layer.alert(result.msg);
			            loadSort();
			            loadInput();
					}else{
						layer.alert(result.msg);
					}
		          },
		          error:function(){
		              layer.alert("发生异常，请重试！");
		            }
		      	 }); 
		       }
    	   });
    	   
    	   
   	      $("#upSort").click(function(){
   	      		var sortId=$("#sortId").val().trim();
   	        	var parentId=$("#parentId").val().trim();
    	   		var sortName=$("#sortName").val().trim();
    	   		var description=$("#description").val().trim();
    	   		var data={sortId:sortId,parentId:parentId,sortName:sortName,description:description};
    	   		if(sortName==""){
    	   		    layer.msg("类别名称不能为空",{icon: 2});
    	   		}else{
    	   		 $.ajax({
		          url:"admins/updateSort.do",
		          type:"post",
		          dataType:"json",
		          data:data,
		          success:function(result){
					layer.alert(result.msg);
		            loadSort();
		            loadInput();
		          },
		          error:function(){
		              layer.alert("发生异常，请重试！",{icon: 2});
		            }
		      	 }); 
		       }
   	      });
    	      
    	      
    	    $("#delSort").click(function(){
    	   		if($("#sortId").val()!=""){
    	   		  var sortId=$("#sortId").val().trim();
    	   		  var parentId=$("#parentId").val().trim();
    	   		   $.ajax({
		          url:"admins/delSort.do",
		          type:"post",
		          dataType:"json",
		          data:{sortId:sortId,parentId:parentId},
		          success:function(result){
					layer.alert(result.msg);
		            loadSort();
		            loadInput();
		          },
		          error:function(){
		               layer.alert("发生异常，请重试！");
		            }
		      	 }); 
    	      }else{
    	      	 layer.alert("请选择一个类别");
    	      }
    	   });    
</script>
</html>
