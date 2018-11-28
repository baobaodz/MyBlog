<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>后台|登录</title>
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
<body class="flat-blue login-page">
	<div class="container">
        <div class="login-box">
            <div>
                <div class="login-form row">
                    <div class="col-sm-12 text-center login-header">
                        <i class="login-logo fa fa-connectdevelop fa-5x"></i>
                        <h4 class="login-title">Flat Admin V2</h4>
                    </div>
                    <div class="col-sm-12">
                        <div class="login-body">
                            <div class="progress hidden" id="login-progress">
                                <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                    Log In...
                                </div>
                            </div>
                            <form>
                                <div class="control">
                                    <input type="text" class="form-control" name="aname" value="" />
                                </div>
                                <div class="control">
                                    <input type="password" class="form-control" name="apassword" value="" />
                                </div>
                                
                            </form>
                            <div class="login-button text-center">
                                    <input type="submit" class="btn btn-primary" value="Login">
                            </div>
                        </div>
                        <div class="login-footer">
                            <span class="text-right"><a href="#" class="color-white">Forgot password?</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
	
			$(".login-button").click(function(){
				var aname = $("input[type='text']").val();
				var apassword = $("input[type='password']").val();
				$.ajax({
					url : "<%=request.getContextPath()%>/login",
     				type: "post",
     				dataType : "json",
     				contentType: "application/json;charset=utf-8",
     				data:JSON.stringify({
     				"aname":aname,
     				"apassword":apassword
     			}),
     			success:function(data){
     				sessionStorage.setItem("name", aname);
     				sessionStorage.setItem("password", apassword);
     				window.location.href = "<%=request.getContextPath()%>/jsp/admin_main.jsp";
     			},
     			error:function(data){
     				window.location.href = "<%=request.getContextPath()%>/jsp/admin_login.jsp";
     			}
		
			});
		
		})

		});

</script>
</body>
</html>