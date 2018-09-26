<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" >
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>

<title>baobaodz的主页</title>
<script type="text/javascript">
	$(function(){
      	
		var urlParam = window.location.search;//获取url参数
		if(urlParam==null||urlParam==""){
			$(".breadcrumb").find("li").eq(3).remove();
			
		}else if(urlParam.indexOf("ym")!=-1){//包含年-月
			var ym = urlParam.substring(4);
			var data = JSON.stringify({"date":ym});
			$(".breadcrumb").find("li").eq(2).html("<a href='archives.jsp?y="+ym.substr(0,4)+"'>"+ym.substr(0,4)+"</a>");
			$(".breadcrumb").find("li").eq(3).html("<a href='#'>"+ym.substr(5)+"</a>");
			$(".btn-archivesyear").empty();//清空年份按钮节点
		}else{//只有年份
			var year = urlParam.substring(3);
			var data = JSON.stringify({"date":year});
			$(".breadcrumb").find("li").eq(2).html("<a href='archives.jsp?y="+year+"'>"+year+"</a>");
			$(".btn-archivesyear").empty();
		}
		
		$(".slide").empty();//清空轮播图div下所有节点
		getArchivesByDate(data);
		
		//根据条件获取文章列表
		function getArchivesByDate(data){
			$.ajax({
				url : "<%=request.getContextPath()%>/queryArchives",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:data,
     			success:function(data){
     			
     		   		$(".panel-group").empty();
     		   		if(data[0].VIEWCOUNT==null){//年和月份
     		   			$("#cmonth").collapse("show");
     		   			for(var i=0;i<data.length;i++){
     		   				var datetime = new Date(data[i].PTIME).toLocaleDateString().substr(7);
     		   				$("#cmonth .panel-body").append("<p><span>"+datetime+"日</span>&nbsp;<a href='details.jsp?aid="+data[i].AID+"'>"+data[i].TITLE+"</a><span>&nbsp;</span></p>");
     		   			}
     		   		}else{//年
     		   			for(var i=0;i<data.length-1;i++){
     		   				if(data[i+1].YM!=data[i].YM){
     		   					$(".panel-group").append("<div class='panel panel-default'>"+
     		   						"<div class='panel-heading'>"+
     		   							"<h4 class='panel-title t"+data[i].YM+"'>"+
     		   								"<a data-toggle='collapse' data-parent='#accordion' data-target='#c"+data[i].YM+"'><i class='fa fa-angle-double-down'></i> "+data[i].YM+"</a>"+
     		   							"</h4>"+
            						"</div>"+
       					 			"<div id='c"+data[i].YM+"' class='panel-collapse collapse in "+i+"'>"+
       					 				"<div class='panel-body'></div>"+
    								"</div>");
    							$(".t"+data[i].YM).append("<span>"+data[i].COUNT+" items</span>");//显示每个月多少篇
    							$("#c"+data[i].YM).collapse("hide");
    							for(var j=data[i].RN-1;j>data[i].RN-1-data[i].COUNT;j--){
    								var datetime = new Date(data[j].PTIME).toLocaleDateString().substr(5);
    								$(".panel-group #c"+data[i].YM+" .panel-body").append("<p><span>"+datetime+"</span><span><a href='details.jsp?aid="+data[j].AID+"'>"+data[j].TITLE+"</a></span><span>阅读&nbsp;("+data[j].VIEWCOUNT+")</span></p>");
    							}
     		   				
     		   				}
     		   			}
     		   			//追加最后一个月
     		   			$(".panel-group").append("<div class='panel panel-default'>"+
     		   					"<div class='panel-heading'>"+
     		   						"<h4 class='panel-title t"+data[i].YM+"'>"+
     		   							"<a data-toggle='collapse' data-parent='#accordion' data-target='#c"+data[data.length-1].YM+"'><i class='fa fa-angle-double-down'></i> "+data[data.length-1].YM+"</a>"+
     		   						"</h4>"+
            					"</div>"+
       					 		"<div id='c"+data[data.length-1].YM+"' class='panel-collapse collapse in "+i+"'>"+
       					 			"<div class='panel-body'></div>"+
    							"</div>");
    					$(".t"+data[i].YM).append("<span>"+data[i].COUNT+" items</span>");
    					$("#c"+data[data.length-1].YM).collapse("hide");
     		   			for(var j=data[data.length-1].RN-1;j>data[data.length-1].RN-1-data[data.length-1].COUNT;j--){
     		   				var datetime = new Date(data[j].PTIME).toLocaleDateString().substr(5);
    						$(".panel-group #c"+data[data.length-1].YM+" .panel-body").append("<p><span>"+datetime+"</span><a href='details.jsp?aid="+data[j].AID+"'>"+data[j].TITLE+"</a><span>阅读&nbsp;("+data[j].VIEWCOUNT+")</span></p>");
    					}
     		   		}
				}
			}); 
		}
		
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
					$(".breadcrumb").find("li").eq(1).html("<a href='index.jsp?cid="+cid+"&page=1'>"+cat+"</a>");
				}
			}
						
		}
		loadMostViewCount();//加载右侧最多浏览
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
		//日历插件左右按钮
		$(".datepicker").datepicker({
    		prevText: '<i class="fa fa-fw fa-angle-left"></i>',
    		nextText: '<i class="fa fa-fw fa-angle-right"></i>'
 		});
 		//年份按钮点击事件
 		$(".archivesyear").click(function(){
 			var y = $(this).text();
 			var data = JSON.stringify({"date":y});
 			$(".breadcrumb").find("li").eq(2).html("<a href='archives.jsp?y="+y+"'>"+y+"</a>");
 			getArchivesByDate(data);
 			
 		})
 		
	});
	
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
						<!--搜素框焦点事件 -->
						<script type="text/javascript">
							$(function(){
								$(".search-input").focus(function(){
									$(this).width(150);//避免第一次没有效果
									$(this).width(200);
								})
								$(".search-input").blur(function(){
									$(this).width(150);
								})
							})
						</script>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Link</a></li>
						</ul>
					</div>
				
				</nav>
			</div>
		</div>
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="index.jsp"><i class="fas fa-file-signature"></i> 文章 </a></li>
    					<li><a href="archives.jsp">归档</a></li>
    					<li></li>
    					<li></li>
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
						<div class="item active" style="width: 300px; height: 300px;">
							<img alt="" src="v3/default.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id</p>
							</div>
						</div>
						<div class="item" style="width: 300px; height: 300px;">
							<img alt="" src="v3/default1.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, ege
							</div>
						</div>
						<div class="item" style="width: 300px; height: 300px;">
							<img alt="" src="v3/default2.jpg" />
							<div class="carousel-caption">
							<h4>Third Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. D</p>
							</div>
						</div>
						</div> <a class="left carousel-control" href="#carousel-356013" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-356013" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			<!--归档列表 -->
			<div class="con" style="margin-top:10px;">
				<div class="btn-archivesyear">
					<button class="btn btn-default archivesyear"><a>2018</a></button>
					<button class="btn btn-default archivesyear"><a>2017</a></button>
				</div>
            	<hr>
				<div class="panel-group" id="accordion">
					
				</div>
				<div id="cmonth" class="panel-collapse collapse in">
            		<div class="panel-body" style="background-color:white;"></div>
                </div>
			</div>
			<!--bootstrap分页 -->
			<div class="confoot" style="width:100%; text-align:center;">
				<ul class="pagination pagination-lg">
					<!--js追加底部分页条 -->
				</ul>
			</div>
		</div>
		<div class="col-md-3 column myblogright" style="padding:10px 0px;">
		
			<div class="panel panel-info">
				<div class="panel-heading">
					<h5 class="panel-title"><i class="fa fa-align-justify "></i> 关于本站</h5>
					
				</div>
				<div class="panel-body myblogmotto">
					<dl style="width:35%;">
						<dt><img alt="头像" src="https://avatar.csdn.net/0/C/F/3_c_kite.jpg" class="img-circle"></dt>
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
 
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-align-justify"></i> 最多浏览</h3>
				</div>
				<div class="panel-body mymostview">
					<ul style="padding-left:0px;"></ul>
				</div>
				
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fas fa-align-justify"></i> 文章归档</h3>
				</div>
				<div class="panel-body myarchives">
					<ul style="padding-left:0px;"></ul>
				</div>
				
			</div>
			<div class="panel panel-info">
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
					<span class="result"></span>
				</div>
		

			</div>
		</div>
	</body>
</html>
