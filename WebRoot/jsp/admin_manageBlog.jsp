<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>后台|管理文章列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" >
<link rel="stylesheet" href="../css/admin_manageBlog.css">
<script src="../js/jquery.min.js"></script>
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>



<script type="text/javascript">
	$(function(){
	
		// 刚进来获取文章动态加载列表
		$.ajax({
			url: "<%=request.getContextPath()%>/queryAllArticle",
     		type: "post",
     		dataType : "json",
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({
     			"pageNumber": 0
     		}),
     		success:function(data){
     			
     			 for(var i =0; i<data.length; i++){
     			    data[i].draft==0?action = "已发布":action = "待发布";
     			    var ptime = new Date(data[i].ptime).toLocaleString();
			     	$(".articlelist").append("<tr><td>" + data[i].aid+"</td><td>"+
			     			  data[i].title+"</td><td>"+
			     			  data[i].category_id+"</td><td>"+
			     			  ptime+"</td><td>"+
			     			  data[i].draft+
			     			  "</td><td><button type='button' class='btn btn-primary modify'>修改</button>"+
			     			  "</td><td><button type='button' class='btn btn-danger delete'>删除</button>"+
			     			  	"</td><td><button type='button' class='btn btn-info publish'>"+action+"</button></td>");
				 }
				 clickModifyButton();
				 clickDeleteButton();
				 clickPublishButton();
				 
     		}
			
		});
		//点击修改按钮时传入id并返回一个article对象
		function clickModifyButton(){
		
			$(".modify").click(function(){ 
			
				//获取点击当前按钮所在行的第一列值，即文章编号
				//var aid = $(this).parent().parent().children("td:first-Child").text();
				//var aid = $(this).parents().children("td").eq(0).text();
				var aid = $(this).parent().parent().find("td:first-Child").text();
				alert(aid);
				window.location.href = "admin_writeBlog.jsp?aid="+aid;
			 });
		}
		function clickDeleteButton(){
		
			$(".delete").click(function(){ 
			
				if(confirm("确认删除吗？")){
					//获取点击当前按钮所在行的第一列值，即文章编号
					var aid = $(this).parent().parent().find("td:first-Child").text();
					$.ajax({
						url: "<%=request.getContextPath()%>/deleteSpecificArticle",
     					type: "post",
     					dataType : "json",
     					contentType: "application/json;charset=utf-8",
     					data:JSON.stringify({
     						"aid": aid
     					}),
     					success:function(data){
     						alert("删除成功！");
							window.location.reload();
						}
					});
				}else{
					return false;
				}
				
			 });
		
		 }
		  //一键发布或者取消发布
		  function clickPublishButton(){
		  
		  	$(".publish").click(function(){ 
		  	
		  		var draft = $(this).parent().parent().find("td").eq(4).text();
		  		var aid = $(this).parent().parent().find("td").eq(0).text();
		  		draft==0?operation="取消发布":operation="发布";
		  		if(confirm("确定"+operation+"吗?")){
		  			
		  			$.ajax({
						url: "<%=request.getContextPath()%>/publishOrAbolish",
     					type: "post",
     					dataType : "json",
     					contentType: "application/json;charset=utf-8",
     					data:JSON.stringify({
     						"aid": aid,
     						"draft": draft
     					}),
     					success:function(data){
     						alert(operation+"成功！");
							window.location.href = "admin_manageBlog.jsp";
						}
					});
		  	
		  		}else{
		  			return false;
		  		}
		  	
		  	});
		  
		  }
	});

</script>
</head>
<body>
	<table class="table articlelist" style="width: 85%; margin: 0 auto;">
		<tr class="active">
			<th>编号</th>
			<th>文章名</th>
			<th>分类</th>
			<th>创建时间</th>
			<th>状态</th>
			<th colspan="3">编辑</th>
		</tr>
		
	</table>
	
</body>
</html>