function logout(){
		 $.ajax({
	          url:"user/logout",
	          type:"post",
	          dataType:"json",
	          data:"",
	          success:function(result){
	              if(result.status==0){
	               //$(".userinfo").html("<a href='login.jsp'>登录</a>&nbsp;&nbsp;<a href='register.jsp'>注册</a>");
	            	window.location.href="";  
	            }
	          },
	          error:function(){
	              alert("发生异常，请重试！");
	            }
	    });
   }