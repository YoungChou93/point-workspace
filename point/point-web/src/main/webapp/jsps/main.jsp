<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<title>CityPoint-这里是爱好城市摄影者们的无名小站</title>
<script type="text/javascript">

$(function () {
    window.setInterval(function () {
       $.post("${pageContext.request.contextPath}/user/timer.action", function (result) {
    	   if( true != result.success ){
              	 window.location.href = '${pageContext.request.contextPath}/login.action';   		   
    	   }
    	   return;
       	},'json');    		
    }, 30000);
  });		


</script>
<style type="text/css">
body {
	padding-top: 50px;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/jsps/index.jsp"
						target="main"> <img
						src="${pageContext.request.contextPath}/res/img/logo2.png"
						style="height: 50px; margin-top: -15px;" /></a>
				</div>
				<div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a
								href="${pageContext.request.contextPath}/jsps/index.jsp"
								target="main">首页</a></li>
							<li><a href="" target="main">照片</a></li>
							<li><a
								href="${pageContext.request.contextPath}/jsps/point/map.jsp"
								target="main">城市</a></li>
							<li><a href="" target="main">分享</a></li>
							<li><a href="" target="main">关于</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" target="main"><img
									src="${pageContext.request.contextPath}${sessionScope.user.headpicture}"
									style="height: 20px;" alt="头像" /></a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${sessionScope.user.nickname}<b
									class="caret"></b>
							</a>
								<ul class="dropdown-menu ">
									<li><a href="#"><span class="glyphicon glyphicon-home"></span>个人主页</a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/user/getUserInfo.action"
										target="main"><span class="glyphicon glyphicon-user"></span>我的资料</a></li>
									<li class="divider"></li>
									<c:if test="${sessionScope.user.role==0}">
									<li><a
										href=""
										target="main"><span class="glyphicon glyphicon-asterisk"></span>管理员</a></li>
									
									<li class="divider"></li>
									</c:if>
									
									<li><a
										href="${pageContext.request.contextPath}/user/logout.action"><span
											class="glyphicon glyphicon-off"></span>登出</a></li>
								</ul></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	</nav>
	<div style="width: 100%; height: 100%;">
		<iframe frameborder="0"
			src="${pageContext.request.contextPath}/jsps/index.jsp" name="main"
			style="width: 100%; height: 100%;"></iframe>

	</div>
	<script type="text/javascript">
		
	$('ul.nav >li').click(function(e) {
		
		$('ul.nav >li').removeClass('active');
		$(this).addClass('active');
		
	});

		
	</script>
</body>
</html>