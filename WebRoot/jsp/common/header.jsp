<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row clearfix">
			<div class="col-md-12 column" style="width: 100%; height: 70px;">
				<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
					<div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 		<span class="sr-only"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 	</button> 
					 	<a class="navbar-brand" href="<%=request.getContextPath()%>/">BAOBAODZ</a>
					</div>
				
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="<%=request.getContextPath()%>/?cid=2&page=1"><i class="fab fa-java fa-1x"></i> Java</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=3&page=1"><i class="fa fa-database"></i> 数据库</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=8&page=1"><i class="fa fa-desktop"></i> 计算机网络</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=5&page=1"><i class="fab fa-js-square"></i> 前端</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=7&page=1"><i class="fas fa-code-branch"></i> 数据结构</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/jsp/resource.jsp"><i class="fas fa-cookie-bite"></i> 资源分享</a></li>
							<li class="more">
								<a href="#"><i class="fas fa-caret-down"></i> 更多</a>
								<ul class="more-expand">
									<li><a href="<%=request.getContextPath()%>/?cid=1&page=1">生活杂记</a></li>
									<li><a href="<%=request.getContextPath()%>/?cid=4&page=1">音乐随想</a></li>
									<li><a href="<%=request.getContextPath()%>/?cid=6&page=1">宇宙奇想</a></li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-left" role="search" style="width:180px;">
							<div class="form-group search">
								<input type="text" class="form-control search-input" placeholder=" 搜索" />
								<a class="search-btn" href="javascript:void(null)"><span class="glyphicon glyphicon-search"></span></a>
							</div> 
						
						</form>
						
						<ul class="nav navbar-nav navbar-right" style="margin-right:2px;">
							<li><a href="<%=request.getContextPath()%>/jsp/archives.jsp">归档</a></li>
							<li><a href="<%=request.getContextPath()%>/jsp/message.jsp">留言</a></li>
						</ul>
					</div>
				
				</nav>
			</div>
		</div>
</body>
</html>