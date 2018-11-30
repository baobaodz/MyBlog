<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="JAVA,LINUX,MYSQL,ORACLE,WEB,JavaScript,Spring,Javaweb个人博客,个人网站,IT网站,IT技术博客,技术分享,技术干货,系统架构,生活随笔,开发者,编程,代码,开源">
<meta name="description" content="本博客为Javaweb个人博客，专注java，数据库，计算机网络，JavaScript等学习总结与技术分享">
<meta name="author" content="BAOBAODZ">
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/resource.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/broadside.js"></script>
<script type="text/javascript" src="../js/timecount.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>



<title>baobaodz｜资源分享</title>
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
		TimeDown("show-time", "2018-11-14 00:00:00");//调用计时
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
		
		$("#show-count").text("本站累计访问次数："+sessionStorage.getItem("rank")+"次");
		$(".datepicker,.aboutsite,.learnsite").addClass("visible-md-8 hidden-xs");
	})
	
</script>

</head>

<body>
	<div class="container">
		<jsp:include page="common/header.jsp"></jsp:include>
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="<%=request.getContextPath()%>/"><i class="fas fa-file-signature"></i>baobaodz </a></li>
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
			<div class="panel panel-default appreciation">
    			<div class="panel-body" >
    				<div class="appre-do">
    					<p>收集不易，给点鼓励</p>
        				<button class="btn btn-danger btn-appreciation">￥赞赏</button>
        				<div class="appre-QRcode">
        					<img src="http://resource.baobaodz.com/image/QRcode/zhifubao_QRcode.jpg">
        				</div>
    				</div>
    				
    			</div>
			</div>
				<!--畅言评论 -->
				<div class="article_review">
					<div id="SOHUCS" sid="resource" ></div> 
					<script type="text/javascript"> 
						(function(){ 
							
							var aid = window.location.search.substr(5,5);
							$("#SOHUCS").attr("sid",aid);
							var appid = "cytV2uHWj"; 
							var conf = "abb600240fcf5e4632996e05dca7ba71"; 
							var width = window.innerWidth || document.documentElement.clientWidth; 
							if (width < 960) { 
								
								window.document.write("<script id='changyan_mobile_js' charset='utf-8' type='text/javascript' src='http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=" + appid + "&conf=" + conf + "'><\/script>'"); 
							} else { 
								var loadJs=function(d,a){
									var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;
									var b=document.createElement("script");
									b.setAttribute("type","text/javascript");
									b.setAttribute("charset","UTF-8");
									b.setAttribute("src",d);
									if(typeof a==="function"){
										if(window.attachEvent){
											b.onreadystatechange=function(){
												var e=b.readyState;
												if(e==="loaded"||e==="complete"){
													b.onreadystatechange=null;a()
												}
											}
										}else{
											b.onload=a
										}
									}
									c.appendChild(b)};
									loadJs("http://changyan.sohu.com/upload/changyan.js",function(){
										window.changyan.api.config({appid:appid,conf:conf})
								}); 
							} 
						})(); 
				</script>
				</div>			
			
		</div>
		<jsp:include page="common/broadside.jsp"></jsp:include>
	</div>
			
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</body>
</html>
