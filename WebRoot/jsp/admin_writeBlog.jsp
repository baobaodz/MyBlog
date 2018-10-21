<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台|写文章</title>
<link rel="stylesheet" href="../editor.md-master/css/editormd.min.css"/>
<link rel="stylesheet" href="../editor.md-master/css/editormd.css"/>
<script src="../js/jquery.min.js"></script>
<script src="../js/editormd.min.js"></script>

<script src="../js/editormd.js"></script>
<script src="../editor.md-master/lib/marked.min.js"></script>
<script src="../editor.md-master/lib/flowchart.min.js"></script>
<script src="../editor.md-master/lib/jquery.flowchart.min.js"></script>
<script src="../editor.md-master/lib/prettify.min.js"></script>
<script src="../editor.md-master/lib/raphael.min.js"></script>
<script src="../editor.md-master/lib/sequence-diagram.min.js"></script>
<script src="../editor.md-master/lib/underscore.min.js"></script>
<!--bootstrap相关 css和js-->
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../bootstrap-3.3.7/css/bootstrap.css" >
<link rel="stylesheet"  href="../css/admin_manager.css">
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.js"></script>
<script type="text/javascript"  src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(function() {
	
		//调用编辑器
		var testEditor = editormd("test-editormd", {
			width : "1000px",
			height : 600,
			syncScrolling : "single",
			path : "../editor.md-master/lib/",
			//这个配置在simple.html中并没有，但是为了能够提交表单，
			//使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
            previewCodeHighlight : true,
            //previewTheme : "dark",
			emoji:true,
        	saveHTMLToTextarea : true
		});
		
		//刚进来获取分类动态加载下拉菜单
		$.ajax({
			url : "<%=request.getContextPath()%>/getAllCategory",
     		type: "post",
     		dataType : "json",
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({}),
     		success:function(data){
     			
     			$(".selectcat").append("<option>请选择分类</option>");
     			for(var i =0; i<data.length; i++){
			      $(".selectcat").append("<option value="+data[i].cid+">" + data[i].cname+ "</option>");
				}
     		}
		
		});
		
		 //当编辑状态下通过回调函数动态赋值
		 var aidParam = window.location.search;//?aid=
		 if(aidParam!=null&&aidParam!=""){
		 	var aid = aidParam.substr(5,5);
		 	$.ajax({
		 		url:"<%=request.getContextPath()%>/getSpecificArticle",
				type : "post",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"aid" : aid
				}),
				success : function(data) {

					$("input[type='text']").val(data.title);
					$(".selectcat").val(data.category_id);
					$(".summarytext").text(data.summary);
					$(".editormd-markdown-textarea").text(data.content);

				}

			});
		}
		
	});
</script>
</head>
<body>
    <br><br>
    <form role="form">
	<div class="form-group" style="width:700px; margin: 0 auto;">
		<label for="name">文章题目</label>
		<input type="text" class="form-control" id="title" name="title" placeholder="请输入题目">
		<label for="name">分类 </label><br>
		<select name="category" class="selectcat"></select><br>
		<label for="name">简介</label><br>
		<textarea class="form-control summarytext" rows="4" cols="70"></textarea>
	</div>
	</form>
  
	<ul class="list-group" id="selectToDo" style="position: absolute; left:12px;top:300px;">
		<li class="list-group-item"><button class="btn btn_DoSomething">保存为草稿</button></li>
		<li class="list-group-item"><button class="btn btn_DoSomething">保存并发布</button></li>
		<li class="list-group-item"><button class="btn btn_DoSomething">更新至草稿</button></li>
		<li class="list-group-item"><button class="btn btn_DoSomething">更新并发布</button></li>
	</ul>
	
    <script type="text/javascript">
	 //保存为草稿，或发布，或更新
     $(".btn_DoSomething").click(function() {
     	var aidParam = window.location.search;//?aid=
     	if(aidParam!=null&&aidParam!=""){
		 	var aid = aidParam.substr(5,5);
		}
     	var btnIndex = $(this).parent().index();
     	if(btnIndex==0){
     		var url = "<%=request.getContextPath()%>/saveToDraft";
     		var draft = 1;
     	}else if(btnIndex==1){
     		var url = "<%=request.getContextPath()%>/saveToDraft";
     		var draft = 0;
     	}else if(btnIndex==2){
     		var url = "<%=request.getContextPath()%>/saveToDraft?isUpdate=true";
     		var draft = 1;
     	}else{
     		var url = "<%=request.getContextPath()%>/saveToDraft?isUpdate=true";
     		var draft = 0;
     	}
     	
     	var operation = $(this).text();
     	
     	
        //获取第二个textarea的值，即生成的HTML代码   实际开发中此值存入后台数据库
        var contenthtml=$(".editormd-html-textarea").val();
        //获取第一个textarea的值，即md值  实际开发中此值存入后台数据库
        var content=$(".editormd-markdown-textarea").val();
        var summary = $(".summarytext").val();
        alert(summary);
	    var title = $("input[name='title']").val();
	    var category_id = $(".selectcat").val();
		alert(title);	
		$.ajax({
     		url: url,
     		type: "post",
     		dataType : "json", 
     		contentType: "application/json;charset=utf-8",
     		data:JSON.stringify({
     			"aid": aid==null?"":aid,
     			"title": title,
     			"content": content,
     			"summary": summary,
     			"category_id": category_id,
     			"draft": draft
     		}),
     		success:function(data){
     		
     			alert(operation+"成功!");
     			window.location.href = "admin_manageBlog.jsp";
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
