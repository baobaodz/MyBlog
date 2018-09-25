<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台|登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap-3.3.7/css/bootstrap.css" >
<script src="./js/jquery-3.2.1.js"></script>
<script type="text/javascript"  src="./bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript"  src="./bootstrap-3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
	
		$(".btn").click(function(){
		var aname = $("input[type='text']").val();
		
		var apassword = $("input[type='password']").val();
		alert(aname);
		alert(apassword);
		$.ajax({
			url : "<%=request.getContextPath()%>/login",
     		type: "post",
     		dataType : "json",
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({
     			"aname":aname,
     			"apassword":apassword
     		}),
     		success:function(data){
     			
     			
     			window.location.href = "<%=request.getContextPath()%>/jsp/admin_manager.jsp";
     			
     			
     		}
		
		});
		
	})


	});


	

</script>
</head>
<body>
<!-- <form action="<%=request.getContextPath()%>/login" method="post"> -->
<!-- <span>${message}</span> -->
<!-- 账号<input type="text" name="aname" value=""/><br> -->
<!-- 密码<input type="password" name="apassword" value=""/><br> -->
<!-- <input type="submit"  value="提交"/> -->

<!-- </form> -->

	<form role="form" style="width:240px;">
		<div class="form-group">
			<label for="name">账户</label>
			<input type="text" class="form-control" name="aname" value="" placeholder="请输入"/><br />
			<label for="name">密码</label>
			<input type="password" class="form-control" name="apassword" value=""/>
			<button class="btn">登录</button>
		</div>

	</form>
</body>
</html>