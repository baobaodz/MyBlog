<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>后台|管理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" >
<link rel="stylesheet"  href="../css/admin_manager.css">
<script type="text/javascript" src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="overflow:scroll;">
<h2 class='page-header'>hello:${sessionScope.admin.aname }</h2>
<div id="body" style="width:100%;height: 100%;">
		<div id="bodytop">
			<ul class="nav nav-pills ">
				<li><a href="<%=request.getContextPath()%>/jsp/admin_writeBlog.jsp" target="show">新建文章</a></li>
				<li><a href="<%=request.getContextPath()%>/jsp/admin_manageBlog.jsp" target="show">编辑文章</a></li>
				<li><a href="<%=request.getContextPath()%>/jsp/admin_manageBlog.jsp" target="show">查看评论</a></li>
				<li><a href="<%=request.getContextPath()%>/jsp/admin_manageBlog.jsp" target="show">查看留言</a></li>
			</ul>
		</div>
		<div id="bodybottom">
		<iframe src="<%=request.getContextPath()%>/jsp/admin_manageBlog.jsp" name="show"> </iframe>
		
		</div>
</div>

</body>
</html>