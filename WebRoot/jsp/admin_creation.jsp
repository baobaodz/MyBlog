<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>后台| 创作</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
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
	<link rel="stylesheet" type="text/css" href="../editor.md-master/css/editormd.css"/>
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/admin/style.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/flat-blue.css">
    
    <!-- Javascript Libs -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/Chart.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/admin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/select2.full.min.js"></script>
    <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
	<script type="text/javascript" src="../js/editormd.min.js"></script>
	<script type="text/javascript" src="../js/editormd.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/marked.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/flowchart.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/jquery.flowchart.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/prettify.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/raphael.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/sequence-diagram.min.js"></script>
	<script type="text/javascript" src="../editor.md-master/lib/underscore.min.js"></script>
    <!-- Javascript -->
    <script type="text/javascript" src="../js/app.js"></script>

	<script type="text/javascript">

	$(function() {
	
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emily Hart <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li class="profile-img">
                                    <img src="../../img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                                </li>
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username">Emily Hart</h4>
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
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">
                                <div class="icon fa fa-paper-plane"></div>
                                <div class="title">Flat Admin V.2</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="../index.html">
                                    <span class="icon fa fa-tachometer"></span><span class="title">Dashboard</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-desktop"></span><span class="title">UI Kits</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../ui-kits/grid.html">Grid</a></li>
                                            <li><a href="../ui-kits/theming.html">Theming</a></li>
                                            </li>
                                            <li><a href="../ui-kits/button.html">Buttons</a>
                                            </li>
                                            <li><a href="../ui-kits/card.html">Cards</a>
                                            </li>
                                            <li><a href="../ui-kits/list.html">Lists</a>
                                            </li>
                                            <li><a href="../ui-kits/modal.html">Modals</a>
                                            </li>
                                            <li><a href="../ui-kits/alert.html">Alerts & Toasts</a>
                                            </li>
                                            <li><a href="../ui-kits/panel.html">Panels</a>
                                            </li>
                                            <li><a href="../ui-kits/loader.html">Loaders</a>
                                            </li>
                                            <li><a href="../ui-kits/step.html">Tabs & Steps</a>
                                            </li>
                                            <li><a href="../ui-kits/other.html">Other</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="active panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-table">
                                    <span class="icon fa fa-table"></span><span class="title">Table</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-table" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../table/table.html">Table</a>
                                            </li>
                                            <li><a href="../table/datatable.html">Datatable</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-form">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">Form</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-form" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../form/ui-kits.html">Form UI Kits</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#component-example">
                                    <span class="icon fa fa-cubes"></span><span class="title">Components</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="component-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../components/pricing-table.html">Pricing Table</a>
                                            </li>
                                            <li><a href="../components/chartjs.html">Chart.JS</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-example">
                                    <span class="icon fa fa-slack"></span><span class="title">Page Example</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-example" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../pages/login.html">Login</a>
                                            </li>

                                            <li><a href="../pages/index.html">Landing Page</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <!-- Dropdown-->
                            <li class="panel panel-default dropdown">
                                <a data-toggle="collapse" href="#dropdown-icon">
                                    <span class="icon fa fa-archive"></span><span class="title">Icons</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-icon" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="../icons/glyphicons.html">Glyphicons</a>
                                            </li>
                                            <li><a href="../icons/font-awesome.html">Font Awesomes</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="../license.html">
                                    <span class="icon fa fa-thumbs-o-up"></span><span class="title">License</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
            <!-- Main Content -->
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">创作</span>
                        <div class="description">经验，总结，学习，这里就是我的世界</div>
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
											<textarea class="form-control summarytext" rows="4" cols="70"></textarea>
										</form>
										<!-- 按钮触发模态框 -->
										<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加简介</button>
										

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
														<button type="button" class="btn btn-primary">保存</button>
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
