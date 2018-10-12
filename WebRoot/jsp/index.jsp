<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" >
<link href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>


<title>baobaodz的主页</title>
<script type="text/javascript">
	$(function(){
		
		//本站第多少位访客只显示一次
      	localStorage.name = returnCitySN["cip"];//获取ip存进localStorage
      	$.ajax({
      		url:"<%=request.getContextPath()%>/verifyip",
      		type:"post",
      		dataType:"json",
      		contentType:"application/json;charset=utf-8",
      		data:JSON.stringify({
     			"visitorIP": localStorage.name,
     		}),
      		success:function(data){
      			var rank = data.rank;
      			if(rank!=0){
      				$.busyLoadFull("show", {//遮罩页面
      					background: "rgba(90, 184, 103, 36.729412)", 
      					image: "../images/loadingdeer.gif", 
      					maxSize: "50px",
      					animate: "slide",
      					text: "你是本站第 "+rank+" 个访客哇(ง •̀_•́)ง",
      					textPosition: "bottom",
      					fontSize: "1.4em"
      				});
      				$(".busy-load-container-item .busy-load-text").append("<br><br><center class='start'><button class='btn btn-info'>开启baobaodz的博客</button></center>")
					$(".start").click(function(){
						$.busyLoadFull("hide", { animate: "fade" });
					})
      			}
      		}
      	})
      	//通过枚举类型来定义，不需要从后台获取，缺点就是非动态
		function getCategoryName(cid){
			var blogCategoryID = {
				生活杂记:1,
				java:2,
				数据库:3,
				音乐随想:4,
				bug:5,
				宇宙奇想:6
			}
							
			for(var cat in blogCategoryID){
				if(cid==blogCategoryID[cat]){
					return cat;
				}
			}
						
		}
		
		var urlParam = window.location.search;//获取url参数?cid=2&page=6
		if (urlParam == null || urlParam == "") {
			var cid = 0;
			var pageNumber = 1;
			$(".mycatnav").remove();
			$(".myblogright").css("padding-top","0px");
		} else if (urlParam.indexOf("cid") != -1) {
			cid = urlParam.substr(5, 1);
			pageNumber = urlParam.substr(12, 2);
			$(".slide").empty();//清空轮播图div下所有节点
			getCategoryName(cid);//获取分类名
		} 
		
		
		//根据条件获取文章列表
		$.ajax({
			url : "<%=request.getContextPath()%>/queryAllArticle",
     		type: "post",
     		dataType : "json",
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({
     			"pageNumber": pageNumber,
     			"categoryID": cid
     		}),
     		success:function(data){
     		   
     		   for(var i=0;i<data.length;i++){
     		   	 var cat = getCategoryName(data[i].category_id);
     		   	 $(".articlelist").append("<li style='background-color: white;margin:10px 0px;padding:2px 15px 10px 15px'><h3><span><a href='index.jsp?cid="+data[i].category_id+"&page=1'>"+cat+"</a><i class='label-arrow'></i></span><a href='details.jsp?aid="+data[i].aid+"' class='toview'>"+data[i].title
     			 +"</a></h3><span class='glyphicon glyphicon-time'>&nbsp;</span><span>"+new Date(data[i].ptime).toLocaleString()
     			 +"</span><br/><p>简介："+data[i].summary
     			 +"</p><p style='height:1.3em;'><span style='display:inline-block;float:left;'><i class='fa fa-eye'></i>("+data[i].viewcount+")&nbsp;&nbsp;<i class='far fa-heart'></i>("+data[i].likecount+")</span><span style='display:inline-block;float:right;'><a class='btn' href='details.jsp?aid="+data[i].aid+"'>View details »</a></span></p></li>");
			   		
			   }
			   
			   loadPagination(pageNumber,cid);//加载底部分页
			   loadMostViewCount();//加载右侧最多浏览
			   loadArchives();//加载文章归档
			}
			
		}); 
		
		//加载底部分页，参数为当前页数及类别ID
		function loadPagination(pageNumber,cid){
			if(cid!=0){
				var cat = getCategoryName(cid);
				$(".breadcrumb").find("li").eq(1).html("<a href='index.jsp?cid="+cid+"&page=1'>"+cat+"</a>");
			}
			$.ajax({
				url: "<%=request.getContextPath()%>/queryAllArticle",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"pageNumber": 0,
     				"categoryID": cid
     			}),
     			success:function(data){
     			
     				var currentPage = pageNumber;
     				if(currentPage==1){
     					$(".pagination").append("<li><a>上一页</a></li>");
     				}else{
     					$(".slide").empty();//清空轮播图div下所有节点
     					$(".pagination").append("<li><a href='index.jsp?cid="+cid+"&page="+(--currentPage)+"'>上一页</a></li>");
     				}
     			
     				var pageCount = parseInt((data.length-1)/6)+1;//总页数
     		   		for(var i=1;i<=pageCount;i++){
     			 		$(".pagination").append("<li><a href='index.jsp?cid="+cid+"&page="+i+"'>"+i+"</a></li>");
			  		}
			  		
			  		if(pageNumber>=pageCount){
     					$(".pagination").append("<li><a>下一页</a></li>");
     					$(".pagination").find("li").eq(pageNumber).find("a").css("background-color","skyblue");
     				}else{
     					$(".pagination").append("<li><a href='index.jsp?cid="+cid+"&page="+(++pageNumber)+"'>下一页</a></li>");
     					$(".pagination").find("li").eq(pageNumber-1).find("a").css("background-color","skyblue");
     				}
				}
				
			});
			
		}
		//加载最多浏览
		function loadMostViewCount(){
			$.ajax({
				url: "<%=request.getContextPath()%>/orderByViewCount",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     				for(var i=0;i<data.length;i++){
     			 		$(".mymostview ul").append("<li style='margin: 4px 0px;'><span>"+(i+1)+"</span><a href='details.jsp?aid="+data[i].aid+"'>"+data[i].title+"</a></li>");
			  		}
     			}
			});
		}
		//加载文章归档
		function loadArchives(){
			$.ajax({
				url: "<%=request.getContextPath()%>/queryArchivesGroupByMonth",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     				for(var i=0;i<data.length;i++){
     			 		$(".myarchives ul").append("<li><span><a href='archives.jsp?ym="+data[i].YM+"'>"+data[i].YM.substr(0,4)+"年"+data[i].YM.substr(5)+"月</a></span><span>"+data[i].COUNT+"篇</span></li>");
			  		}
     			}
			});
		}
		//日历插件左右按钮
		$(".datepicker").datepicker({
    		prevText: '<i class="fa fa-fw fa-angle-left"></i>',
    		nextText: '<i class="fa fa-fw fa-angle-right"></i>'
 		});
 		//搜素框焦点事件 
 		$(".search-input").focus(function(){
			$(this).width(150);//避免第一次没有效果
			$(this).width(200);
		})
		$(".search-input").blur(function(){
			$(this).width(150);
		})
	
	})
	
