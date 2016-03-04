<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
 html,body {
     width:100%;
     height:100%;
     overflow: hidden;	
	}
</style>
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
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
					<a class="navbar-brand" href="#">W3Cschool</a>
				</div>
				<div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="${pageContext.request.contextPath}/index.jsp" target="main">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/map.jsp" target="main">地图</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${sessionScope.user.nickname}<b class="caret"></b>
							</a>
								<ul class="dropdown-menu ">
									<li><a href="#">个人主页</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/user/userinfo.jsp" target="main">我的资料</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/user/logout.action"><span class="glyphicon glyphicon-off"></span>登出</a></li>
								</ul></li>

						</ul>



					</div>
				</div>
			</div>
		</div>
	</div>

	</nav>
	<div style="width: 100%; height: 50px;">
	</div>
	<div style="width: 100%; height: 100%;">
		<iframe frameborder="0"
			src="${pageContext.request.contextPath}/index.jsp" name="main"
			style="width: 100%; height: 100%;"></iframe>

	</div>
</body>
</html>