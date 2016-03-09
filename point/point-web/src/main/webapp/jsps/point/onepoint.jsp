<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=ASLZn4DTgi2jUv4aCgBEIG1c"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/chinacity.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}
.index-bottom {
	background: #555;
	padding: 2em 0;
	text-align: center;
}

ul#footer-links {
	padding: 0;
	margin: 0;
	list-style: none;
}

ul#footer-links li {
	display: inline-block;
}

ul#footer-links li a {
	color: #fff;
	font-size: 0.85em;
	margin: 0 12px;
}

.index-bottom p {
	color: #fff;
	font-size: 0.85em;
	margin: 1em 0 0 0;
}

</style>


</head>
<body>

	<div class="container" style="margin-top: 10px">
		<div class="row">

			<div class="col-md-1"></div>
			<div class="col-md-11">
				<img src="${pageContext.request.contextPath}${point.user.headpicture}"
					style="width: 50px;float:left;margin-right:10px;" />
				<div >
					<p><strong>${point.user.nickname}</strong></p>
					<p><fmt:formatDate value="${point.createtime}" type="both"/></p>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-7 text-center">

				<img src="${pageContext.request.contextPath}${point.bigphoto}"
					class="img-responsive" style="margin-bottom: 10px" />

			</div>
			<div class="col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">${point.title}</h3>
					</div>
					<div class="panel-body">
						<p>${point.content}</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<div class="index-bottom">
		<div class="container">
			<ul id="footer-links">
				<li><a href="#">友情链接</a></li>
				<li><a href="https://tuchong.com/" target="_Blank">图虫</a></li>
				<li><a href="http://www.lofter.com/" target="_Blank">Lofter</a></li>
				<li><a href="http://photo.poco.cn/" target="_Blank">POCO摄影</a></li>
				<li><a href="https://500px.com" target="_Blank">500px</a></li>
				<li><a href="http://www.fengniao.com/" target="_Blank">蜂鸟网</a></li>
				<li><a href="https://github.com/" target="_Blank">GitHub</a></li>
			
			</ul>
			<p>Copyright &copy; 2016.City Point All rights reserved.</p>
			<p>未经允许，不得擅自使用本站照片。</p>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>
</body>

</html>


