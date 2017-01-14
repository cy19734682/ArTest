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
 	<title>Ar资源- AR后台管理系统</title>
  <meta name="description" content="资源列表">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">资源管理</strong> / <small>Ar资源列表</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
            <!--   <button type="button" id="shenhe" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button> -->
              <button type="button" id="delete" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
        <div class="am-form-group">
            <select data-am-selected="{btnSize: 'sm'}" class="sortselete">
            </select>
          </div> 
        </div>
         <div class="am-u-sm-12 am-u-md-3">
       		<div class="am-form-group">
            <select data-am-selected="{btnSize: 'sm'}" class="recommendselete">
                  <c:choose>
                  	 <c:when test="${bkResult.data.filterResult.recommend==0}">
		            	 <option value="">全部</option>
		            	 <option value="0" selected>已推荐</option>
		            	 <option value="1">未推荐</option>
	            	 </c:when>
	            	 <c:when test="${bkResult.data.filterResult.recommend==1}">
		            	 <option value="">全部</option>
		            	 <option value="0">已推荐</option>
		            	 <option value="1" selected>未推荐</option>
	            	 </c:when>
	            	 <c:otherwise>
	            	 	 <option value="" selected>全部</option>
		            	 <option value="0">已推荐</option>
		            	 <option value="1">未推荐</option>
	            	 </c:otherwise>
	              </c:choose>	 
            </select>
          </div> 
        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <form  action="admins/listAr" method="get">
	          <div class="am-input-group am-input-group-sm">
	            <input type="hidden" name="state" value="0">
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
			         <th>审核时间</th>
			         <th>推荐</th>
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
							<td>${l.checkTime}</td>
							<td>
								<c:choose>
					       			<c:when test="${l.recommend=='0'}">
				   						<span class="label label-sm label-inverse arrowed-in">推荐</span>
					       			</c:when>
					       			<c:otherwise>
				   					     <span class="label label-sm label-success">未推荐</span>
					       			</c:otherwise>
					       		</c:choose>
							</td>
							<td>
								<c:choose>
								<c:when test="${l.recommend==0}">
									<a href="javascript:;">
				   						 <button type="button" onclick="setRecommend(1,'${l.arId}');"
				   						 title="设为推荐" class="am-btn am-btn-warning am-btn-xs am-text-secondary">取消推荐</button>
				   					</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;">
				   						<button type="button" onclick="setRecommend(0,'${l.arId}');"
				   						 title="设为推荐" class="am-btn am-btn-primary am-btn-xs am-text-secondary">设为推荐</button>
				   					</a>
								</c:otherwise>
							</c:choose>
			   					<a href="admins/getByIdAr?arId=${l.arId}">
			                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary">
			                      	<span class="am-icon-pencil-square-o"></span> 编辑</button>
			                     </a>
			   					<a href="javascript:;" onclick="deleuser(${l.arId});">
			   						<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
		                      			<span class="am-icon-trash-o"></span> 删除</button>
			   					</a>
		   					</td>
						</tr>
					</c:forEach>
				</c:if>
              </tbody>
            </table>
            <div class="am-cf">
                                    共 ${bkResult.data.pageLists.arsize}条记录
              <div class="am-fr">
                 <div data-am-page="{pages:${bkResult.data.pageLists.pageCount},curr:${bkResult.data.pageLists.currentPage},
                 		jump:'admins/listAr?keyword=${bkResult.data.filterResult.keyword}&sortId=${bkResult.data.filterResult.sortId}&recommend=${bkResult.data.filterResult.recommend}&pagenow=%page%&state=0'}">
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
	
	 loadSort('${bkResult.data.filterResult.sortId}');	
	 function loadSort(sortIdrest){
			$.ajax({
		    url:"admins/listSort",
		    type:"post",
		    data:"",
		    async: false,
		    dataType:"json",
		    success:function(result){
		    	if(result.data!=null){
		    		 var sdata,sortId,sortName;
					sdata=result.data;
					var s_li=" ";
					    s_li+="<option value=''>全部</option>";
		        	for(var i=0;i<sdata.length;i++){
		        		sortId=sdata[i].sortId;
		        		sortName=sdata[i].sortName;
	        	 		if(sortId==sortIdrest){
	        	 			s_li+="<option value=\""+sortId+"\" selected>"+sortName+"</option>";
	        	 		}else{
	        	 			s_li+="<option value=\""+sortId+"\">"+sortName+"</option>";
	        	 		}
		        	}
		        	$(".sortselete").append(s_li);
		      }else{
		      	 alert("查询失败！！");
		      }
			}
		}); 
		}
       	$(document).on("change",".sortselete", function (e) {
		         window.location.href = "admins/listAr?keyword="+'${bkResult.data.filterResult.keyword}'+
			       "&sortId="+$(this).val()+
			       "&recommend="+'${bkResult.data.filterResult.recommend}'+
			       "&state=0";
		        e.stopPropagation();
    	 });     
		
		$(document).on("change",".recommendselete", function (e) {
	         window.location.href = "admins/listAr?keyword="+'${bkResult.data.filterResult.keyword}'+"&recommend="+$(this).val()+
	         "&sortId="+'${bkResult.data.filterResult.sortId}'+"&state=0";
	        e.stopPropagation();
   		 });
		
		function setRecommend(recommend,arId){
  			   $.ajax({
	          url:"admins/updateArRecommend",
	          type:"post",
	          data:{"recommend":recommend,"arId":arId},
	          dataType:"json",
	          success:function(result){
	         		  if(result.status==0){
					  layer.alert(result.msg, {
						  closeBtn: 0
						}, function(){
						   window.location.href = "admins/listAr?state=0";
						});
					}
				}
			});  
  		}
		
		function deleuser(arId){
		layer.confirm('你确定要删除吗？', {
		  btn: ['确认','取消'] //按钮
		}, function(){
		  $.ajax({
		        url: "admins/updateArState",
		        dataType: "json",
		        type: "post",
		        data:{"arIds":arId,"state":2,"type":2} ,
		        success: function (data) {
		           if(data.status==0){
		             layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
						  window.location.href = "admins/listAr?state=0";
						});
		           }else{
		              layer.alert(data.msg);
		           }
		        }
		    }) 
		});
		}	
	
		$("#delete").click(function() {
            		layer.confirm('你确定要删除吗？', {
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
                    "arIds":ids,"state":2,"type":2
                },function(data, status) {
                    if(data.status==0){
						  layer.alert(data.msg, {
							  closeBtn: 0
							}, function(){
							  window.location.href ="admins/listAr?state=0";
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
