<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/resource.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/timecount.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>



<title>baobaodz的主页</title>
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
      	
      	loadSiteInfo();//加载站点信息
      	loadMostViewCount();//加载右侧最多浏览
		loadArchives();//加载文章归档
		$(".myblogright").addClass("visible-md-8 hidden-xs");
		//加载站点信息
		function loadSiteInfo(){
			$.ajax({
				url : "<%=request.getContextPath()%>/querySiteInfo",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     				$(".mybloginfo").find("dd").eq(0).text(data.ARTICLENUM);
     				$(".mybloginfo").find("dd").eq(1).text(data.LIKENUM);
     				$(".mybloginfo").find("dd").eq(2).text(data.VIEWNUM);
     				$(".mybloginfo").find("dd").eq(3).text(data.MESSNUM);
				}
			})
		
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
					return cat;
				}
			}
						
		}
		
	
		var urlParam = window.location.search;//获取url参数?cid=2&page=6
		if (urlParam == null || urlParam == "") {
			
			var pageNumber = 1;
			
			$(".myblogright").css("padding-top","10px");
		} else if (urlParam.indexOf("page") != -1) {
			
			pageNumber = urlParam.substr(6, 2);
			getCategoryName(cid);//获取分类名
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
		TimeDown("show-time", "2018-11-14 00:00:00");//调用计时
		$("#show-count").text("本站累计访问次数："+sessionStorage.getItem("rank")+"次");
	
	})
	
</script>

</head>

<body>
	<div class="container">
		<jsp:include page="common/header.jsp"></jsp:include>
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="<%=request.getContextPath()%>"><i class="fas fa-file-signature"></i>baobaodz </a></li>
    					<li><a href="#">资源分享</a></li>
				</ol>
			</div>
		</div>
		<div class="row clearfix">
			
			<div class="col-md-9 column myblogleft">
				
			<!--资源列表 -->
			<div class="reslist">
				<ul id="resTab" class="nav nav-tabs">
					<li class="active">
						<a href="#book" data-toggle="tab">技术书籍</a>
					</li>
					<li>
						<a href="#video" data-toggle="tab">技术视频</a>
					</li>
					<li>
						<a href="#tool" data-toggle="tab">技术工具</a>
					</li>
					<li><a href="#website" data-toggle="tab">效率网站</a></li>
	
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="book">
						<p>链接: https://pan.baidu.com/s/1WdFqj9_RsMMcfypof1gKaw <br>提取码: 9ctv </p>
						<p>链接: https://pan.baidu.com/s/1SKbJs_JbxyF_mgzZIu_j_Q <br>提取码: c3uy</p>
					</div>
					<div class="tab-pane fade" id="video">
						<p>链接: https://pan.baidu.com/s/1B9sI6KoyePWDpXMx5kL-HA <br>提取码: px2e </p>
					</div>
					<div class="tab-pane fade" id="tool">
						<p>链接: https://pan.baidu.com/s/1KJUDDpA7ZrOrDKsTne3Ohw <br>提取码: bnpr </p>
					</div>
					<div class="tab-pane fade" id="website">
						<ul>
							<li><a href="https://www.pexels.com/" target="blank">Free stock photos · Pexels</a></li>

							<li><a href="https://unsplash.com/" target="blank">Beautiful Free Images | Unsplash</a></li>
							<li><a href="http://search.chongbuluo.com/" target="blank">快搜 - 搜索快人一步 - Google</a></li>
							<li><a href="http://www.1234866.com/" target="blank">百度文库下载器免费下载文档下载卷文库会员vip</a></li>
							<li><a href="http://www.yyets.com/" target="blank">YYeTs人人影视 |YYeTs.com |人人影视字幕组</a></li>
							<li><a href="https://www.panc.cc/" target="blank">Panc.cc-胖次网盘搜索 - 胖次分享社区 - 我们热爱分享</a></li>
							<li><a href="https://tool.lu/" target="blank">在线工具 - 程序员的工具箱</a></li>
						
						</ul>
					</div>
	
				</div>
			</div>
			<div class="appreciation">
				
				<div><button class="btn btn-info btn-appreciation">￥赞赏</button></div>
			
			</div>
			
		</div>
		<jsp:include page="common/broadside.jsp"></jsp:include>
	</div>
			
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</body>
</html>
