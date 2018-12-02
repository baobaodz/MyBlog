<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-3 column myblogright" style="padding:10px 0px;">
		
			<div class="panel panel-default aboutsite">
				<div class="panel-heading">
					<h5 class="panel-title"><i class="fas fa-laptop-code" style="color:gray;"></i> 关于本站</h5>
					
				</div>
				<div class="panel-body myblogmotto">
					<dl style="width:35%;">
						<dt><img alt="avatar" src="<%=request.getContextPath()%>/images/avatar.png" class="img-circle"></dt>
					</dl>
					<dl style="width:65%;">
						<dt><h3><a href="<%=request.getContextPath()%>/jsp/admin_login.jsp" target="blank">baoabaodz</a></h3></dt>
						<dd><p>长路漫漫,只管前方</p></dd>
						<dd><p>赚钱养梦,唯心不死</p></dd>
					</dl>
				</div>
				<div class="panel-body mybloginfo">
					<dl>
        				<dt>文章</dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt>喜欢</dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt>浏览</dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt>留言</dt>
        				<dd></dd>
        			</dl>
        				
				</div>
				<div class="panel-body mybloginfo">
					<dl>
        				<dt><a href="https://github.com/baobaodz" target="blank" title="github"><i class="fab fa-github fa-2x"></i></a></dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt><a href="https://www.jianshu.com/u/ff2b133101d4" target="blank" title="简书"><i class="fab fa-envira fa-2x"></i></a></dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt><a href="https://www.jianshu.com/u/ff2b133101d4" target="blank" title="微信"><i class="fab fa-weixin fa-2x"></i></a></dt>
        				<dd></dd>
        			</dl>
        			<dl>
        				<dt><a href="https://www.jianshu.com/u/ff2b133101d4" target="blank" title="邮箱"><i class="fa fa-envelope fa-2x"></i></a></dt>
        				<dd></dd>
        			</dl>
        				
				</div>
			</div>
			<!--日历插件 -->
			<div class="datepicker">
  				<div class="datepicker-header"></div>
			</div>
 
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fab fa-hotjar" style="color:gray;"></i> 最多浏览</h3>
				</div>
				<div class="panel-body mymostview">
					<ul style="padding-left:0px;"></ul>
				</div>
				
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-archive" style="color:gray;"></i> 文章归档</h3>
				</div>
				<div class="panel-body myarchives">
					<ul style="padding-left:0px;"></ul>
					<center><a href="<%=request.getContextPath()%>/jsp/archives.jsp">more</a></center>
				</div>
				
			</div>
			<div class="panel panel-default learnsite">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-code" style="color:gray;"></i> 学习</h3>
				</div>
				<div class="panel-body">
					<ul style="padding-left:0px;">
						<li><a href="http://baobaodz.top" target="blank">baobaodz的hexo博客</a></li>
						<li><a href="https://www.liaoxuefeng.com/" target="blank">廖雪峰的官方网站</a></li>
						<li><a href="https://www.xttblog.com/" target="blank">业余草</a></li>
						<li><a href="https://www.hollischuang.com/" target="blank">Hollis</a></li>
						<li><a href="http://www.importnew.com/" target="blank">importnew</a></li>
						<li><a href="https://www.nmyswls.com/" target="blank">农码一生为了谁</a></li>
					</ul>
				</div>
				
			</div>
		</div>
</body>
</html>