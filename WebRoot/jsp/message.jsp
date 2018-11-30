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
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/message.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/broadside.js"></script>
<script type="text/javascript" src="../js/timecount.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<title>baobaodz｜留言</title>
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
      	queryMessage();
      	loadSiteInfo();//加载站点信息
      	loadMostViewCount();//加载右侧最多浏览
		loadArchives();//加载文章归档
		TimeDown("show-time", "2018-11-14 00:00:00");//调用计时

		$(".makemessage").click(function(){
			
			var message = $(".messageinfo").val();
			if(message==null||message==""){
				alert("留言不能为空！");
				return false;
			}else{
				
				$.ajax({
					url : "<%=request.getContextPath()%>/saveMessage",
     				type: "post",
     				dataType : "json",
     				contentType: "application/json;charset=utf-8",
     				data:JSON.stringify({
     					"message": message,
     					"visitorName":localStorage.visitorName
     				}),
     				success:function(data){
     		   			
     		   			queryMessage();//查询留言
			   
					}
			
				}); 
			
			}
		})
		//查询留言
		function queryMessage(){
			$.ajax({
				url : "<%=request.getContextPath()%>/queryMessage",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({}),
     			success:function(data){
     		   		
     		   		for(var i=0;i<data.length;i++){
     		   			
     		   			var rad = Math.floor((data[i].mname.substring(0,1).charCodeAt()+data[i].mname.substring(9).charCodeAt())/6);
     		   	 		$(".messagelist").append("<li>"+
     		   	 		"<div class='leftheadimage'>"+
     		   	 			"<img src='http://resource.baobaodz.com/image/avatar/default"+rad+".png'>"+
     		   	 		"</div>"+
     		   	 		"<div class='rightinfo'>"+
     		   	 			"<span class='rname'>"+data[i].mname+"</span>"+
     		   	 			"<span class='rdate'>"+new Date(data[i].mtime).toLocaleString()+"</span>"+
     			 			"<p>"+data[i].mess+"</p>"+
     			 		"</div></li>");
			   		
			   		}
			   
				}
			
			}); 
		
		}
		$(".myblogright").css("padding-top","10px");
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
	<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+ request.getServerPort() + request.getContextPath(); %>
	<div class="container">
		<jsp:include page="common/header.jsp"></jsp:include>
		<div class="row clearfix mycatnav">
			<div class="col-md-12 column" style="padding-right:0px;">
				<ol class="breadcrumb">
    					<li><a href="<%=request.getContextPath()%>/"><i class="fas fa-file-signature"></i>baobaodz </a></li>
    					<li><a href="#">留言</a></li>
				</ol>
			</div>
		</div>
		<div class="row clearfix">
			
			<div class="col-md-9 column myblogleft">
				<!--留言 -->
				<div class="messagecontainer">
					<form role="form">
  						<div class="form-group">
    						
    						<textarea class="form-control messageinfo" rows="4"></textarea>
  						</div>
  						<button class="btn btn-default makemessage">留言</button>
					</form>
					<br>
					<p>最近评论</p>
					<div class="messagelist">
					</div>
				</div>
			<!--文章列表 -->
			<div class="con">
				<ul class="list-group articlelist"></ul>
			</div>
			
		</div>
		<jsp:include page="common/broadside.jsp"></jsp:include>
	</div>
			
		</div>
		<jsp:include page="common/footer.jsp"></jsp:include>
	</body>
</html>