</script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column" style="width: 100%; height: 70px;">
				<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
					<div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.jsp">BAOBAODZ</a>
					</div>
				
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class=""><a href="index.jsp?cid=2&page=1"><i class="fab fa-java fa-1x"></i> Java</a></li>
							<li class=""><a href="index.jsp?cid=3&page=1"><i class="fa fa-database"></i> 数据库</a></li>
							<li class=""><a href="#"><i class="fa fa-desktop"></i> 计算机网络</a></li>
							<li class=""><a href="index.jsp?cid=5&page=1"><i class="fas fa-bug"></i> BUG</a></li>
							<li class=""><a href="#"><i class="fas fa-code-branch"></i> 数据结构</a></li>
							<li class=""><a href="index.jsp?cid=1&page=1"> 生活杂记</a></li>
							<li class="more">
								<a href="#"><i class="fas fa-caret-down"></i> 更多</a>
								<ul class="more-expand">
									<li><a href="index.jsp?cid=1&page=1">生活杂记</a></li>
									<li><a href="index.jsp?cid=4&page=1">音乐随想</a></li>
									<li><a href="index.jsp?cid=6&page=1">宇宙奇想</a></li>
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
							<li><a href="archives.jsp">归档</a></li>
							<li><a href="message.jsp">留言</a></li>
						</ul>
					</div>
				
				</nav>
			</div>
		</div>
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="index.jsp"><i class="fas fa-file-signature"></i>全部文章 </a></li>
    					<li><a href="#"></a></li>
				</ol>
			</div>
		</div>
		<div class="row clearfix">
			
			<div class="col-md-9 column myblogleft">
				<div class="carousel slide" id="carousel-356013">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-356013"></li>
						<li data-slide-to="1" data-target="#carousel-356013"></li>
						<li data-slide-to="2" data-target="#carousel-356013"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active" style="height:inherit;">
							<img alt="" src="../images/bridge-california-cliff-7653.jpg" style="display: block;height:350px;width:850px;"/>
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id</p>
							</div>
						</div>
						<div class="item" style="height:inherit;">
							<img alt="" src="../images/beautiful-cold-dawn-547115.jpg" style="display: block;height:350px;width:850px;"/>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, ege
							</div>
						</div>
						<div class="item" style="height:inherit;">
							<img alt="" src="../images/black-wallpaper-dark-full-moon-8438.jpg" style="display: block;height:350px;width:850px;"/>
							<div class="carousel-caption">
							<h4>Third Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. D</p>
							</div>
						</div>
						</div> <a class="left carousel-control" href="#carousel-356013" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-356013" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			<!--文章列表 -->
			<div class="con">
				<ul class="list-group articlelist"></ul>
			</div>
			<!--bootstrap分页 -->
			<div class="confoot" style="width:100%; text-align:center;">
				<ul class="pagination pagination-lg">
					<!--js追加底部分页条 -->
				</ul>
			</div>
		</div>
		<div class="col-md-3 column myblogright" style="padding:10px 0px;">
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title"><i class="fa fa-align-justify "></i> 关于本站</h5>
					
				</div>
				<div class="panel-body myblogmotto">
					<dl style="width:35%;">
						<dt><img alt="头像" src="../images/avatar.png" class="img-circle"></dt>
					</dl>
					<dl style="width:65%;">
						<dt><h3>baoabaodz</h3></dt>
						<dd><p>长路漫漫,只管前方</p></dd>
						<dd><p>赚钱养梦,唯心不死</p></dd>
					</dl>
				</div>
				<div class="panel-body mybloginfo">
					<dl>
        				<dt>文章</dt>
        				<dd>23</dd>
        			</dl>
        			<dl>
        				<dt>喜欢</dt>
        				<dd>21</dd>
        			</dl>
        			<dl>
        				<dt>留言</dt>
        				<dd>1</dd>
        			</dl>
        			<dl>
        				<dt>评论</dt>
        				<dd>12</dd>
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
					<h3 class="panel-title"><i class="fas fa-align-justify"></i> 最多浏览</h3>
				</div>
				<div class="panel-body mymostview">
					<ul style="padding-left:0px;"></ul>
				</div>
				
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-align-justify"></i> 文章归档</h3>
				</div>
				<div class="panel-body myarchives">
					<ul style="padding-left:0px;"></ul>
					<center><a href="archives.jsp">more</a></center>
				</div>
				
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-align-justify"></i> 联系我</h3>
				</div>
				<div class="panel-body">
					<ul style="padding-left:0px;"></ul>
				</div>
				
			</div>
		</div>
	</div>
			<div class="row clearfix">
				<div class="col-md-12 column" style="width:100%;height:70px;background-color:white; text-align:center;line-height:70px;">
					<p>Copyright © baobaodz博客 丨苏ICP备17002430号 丨 苏公网安备36042102000137</p>
				</div>
		

			</div>
		</div>
	</body>
</html>
