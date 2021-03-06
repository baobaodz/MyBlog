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
<link rel="stylesheet" href="../editor.md-master/css/editormd.min.css"/>
<link rel="stylesheet" href="../css/bootstrap-switch.css">
<link rel="stylesheet" href="../css/details.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/css/share.min.css" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/dynamicscrollspy.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-switch.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/marked.min.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/prettify.min.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/raphael.min.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/underscore.min.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/flowchart.min.js"></script>
<script type="text/javascript" src="../editor.md-master/lib/jquery.flowchart.min.js"></script>
<script type="text/javascript" src="../js/editormd.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/js/social-share.min.js"></script>
<script type="text/javascript" src="../js/timecount.js"></script>
	
<title></title>
</head>
<body style="background-color: #f5f8f9">
	<div class="container">
		<div class="row clearfix">
			<!-- 头部菜单栏  -->
		    <div class="col-md-12 column" style="width: 100%; height: 70px;font-size:1em;">
			   	<nav class="navbar navbar-default navbar-fixed-top mynav" role="navigation">
					<div class="navbar-header">
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 		<span class="sr-only"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 		<span class="icon-bar"></span>
					 	</button> 
					 	<a class="navbar-brand" href="<%=request.getContextPath()%>/">BAOBAODZ</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav" id="catline" style="width:60%;">
						
							<li class=""><a href="<%=request.getContextPath()%>/?cid=2&page=1"><i class="fab fa-java fa-1x"></i> Java</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=3&page=1"><i class="fa fa-database"></i> 数据库</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=8&page=1"><i class="fa fa-desktop"></i> 计算机网络</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=5&page=1"><i class="fab fa-js"></i> 前端</a></li>
							<li class=""><a href="<%=request.getContextPath()%>/?cid=7&page=1"><i class="fas fa-code-branch"></i> 数据结构</a></li>
							<li class="more">
								<a href="#"><i class="fas fa-caret-down"></i> 更多</a>
								<ul class="more-expand">
									<li><a href="<%=request.getContextPath()%>/?cid=1&page=1">生活杂记</a></li>
									<li><a href="<%=request.getContextPath()%>/?cid=4&page=1">音乐随想</a></li>
									<li><a href="<%=request.getContextPath()%>/?cid=6&page=1">宇宙奇想</a></li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-left" role="search" style="width:170px;">
							<div class="form-group search">
								<input type="text" class="form-control search-input" placeholder=" 搜索" />
								<a class="search-btn" href="javascript:void(null)"><span class="glyphicon glyphicon-search"></span></a>
							</div> 
						</form>
						
						<ul class="nav navbar-nav navbar-right about" style="width:100px;height:50px;line-height:50px;margin-right:2px;">
							<li><a href="archives.jsp">归档</a></li>
							<li><a href="message.jsp">留言</a></li>
						</ul>
					</div>
				
				</nav>
			</div>
		</div>
		<!--面包屑导航栏 -->
		<div class="row clearfix" style="height:30px;background-color:white;box-sizing:border-box;">
		    <div class="col-md-12 column" style="width: 80%;margin-bottom:15px; height:30px;font-size:.9em;box-sizing:border-box;">
		    	<ol class="breadcrumb" style="background-color:white;">
    				<li><a href="<%=request.getContextPath()%>/">主页</a></li>
    				<li><a href="#"></a></li>
    				<li class="active">正文</li>
				</ol>
		    </div>
		</div>
		<div class="row clearfix">
			<div class="col-md-9 column" style="background-color:white;position:relative;">
				<div id="article_header"></div>
				<div id="blogcontainer" style="width: 100%;margin:0 auto;">
						<textarea id="textmarkdown" style="display:none;"></textarea>
				</div>
			</div>
				<!--右侧动态目录 -->
				<div class="col-md-3 column visible-md-8 hidden-xs" id="scrollspy" style="height:150px;;">
					<div class="switchtheme">
						<p>代码块风格不喜欢？点击下方按钮切换</p>
						<input type="checkbox" name="switchcheckbox" checked >
                    </div>
                    <div class="totop"></div>
				</div>
		</div>
		<!-- 点赞分享 -->
		<div class="row clearfix">
			<div class="col-md-9 column" style="height:40px;line-height:40px;">
				<div class="socialoperation">
					<ul>
						<li class="favorite">
							<a href="javascript:void(null)">
								<i class="far fa-thumbs-up"></i> 赞<span class="fav-num"></span>
							</a>
						</li>
						<li class="share">
							<a href="javascript:void(null)">
								<span><i class="fa fa-share-alt"></i> 分享</span>
							</a>
							<div class="social-share"></div>
						</li>
						<li class="b_review" style="float:right">
							<a href="#review">
								<span> 评论 <i class="far fa-comments"></i></span>
							</a>
							
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-3 column" style="height:60px;text-align:center;line-height:60px;">
				
			</div>
		</div>
		<!--文章底部 -->	
		<div class="row clearfix">
			<div class="col-md-9 column" style="margin:20px 0px;">
				<!--上下篇 -->
				<div id="article_footer">
					<ul class="nepr" style="width:100%;margin:0">
							
					</ul>
				</div>
				<!--畅言评论 -->
				<a id="review"></a>
				<div class="article_review">
					
					<div id="SOHUCS" sid="" ></div> 
					<script type="text/javascript"> 
						(function(){ 
							
							var aid = window.location.search.substr(5,5);
							$("#SOHUCS").attr("sid",aid);
							var appid = "cytV2uHWj"; 
							var conf = "abb600240fcf5e4632996e05dca7ba71"; 
							var width = window.innerWidth || document.documentElement.clientWidth; 
							if (width < 960) { 
								
								window.document.write("<script id='changyan_mobile_js' charset='utf-8' type='text/javascript' src='http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=" + appid + "&conf=" + conf + "'><\/script>'"); 
							} else { 
								var loadJs=function(d,a){
									var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;
									var b=document.createElement("script");
									b.setAttribute("type","text/javascript");
									b.setAttribute("charset","UTF-8");
									b.setAttribute("src",d);
									if(typeof a==="function"){
										if(window.attachEvent){
											b.onreadystatechange=function(){
												var e=b.readyState;
												if(e==="loaded"||e==="complete"){
													b.onreadystatechange=null;a()
												}
											}
										}else{
											b.onload=a
										}
									}
									c.appendChild(b)};
									loadJs("http://changyan.sohu.com/upload/changyan.js",function(){
										window.changyan.api.config({appid:appid,conf:conf})
								}); 
							} 
						})(); 
				</script>
				</div>
					
			</div>
			<div class="col-md-3 column" style="height:60px;text-align:center;line-height:60px;">
				
			</div>
				
		</div>
			
	</div>
	<!--底部 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(function(){
			var aidParam = window.location.search;//?aid=
			if(aidParam!=null&&aidParam!=""){
				var aid = aidParam.substr(5,5);
			}
			//获取当前文章
			$.ajax({
		 		url:"<%=request.getContextPath()%>/getSpecificArticle",
				type : "post",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"aid" : aid
				}),
				success : function(data) {
								
					document.title = data.title;//动态赋值网页标签里的标题
					getCategoryName(data);//面包屑导航获取文章类别名
					mdToHtml(data);//Markdown转html
					increaseViewCount(data);//增加浏览量并显示
					previousAndNext();//获取上下篇
					getArticleWords();//获取全文字数和阅读时间
					showCatalogue();//加载右侧目录
								
				}
			});
			//通过枚举类型来定义，不需要从后台获取，缺点就是非动态
			function getCategoryName(data){
				var blogCategoryID = {
					生活杂记:1,
					java:2,
					数据库:3,
					音乐随想:4,
					前端:5,
					宇宙奇想:6,
					数据结构:7,
					计算机网络:8
				}
							
				for(var cat in blogCategoryID){
					if(data.category_id==blogCategoryID[cat]){
						$(".breadcrumb").find("li").eq(1).html("<a href='<%=request.getContextPath()%>/?cid="+data.category_id+"&page=1'>"+cat+"</a>");
					}
				}
						
			}
			//Markdown转html
			function mdToHtml(data){
			//先对容器初始化，在需要展示的容器中创建textarea隐藏标签，
				var blogcontainer = $("#blogcontainer");
				blogcontainer.html("<textarea id='textHtml' style='display:none;'></textarea>");
							
				blogcontainer.append("<h2 id='testH' style='text-align:center'>"+data.title+"</h2>");
				blogcontainer.append("<center class='center-info'><p class='info'><span><i class='fas fa-calendar-check'></i> 发表于&nbsp;"
					+ new Date(data.ptime).toLocaleDateString()
					+ "</span><span>|</span><span><i class='fas fa-eye'></i>&nbsp;浏览&nbsp;"+data.viewcount+"</span><span>|</span><span><i class='far fa-heart'></i>&nbsp;喜欢 "+data.likecount+"</span></p></center>");
				blogcontainer.append("<p class='note'></p>");
				$("#textHtml").append(data.content);
				$(".fav-num").append(data.likecount);
							
				//开始对div转换
        		editormd.markdownToHTML("blogcontainer", {
        			htmlDecode : "style,script,iframe",
           			previewCodeHighlight : true,
            		emoji: true,
            		taskList:true,
            		tex: true,             // 默认不解析
            		flowChart:true,        // 默认不解析
         		});
			}
			//增加浏览量
			function increaseViewCount(data){
							
				if($.cookie("viewID")!=aid) {
 					 			
					$.ajax({
						url:"<%=request.getContextPath()%>/increaseViewCount",
						type : "post",
						dataType : "json",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify({
							"aid" : aid
						}),
						success : function(data) {
							$.cookie("viewID",aid,{"path":"/"})
								
						},
					});
				}
			}
			
			//获取全文字数和阅读时间
			function getArticleWords(){
						
				$(".center-info").nextAll().addClass("wordcontent");//给center后面的同级元素添加class方便选择
				var container = $(".wordcontent").text();
				var regEnglish = /\b\w+\b/g;//英文单词正则全局匹配
				var regChinese = /[\u4e00-\u9fa5]/g;//汉字正则全局匹配
				var EnglishWords = container.match(regEnglish);
				var ChineseWords = container.match(regChinese);
							
				var wordsCount = EnglishWords.length+ChineseWords.length;//正文字数
				var viewTime = Math.ceil(wordsCount/300);//阅读时长
							
				$("#blogcontainer .note").append("<span>温馨提示：全文共 <b>"+wordsCount+"</b> 字，阅读需要约 <b>"+viewTime+" </b>分钟</span>")
			}
						
			//获取上下篇
			function previousAndNext(){
				$.ajax({
					url:"<%=request.getContextPath()%>/previousAndNext",
					type : "post",
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({
						"aid" : aid
					}),
					success : function(data) {
						var nepr = $("#article_footer .nepr");
						if(data.length==3){
							nepr.append("<li><a href='details.jsp?aid="+data[0].aid+"'><span class='glyphicon glyphicon-chevron-left'></span>"+data[0].title+"</a></li>");
							nepr.append("<li><a href='details.jsp?aid="+data[2].aid+"'>"+data[2].title+"<span class='glyphicon glyphicon-chevron-right'></span></a></li>");
						}else{
							if(data[0].aid==aid){//当前为第一篇文章
								nepr.append("<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span>包包还在努力当中~</a></li>");
								nepr.append("<li><a href='details.jsp?aid="+data[1].aid+"'>"+data[1].title+"<span class='glyphicon glyphicon-chevron-right'></span></a></li>");//下一篇
							}else {//当前为最后一篇文章
								nepr.append("<li><a href='details.jsp?aid="+data[0].aid+"'><span class='glyphicon glyphicon-chevron-left'></span>"+data[0].title+"</a></li>");//上一篇
								nepr.append("<li><a href='#'>没有咯<span class='glyphicon glyphicon-chevron-right'></span></a></li>");
							}
						}
					}
				});
			
			}
						
			//动态展示右侧目录
			function showCatalogue(){
				$(":header").each(function(i) {
					$(":header").eq(i).removeAttr("id");//清除所有标题的id属性
				});
				$("#scrollspy").DynamicScrollspy({
  					tH: 2, 
  					bH: 6, 
  					genIDs: true,
  					offset: 100, //滚动监听面板距离viewport顶部的偏移值，默认为100。
  					ulClassNames: "hidden-print", //为最顶层的ul元素添加这个class。
  					ctiveClass: "active", //添加到当前激活的li元素上的class。
  					testing: false //如果设置为true，会为每一个标题添加tagName和id。
				});
							
				//避免右侧目录超链接点击后导航栏遮住文章小标题            
				var totop = $(".totop");
				$(document).scroll(function(){
							
					var num = $(this).scrollTop();
					var mynav = $(".mynav");
					var switchtheme = $(".switchtheme");
					
					if(num>35){
						mynav.removeClass("navbar-fixed-top");
						$(".switchtheme,.totop").css("display","block");
					}else{
						mynav.addClass("navbar-fixed-top");
						$(".switchtheme,.totop").css("display","none");
						
						totop.animate({top:'460px'},"fast");
						totop.animate({top:'440px'},"slow");
					}
            	});
            	totop.click(function(){
					$("html,body").animate({scrollTop:0},"slow");
					totop.animate({top:'-100px'},"slow");
				})
							
			}
			//点击时增加赞数
			$(".favorite").click(function(){
						
				if($.cookie("likeID")!=aid) {
 								
					$.ajax({
						url:"<%=request.getContextPath()%>/increaseLikeCount",
						type : "post",
						dataType : "json",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify({
							"aid" : aid
						}),
						success : function(data) {
							$.cookie("likeID",aid,{"path":"/"})
							$(".fa-thumbs-up").css("color","red");
							var num=Number($(".fav-num").text())+1;
							$(".fav-num").empty().html(num);
						},
					});
				}else{
					$(".favorite").css("color","red");
					$(".favorite").html("<i class='far fa-thumbs-up'></i> 已赞<span class='fav-num'></span>");
							
				}
						
			})
			//点击时增加赞数
			$(".downloadMD").click(function(){
				var articleTitle = $("#testH").text();
				$.ajax({
					url:"<%=request.getContextPath()%>/downloadMD",
					type : "post",
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({
						"aid" : aid,
						"articleTitle":articleTitle
					}),
					success : function(data) {
						$.cookie("likeID",aid,{"path":"/"})
						$(".fa-thumbs-up").css("color","red");
						var num=Number($(".fav-num").text())+1;
						$(".fav-num").empty().html(num);
						},
				});
						
			})

			//搜素框焦点事件
			var searchinput = $(".search-input");
			searchinput.focus(function(){
				$(this).width(160);//避免第一次没有效果
				$(this).width(200);
			})
			searchinput.blur(function(){
				$(this).width(160);
			})
				
			if(localStorage.normalCodeBlockTheme!="true"){//浅色
				$("input[name='switchcheckbox']").attr("checked",false);
			}
			//初始化转换按钮
    		$("input[name='switchcheckbox']").bootstrapSwitch({
    		
				size: "mini",
				onText: "DARK",
				offText: "LIGHT"
							
			});
			var $config = {
				disabled :['google', 'facebook', 'twitter'], // 禁用的站点
			};
			socialShare(".social-share", $config);//调用分享
			TimeDown("show-time", "2018-11-14 00:00:00");//调用计时
			$("#show-count").text("本站累计访问次数："+sessionStorage.getItem("rank")+"次");
						
							
		});
		//页面全部加载完后执行
		window.onload = function(){
			
			switchCodeTheme(localStorage.normalCodeBlockTheme);
			$("[name='switchcheckbox']").on("switchChange.bootstrapSwitch", function(event,state) {
  							
  				localStorage.normalCodeBlockTheme = state;
  				switchCodeTheme(localStorage.normalCodeBlockTheme);
			});
			//代码块风格转换
			function switchCodeTheme(data){
			
				if(data=="true"){
					$(".editormd-preview-container pre,.editormd-html-preview pre").css({"background-color":"#282C36","transition":"background-color 1s"});
    				$(".pln,.pun").css("color","#c8c5c3");
    				$(".lit").css("color","#a3c6a5");		
    				$(".str").css("color","#98c379");		
    				$(".typ").css("color","#61aeee");		
				}else{
					$(".editormd-preview-container pre,.editormd-html-preview pre").css("background-color","#f6f6f6");
					$(".pln,.pun").css("color","#174646");
					$(".str").css("color","#5b8e37");
					$(".typ").css("color","#1f8ce8");
					
				}
			}
			$(".b_review").click(function(){
				
				$(".textarea-bf").focus();
			
			})		
		}	
	</script>
</body>
		
</html>