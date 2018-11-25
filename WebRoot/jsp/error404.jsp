<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/error404.css">
<title>Insert title here</title>
</head>
<body>

	<div id="page-wrapper">    
		<div class="page-blank-wrap">
			<div class="site-error">
				<h1 class="headline"><img src="<%=request.getContextPath()%>/images/404.png" alt="404"></h1>
				<div class="error-content">
					<h4>海面雾气太大</h4><h4>受天气影响，该页无法正常显示</h4>
					<h5> 你可以 <a href="<%=request.getContextPath()%>">返回首页</a> 。</h5>
				</div>
				<img src="<%=request.getContextPath()%>/images/error-bg.png" style="padding:20px 0 120px;">
			</div>
		</div> 	   
	</div>

</body>
</html>