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

</head>
<body>
 <p id="p1"></p><br>
    <p id="p2"></p><br>
    
    <!-- 点击进入index2界面，即HTML前端展示界面 -->
	文章题目：<input type="text" name="title" value="">
	<button id="btn">按钮</button><br>
     
	<div id="test-editormd">
   		<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
  		<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
  		<textarea class="editormd-html-textarea" name="bloghtml" ></textarea>
	</div>
</body>
</html>
