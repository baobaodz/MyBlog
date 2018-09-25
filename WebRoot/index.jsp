<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台 | 写文章</title>
<link rel="stylesheet" href="./css/editormd.min.css"/>
<link rel="stylesheet" href="./css/editormd.css"/>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery-3.2.1.js"></script>
<script src="./js/editormd.min.js"></script>
<script src="./js/editormd.js"></script>
<script type="text/javascript">
	//调用编辑器
	$(function() {
		var testEditor = editormd("test-editormd", {
			width : "1000px",
			height : 600,
			syncScrolling : "single",
			path : "./lib/",
			//这个配置在simple.html中并没有，但是为了能够提交表单，
			//使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
			emoji:true,
        	saveHTMLToTextarea : true
		});
		
	});
</script>
</head>
<body>
 <p id="p1"></p><br>
    <p id="p2"></p><br>
    
    <!-- 点击进入index2界面，即HTML前端展示界面 -->
	文章题目：<input type="text" name="title" value="">
	<button id="btn">按钮</button><br>
     <script type="text/javascript">
    
     var title;
     var contenthtml;
     var contentmd;
     $("#btn").click(function() {
     	alert("1");
       //获取第二个textarea的值，即生成的HTML代码   实际开发中此值存入后台数据库
       contenthtml=$(".editormd-html-textarea").val();
       $("#p1").text(contenthtml);
       //获取第一个textarea的值，即md值  实际开发中此值存入后台数据库
        contentmd=$(".editormd-markdown-textarea").val();
       $("#p2").text(contentmd+" editormd");
		title = $("input[name='title']").val();
		alert(title);	
		$.ajax({
     
     		url: "<%=request.getContextPath()%>/addBlog",
     		type: "post",
     		dataType : "json",
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({
     		
     			"title":title,
     			"contenthtml": contenthtml
     		}),
     		error:function(XMLHttpRequest,textStatus,errorThrown){
     		 alert(errorThrown);  //not found
     		 alert(XMLHttpRequest.status);  //404
     		 alert(XMLHttpRequest.readyState);  //4
     		 alert(textStatus);  //error
     		 },
     		success:function(data){
     			alert(data);
     		}
     		 
         });
     });
     
     	
    
    
     </script>
	<div id="test-editormd">
   		<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
  		<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
  		<textarea class="editormd-html-textarea" name="bloghtml" ></textarea>
	</div>
</body>
</html>
