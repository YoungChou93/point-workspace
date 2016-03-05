<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 针对移动设备，为了确保适当的绘制和触屏缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<title>登录</title>
<style type="text/css">
body, button, input, select, textarea, h1, h2, h3, h4, h5, h6 {
	font-family: Microsoft YaHei, '宋体', Tahoma, Helvetica, Arial,
		"\5b8b\4f53", sans-serif;
}

html, body {
	font-size: 100%;
	background: #fff;
}

body {
	font-size: 100%;
}

.banner {
	background: url(${pageContext.request.contextPath}/img/loginbackground1.jpg)
		no-repeat center top;
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	min-height: 700px;
}

.banner-top {
	width: 30%;
	padding: 2em 30px;
	background: rgba(228, 232, 246, 0.56);
	margin: 0 auto;
	min-width: 250px;
}

.bnr-left {
	width: 60%;
	float: left;
}

.bnr-right {
	width: 40%;
	float: right;
}

.welcome {
	padding: 30px 0 0 0;
}

.welcome h1 {
	color: #FFF;
	font-size: 4.0em;
	margin-bottom: 2%;
	font-weight: 100;
	text-align: center;
	line-height: 1.5em;
	text-transform: uppercase;
}
</style>
</head>
<body>
	<div class="banner">
		<div class="container">
			<div class="welcome">
				<h1>WElCOME TO CHINA CITYSCAPE</h1>
			</div>
			<div class="banner-top">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#login" data-toggle="tab"
						style="background: rgba(228, 232, 246, 0.1);"> 登录 </a></li>
					<li><a href="#register" data-toggle="tab"
						style="background: rgba(228, 232, 246, 0.1);">注册</a></li>
				</ul>

				<div class="tab-content" align="center">
				<img  src="${pageContext.request.contextPath}/img/logo.png" style="height:90px;text-align:center;"/>
				<!-- <h1 class="text-center">CityPoint</h1> -->
					<div class="tab-pane fade in active" id="login">
						
						<font color="red">${errorMsg}</font>
						<form class="form-horizontal" method="post" style="margin: 20px;"
							action="${pageContext.request.contextPath}/user/login.action">
							<div class="form-group">
								<input type="text" name="email" class="form-control"
									id="inputEmail" placeholder="Email" value="${userCustom.email}">
							</div>
							<div class="form-group">
								<input type="password" name="password" class="form-control"
									id="inputPassword" placeholder="Password">
							</div>
							<div class="form-group">
								<div class="bnr-left">
									<img
										src="${pageContext.request.contextPath}/getVerifyCode.action"
										id="loginVerifyCode" /> <a
										href="javascript:changeLoginVerifyCode()">换张图</a>
								</div>
								<div class="bnr-right">
									<input type="text" name="verifyCode" class="form-control"
										placeholder="VerifyCode">
								</div>
							</div>
							<button type="submit" class="btn btn-primary btn-block">登录</button>
						</form>
					</div>
					<div class="tab-pane fade" id="register">

						<form class="form-horizontal" method="post" style="margin: 20px;"
							action="${pageContext.request.contextPath}/user/register.action">
							<div class="form-group">
								<input type="text" class="form-control" name="email"
									placeholder="Email" value="${registerUserCustom.email}">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="nickname"
									placeholder="Nickname" value="${registerUserCustom.nickname}">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									placeholder="Password">
							</div>
							<div class="form-group">
								<input type="password" class="form-control"
									name="confirmPassword" placeholder="Confirm Password">
							</div>
							<div class="form-group">
								<div class="bnr-left">
									<img
										src="${pageContext.request.contextPath}/getVerifyCode.action"
										id="registerVerifyCode" /> <a
										href="javascript:changeRegisterVerifyCode()">换张图</a>
								</div>
								<div class="bnr-right">
									<input type="text" class="form-control" name="verifyCode"
										placeholder="VerifyCode">
								</div>
							</div>
							<button type="submit" class="btn btn-primary btn-block">注册</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		/*
		 * 换一张验证码
		 */
		function changeLoginVerifyCode() {
			/*
			 * 1. 获取<img>元素
			 * 2. 重新设置它的src
			 * 3. 使用毫秒来添加参数
			 */
			$("#loginVerifyCode").attr(
					"src",
					"${pageContext.request.contextPath}/getVerifyCode.action?a="
							+ new Date().getTime());

		}

		function changeRegisterVerifyCode() {
			/*
			 * 1. 获取<img>元素
			 * 2. 重新设置它的src
			 * 3. 使用毫秒来添加参数
			 */
			$("#registerVerifyCode").attr(
					"src",
					"${pageContext.request.contextPath}/getVerifyCode.action?a="
							+ new Date().getTime());

		}
	</script>
</body>
</html>