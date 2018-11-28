<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/broadside.js"></script>
<script type="text/javascript" src="../js/timecount.js"></script>
<script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 

<title>baobaodz｜归档</title>
<script type="text/javascript">
	$(function(){
      	
		var urlParam = window.location.search;//获取url参数
		var breadcrumb = $(".breadcrumb");
		if(urlParam==null||urlParam==""){
			breadcrumb.find("li").eq(3).remove();
			
		}else if(urlParam.indexOf("ym")!=-1){//包含年-月
			var ym = urlParam.substring(4);
			var data = JSON.stringify({"date":ym});
			breadcrumb.find("li").eq(2).html("<a href='archives.jsp?y="+ym.substr(0,4)+"'>"+ym.substr(0,4)+"</a>");
			breadcrumb.find("li").eq(3).html("<a href='#'>"+ym.substr(5)+"</a>");
			$(".btn-archivesyear").empty();//清空年份按钮节点
		}else{//只有年份
			var year = urlParam.substring(3);
			var data = JSON.stringify({"date":year});
			breadcrumb.find("li").eq(2).html("<a href='archives.jsp?y="+year+"'>"+year+"</a>");
			$(".btn-archivesyear").empty();
		}
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
     				var panelgroup = $(".panel-group");
     		   		panelgroup.empty();
     		   		if(data[0].VIEWCOUNT==null){//年和月份
     		   			$("#cmonth").collapse("show");
     		   			for(var i=0;i<data.length;i++){
     		   				var datetime = new Date(data[i].PTIME).toLocaleDateString().substr(7);
     		   				$("#cmonth .panel-body").append("<p><span>"+datetime+"日</span>&nbsp;<a href='details.jsp?aid="+data[i].AID+"'>"+data[i].TITLE+"</a><span>&nbsp;</span></p>");
     		   			}
     		   		}else{//年
     		   			for(var i=0;i<data.length-1;i++){
     		   				if(data[i+1].YM!=data[i].YM){
     		   					panelgroup.append("<div class='panel panel-default'>"+
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
     		   			panelgroup.append("<div class='panel panel-default'>"+
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
		
		loadSiteInfo();//加载站点信息
		loadArchives();
		loadMostViewCount();//加载右侧最多浏览
		TimeDown("show-time", "2018-11-14 00:00:00");//调用计时
		//日历插件左右按钮
		$(".datepicker").datepicker({
    		prevText: '<i class="fa fa-fw fa-angle-left"></i>',
    		nextText: '<i class="fa fa-fw fa-angle-right"></i>'
 		});
 		//年份按钮点击事件
 		$(".archivesyear").click(function(){
 			var y = $(this).text();
 			var data = JSON.stringify({"date":y});
 			breadcrumb.find("li").eq(2).html("<a href='archives.jsp?y="+y+"'>"+y+"</a>");
 			getArchivesByDate(data);
 			
 		})
 		
 		$("#show-count").text("本站累计访问次数："+sessionStorage.getItem("rank")+"次");
 		$(".datepicker,.aboutsite,.learnsite").addClass("visible-md-8 hidden-xs");
	});
	
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
    					<li><a href="<%=request.getContextPath()%>/"><i class="fas fa-file-signature"></i> 文章 </a></li>
    					<li><a href="archives.jsp">归档</a></li>
    					<li></li>
    					<li></li>
				</ol>
			</div>
		</div>
		<!--归档列表 -->
		<div class="row clearfix">
			<div class="col-md-9 column myblogleft">
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
				
			</div>
			<jsp:include page="common/broadside.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>
