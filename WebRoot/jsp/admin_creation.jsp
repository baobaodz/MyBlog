<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>后台| 创作</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css">
    
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/admin/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-switch.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../editor.md-master/css/editormd.min.css"/>
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/admin/style.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/flat-blue.css">
    
    <!-- Javascript Libs -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/Chart.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/admin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/select2.full.min.js"></script>
    
	<script type="text/javascript" src="../js/editormd.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/marked.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/flowchart.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/jquery.flowchart.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/prettify.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/raphael.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/sequence-diagram.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/underscore.min.js"></script>
    

	<script type="text/javascript">

	$(function() {
	
		var aname = sessionStorage.getItem("name");
        var apassword = sessionStorage.getItem("password");
        if(aname==""||aname==null||apassword==""||apassword==null){
            window.location.href = "<%=request.getContextPath()%>/jsp/admin_login.jsp";
        }else{
            		
        	$.ajax({
				url : "<%=request.getContextPath()%>/login",
     			type: "post",
     			dataType : "json",
     			contentType: "application/json;charset=utf-8",
     			data:JSON.stringify({
     				"aname":aname,
     				"apassword":apassword
     			}),
     			error:function(data){
     				window.location.href = "<%=request.getContextPath()%>/jsp/admin_login.jsp";
     			}
		
			});
        }
        $(".admin-info,.profile-info h4").text(aname);
        
		//调用编辑器
		var testEditor = editormd("test-editormd", {
			width : "1200px",
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
	
   		$("#myModal").modal("hide");
		$(".save_summary").click(function(){
			var sum = $(".summarytext").val();
			$("#myModal").modal("hide");
	
		})
		
		//保存为草稿，或发布，或更新
     $(".btn_DoSomething").click(function() {
     	var aidParam = window.location.search;//?aid=
     	if(aidParam!=null&&aidParam!=""){
		 	var aid = aidParam.substr(5,5);
		}
     	var btnIndex = $(this).index();
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
     			window.location.href = "admin_main.jsp";
     		}
     	});
     });
   });

</script>
</head>

<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <ol class="breadcrumb navbar-breadcrumb">
                            <li>后台管理</li>
                            <li class="active">创作</li>
                        </ol>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">0</span>
                                </li>
                                <li class="message">
                                    No new notification
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown danger">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                            <ul class="dropdown-menu danger  animated fadeInDown">
                                <li class="title">
                                    Notification <span class="badge pull-right">4</span>
                                </li>
                                <li>
                                    <ul class="list-group notifications">
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item">
                                                <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                            </li>
                                        </a>
                                        <a href="#">
                                            <li class="list-group-item message">
                                                view all
                                            </li>
                                        </a>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle admin-info" data-toggle="dropdown" role="button" aria-expanded="false">Emily Hart <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="http://resource.baobaodz.com/image/avatar/admin_baobaodz.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username"></h4>
                                        <p>emily_hart@email.com</p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile</button>
                                            <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!--Side Menu  -->
            <jsp:include page="common/sidemenu.jsp"></jsp:include>
            <!-- Main Content --> 
            <div class="container-fluid css15ca7b11191e94b">
                <div class="side-body">
                    <div class="page-title" style="display:inline-block;float:left;">
                        <span class="title">创作</span>
                        <div class="description css15ca7b11191e94b" >经验，总结，学习，这里就是我的世界</div>
                        
                    </div>
                    <div class="article-operation">
                    	<div class="btn-group">
      						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      						保存 <span class="caret"></span></button>
      						<ul class="dropdown-menu" role="menu">
        						<li class="btn_DoSomething"><a href="">保存为草稿</a></li>
        						<li class="btn_DoSomething"><a href="">保存并发布</a></li>
        						<li class="btn_DoSomething"><a href="">更新到草稿</a></li>
        						<li class="btn_DoSomething"><a href="">更新并发布</a></li>
      						</ul>
    					</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title">
                                    	<form role="form">
											<div class="form-group" style="width:700px; margin: 0 auto;display:inline-block;">
												
												<input type="text" class="form-control" id="title" name="title" placeholder="请输入题目">
												
											</div>
											<div class="form-group" style="width:180px; margin: 0 auto;display:inline-block;font-size:.9em;">
												<select name="category" class="selectcat"></select>
												
											</div>
										</form>
										<!-- 按钮触发模态框 -->
										<button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加简介</button>
										

										<!-- 模态框（Modal） -->
										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">说点啥吧</h4>
					
			
													</div>
													<div class="modal-body">
														<textarea class="form-control summarytext" rows="4" cols="70"></textarea>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														<button type="button" class="btn btn-primary save_summary">保存</button>
													</div>
												</div><!-- /.modal-content -->
											</div><!-- /.modal-dialog -->
										</div><!-- /.modal -->
										
                                    </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div id="test-editormd">
   										<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
  										<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
  										<textarea class="editormd-html-textarea" name="bloghtml" ></textarea>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
            	
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> Â© 2015 Copyright.
            </div>
        </footer>
    <div>
    
</body>

</html>
