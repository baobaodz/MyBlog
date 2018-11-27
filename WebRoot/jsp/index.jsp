<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css" >
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/timecount.js"></script>

<title>baobaodz｜主页</title>
<script type="text/javascript">
	$(function(){
		
		//本站第多少位访客只显示一次
		var ip = returnCitySN["cip"];
		if(localStorage.ipname!=ip){
			$.ajax({
      			url:"<%=request.getContextPath()%>/verifyip",
      			type:"post",
      			dataType:"json",
      			contentType:"application/json;charset=utf-8",
      			data:JSON.stringify({
     				"visitorIP": ip,
     			}),
      			success:function(data){
      				localStorage.ipname = ip;//把ip地址出入本地
      				var rank = data.RN;
      				
      				sessionStorage.setItem("rank",rank);
      				
      				var visitorName = data.VNAME;
      				localStorage.visitorName = visitorName;//把访客名存入本地
      				$.cookie("vistorName",visitorName,{"path":"/"});
      			
      				if(data.ipIsExist=="false"){
      				
      					$.busyLoadFull("show", {//遮罩页面
      						background: "rgba(90, 184, 103, 36.729412)", 
      						image: "../images/loadingdeer.gif", 
      						maxSize: "50px",
      						animate: "slide",
      						text: "你是本站第 "+rank+" 个访客哇(ง •̀_•́)ง",
      						textPosition: "bottom",
      						fontSize: "1.4em"
      					});
      					$(".busy-load-container-item .busy-load-text").append("<br><br><center class='start'><button class='btn btn-info'>开启baobaodz的博客</button></center>");
						$(".start").click(function(){
							$.busyLoadFull("hide", { animate: "fade" });
						})
      				}
      				
      			}
      		})
		}
		$("#show-count").text("本站累计访问次数："+sessionStorage.getItem("rank")+"次");
      	//通过枚举类型来定义，不需要从后台获取，缺点就是非动态
		function getCategoryName(cid){
			var blogCategoryID = {
				生活杂记:1,
				java:2,
				数据库:3,
				音乐随想:4,
				bug:5,
				宇宙奇想:6,
				数据结构:7,
				计算机网络:8
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
     		   
     		   if(data.length==0){
     		   	  $(".articlelist").append("<div class='search-none'><img src='http://resource.baobaodz.com/image/search/search_none.svg'/></div>");
     		   }else{
     		      for(var i=0;i<data.length;i++){
     		   	  	var cat = getCategoryName(data[i].category_id);
     		   	 	$(".articlelist").append("<li>"+
     		   	 	"<div class='imgcontainer visible-md-8 hidden-xs'>"+
     		   	 		"<a href='http://resource.baobaodz.com/image/preview/articlepreview"+data[i].aid+".jpg' target='blank' title='下载原图'>"+
     		   	 			"<img src='http://resource.baobaodz.com/image/preview/articlepreview"+data[i].aid+".jpg'>"+
     		   	 		"</a>"+
     		   	 	"</div>"+
     		   	 	"<div class='infocontainer'>"+
     		   	 		"<h4>"+
     		   	 			"<span><a href='<%=request.getContextPath()%>/jsp/details.jsp?cid="+data[i].category_id+"&page=1'>"+cat+"</a><i class='label-arrow'></i></span>"+
     		   	 			"<a href='<%=request.getContextPath()%>/jsp/details.jsp?aid="+data[i].aid+"' class='toview'>"+data[i].title+"</a>"+
     		   	 		"</h4>"+
     			 		"<span><i class='fas fa-cloud-upload-alt'></i></span> <span>"+new Date(data[i].ptime).toLocaleString()+"</span><br/>"+
     			 		"<p class='summarycontainer'>简介："+data[i].summary+"</p>"+
     					"<div class='moreinfo visible-md-8 hidden-xs'>"+
     						"<span><i class='fa fa-eye'></i>("+data[i].viewcount+")&nbsp;&nbsp;<i class='far fa-heart'></i>("+data[i].likecount+")</span>"+
     						"<span><a class='btn' href='<%=request.getContextPath()%>/jsp/details.jsp?aid="+data[i].aid+"'>阅读更多»</a></span>"+
     					"</div>"+
     					
     				"</div>"+
     					"<div class='moblie-moreinfo hidden-md-8 visible-xs'>"+
     						"<span><a class='btn' href='<%=request.getContextPath()%>/jsp/details.jsp?aid="+data[i].aid+"'>阅读更多</a></span>"+
     					"</div>"+
     				"</li>");
			   		
			   		}
			   		loadPagination(pageNumber,cid);//加载底部分页
			   		
     		   	}
     		   	loadSiteInfo();//加载站点信息
			   	loadMostViewCount();//加载右侧最多浏览
			   	loadArchives();//加载文章归档

			}
			
		}); 
		
		//加载站点信息
		function loadSiteInfo(){
			$.ajax({
				url : "<%=request.getContextPath()%>/querySiteInfo",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     				var mybloginfo = $(".mybloginfo");
     				mybloginfo.find("dd").eq(0).text(data.ARTICLENUM);
     				mybloginfo.find("dd").eq(1).text(data.LIKENUM);
     				mybloginfo.find("dd").eq(2).text(data.VIEWNUM);
     				mybloginfo.find("dd").eq(3).text(data.MESSNUM);
				}
			})
		
		}
		
		//加载底部分页，参数为当前页数及类别ID
		function loadPagination(pageNumber,cid){
			if(cid!=0){
				var cat = getCategoryName(cid);
				$(".breadcrumb").find("li").eq(1).html("<a href='<%=request.getContextPath()%>/jsp/index.jsp?cid="+cid+"&page=1'>"+cat+"</a>");
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
     				var pagination = $(".pagination");
     				if(currentPage==1){
     					
     					pagination.append("<li><a>上一页</a></li>");
     					pagination.find("li").eq(0).css("display","none");
     				}else{
     					$(".slide").empty();//清空轮播图div下所有节点
     					pagination.append("<li><a href='<%=request.getContextPath()%>/jsp/index.jsp?cid="+cid+"&page="+(--currentPage)+"'>上一页</a></li>");
     				}
     			
     				var pageCount = parseInt((data.length-1)/6)+1;//总页数
     		   		for(var i=1;i<=pageCount;i++){
     			 		pagination.append("<li><a href='<%=request.getContextPath()%>/jsp/index.jsp?cid="+cid+"&page="+i+"'>"+i+"</a></li>");
			  		}
			  		
			  		if(pageNumber>=pageCount){
     					pagination.append("<li><a>下一页</a></li>");
     					pagination.find("li").eq(pageCount+1).css("display","none");
     					pagination.find("li").eq(pageNumber).find("a").css("background-color","#ffeb3b");
     				}else{
     					pagination.append("<li><a href='<%=request.getContextPath()%>/jsp/index.jsp?cid="+cid+"&page="+(++pageNumber)+"'>下一页</a></li>");
     					pagination.find("li").eq(pageNumber-1).find("a").css("background-color","#ffeb3b");
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
     			 		$(".mymostview ul").append("<li style='margin: 4px 0px;'><span>"+(i+1)+"</span><a href='<%=request.getContextPath()%>/jsp/details.jsp?aid="+data[i].aid+"'>"+data[i].title+"</a></li>");
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
     			 		$(".myarchives ul").append("<li><span><a href='<%=request.getContextPath()%>/jsp/archives.jsp?ym="+data[i].YM+"'>"+data[i].YM.substr(0,4)+"年"+data[i].YM.substr(5)+"月</a></span><span>"+data[i].COUNT+"篇</span></li>");
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
 		var search = $(".search-input");
 		search.focus(function(){
			$(this).width(150);//避免第一次没有效果
			$(this).width(200);
		})
		search.blur(function(){
			$(this).width(150);
		})
		TimeDown("show-time", "2018-11-14 00:00:00");
	})
	
</script>
</head>
<body>
	<div class="container">
		<!-- 头部菜单栏 -->
		<jsp:include page="common/header.jsp"></jsp:include>
		<!-- 面包屑导航 -->
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="<%=request.getContextPath()%>"><i class="fas fa-file-signature"></i>全部文章 </a></li>
    					<li><a href="#"></a></li>
				</ol>
			</div>
		</div>
		
		<div class="row clearfix">
			<div class="col-md-9 column myblogleft">
				<!-- 轮播图  -->
				<div class="carousel slide" id="carousel-356013">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel-356013"></li>
						<li data-slide-to="1" data-target="#carousel-356013"></li>
						<li data-slide-to="2" data-target="#carousel-356013"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active" style="height:inherit;">
							<a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=3">
								<img alt="" src="http://resource.baobaodz.com/image/slide/slide-bg1.jpg"/>
							</a>
							<div class="carousel-caption">
							</div>
							<div class="pre-titile" style="height:inherit;position:absolute;">
								<span><a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=3">Javaweb个人博客网站搭建（上）</a></span>
							</div>
						</div>
						<div class="item" style="height:inherit;">
							<a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=4">
								<img alt="" src="http://resource.baobaodz.com/image/slide/slide-bg2.jpg"/>
							</a>
							<div class="carousel-caption">
							</div>
							<div class="pre-titile" style="height:inherit;position:absolute;">
								<span><a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=4">Javaweb个人博客网站搭建（下）</a></span>
							</div>
						</div>
						<div class="item" style="height:inherit;">
							<a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=5">
								<img alt="" src="http://resource.baobaodz.com/image/slide/slide-bg3.jpg"/>
							</a>	
							<div class="carousel-caption">
							</div>
							<div class="pre-titile" style="height:inherit;position:absolute;">
								<span><a href="<%=request.getContextPath()%>/jsp/details.jsp?aid=5">javaweb项目部署</a></span>
							</div>
						</div>
						</div> <a class="left carousel-control" href="#carousel-356013" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-356013" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				<!--文章列表 -->
				<div class="con">
					<ul class="list-group articlelist"></ul>
				</div>
				<!--分页条 -->
				<div class="confoot" style="width:100%; text-align:center;">
					<ul class="pagination pagination-sm">
					
					</ul>
				</div>
			</div>
			<!-- 右侧  -->
			<jsp:include page="common/broadside.jsp"></jsp:include>
		</div>
			
	</div>
	<!-- 底部  -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
