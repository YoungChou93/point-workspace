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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<title>激活</title>
</head>
<body>
	<div class="container text-center">
		<h1>${errorMsg}${message}</h1>
		<p>${content}</p>
        <p><font id="timeCount" color="red"></font>秒后跳转到登录页面！</p> 
	</div>
	<script type="text/javascript">
		var second = 10; //设置一个跳转秒数
		$(function() {
			setInterval("count()", 1000); //定义一个定时器
			$("#timeCount").html(second); //显示当前的秒数
		});

		function count() {
			second--; //秒数自减
			if (second >= 0) {
				$("#timeCount").html(second); //刷新当前的秒数，重新显示秒数

			} else {
				clearInterval();//这个可以不用，因为页面都要跳转了，要了也没多大差别
				window.location.href = "${pageContext.request.contextPath}/jsps/user/login.jsp"; // 设置跳转的链接
			}

		}
	</script>
</body>
</html>