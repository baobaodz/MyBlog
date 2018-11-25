<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>后台|编辑文章</title>
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
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/admin/style.css">
    <link rel="stylesheet" type="text/css" href="../css/admin/flat-blue.css">
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
                            <li class="active">编辑</li>
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
                            <a href="#" class="dropdown-toggle admin-info" data-toggle="dropdown" role="button" aria-expanded="false"><span class="caret"></span></a>
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
            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">文章列表</span>
                        <div class="description">with jquery Datatable for display data with most usage functional. such as search, ajax loading, pagination, etc.</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card">
                                <div class="card-header">

                                    <div class="card-title">
                                    <div class="title">Table</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table class="datatable table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>AID</th>
                                                <th>文章</th>
                                                <th>分类</th>
                                                <th>创作时间</th>
                                                <th>状态</th>
                                                <th>管理</th>
                                                <th>管理</th>
                                                <th>管理</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody class="articlelist">
                                 
                                        </tbody>
                                    </table>
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
    </div>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/Chart.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="../js/admin/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../js/admin/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/select2.full.min.js"></script>
    <script type="text/javascript" src="../js/admin/ace.js"></script>
    <script type="text/javascript" src="../js/admin/mode-html.js"></script>
    <script type="text/javascript" src="../js/admin/theme-github.js"></script>

    <script type="text/javascript" src="../js/admin/app.js"></script>
    
    <script type="text/javascript">
	$(function(){
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
			     			  	"</td><td><button type='button' class='btn btn-info publish'>"+action+"</button></td></tr>");
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
				window.location.href = "<%=request.getContextPath()%>/jsp/admin_creation.jsp?aid="+aid;
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
							window.location.href = "<%=request.getContextPath()%>/jsp/admin_manage.jsp";
						}
					});
		  	
		  		}else{
		  			return false;
		  		}
		  	
		  	});
		  
		  }
	});

</script>
</body>

</html>
