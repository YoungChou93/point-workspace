<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>首页</title>
<style type="text/css">
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
}
</style>
</head>
<body>
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${pageContext.request.contextPath}/res/img/index1.jpg"
					alt="...">
				<div class="carousel-caption">
					<h2>未来科技城</h2>
					<p>...</p>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/res/img/index2.jpg"
					alt="...">
				<div class="carousel-caption">
					<h2>街道口</h2>
					<p>...</p>
				</div>
			</div>
			<div class="item">
				<img src="${pageContext.request.contextPath}/res/img/index3.jpg"
					alt="...">
				<div class="carousel-caption">
					<h2>汪家嘴立交</h2>
					<p>...</p>
				</div>
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container" style="padding:20px;margin-bottom:10px;">
		<div class="row">
			<div class="col-md-12 text-center">
				<h2>WHY CityPoint?</h2>
			</div>
			<div class="col-md-4 text-center">
				<h3>摄影交流</h3>
				<img src="${pageContext.request.contextPath}/res/img/circle1.jpg" alt="..." class="img-circle" style="width:250px;">
			</div>
			<div class="col-md-4 text-center">
				<h3>去哪儿拍</h3>
			
				<img src="${pageContext.request.contextPath}/res/img/circle2.jpg" alt="..." class="img-circle" style="width:250px;">
			</div>
			<div class="col-md-4 text-center">
				<h3>资源共享</h3>

				<img src="${pageContext.request.contextPath}/res/img/circle3.jpg" alt="..." class="img-circle" style="width:250px;">
			</div>
		</div>

	</div>
	
	<div class="container" style="background-color:rgb(228, 232, 246);width:100%;padding:30px;">
	
	<div class="row">
	<div class="col-md-12 text-center">
	    <h2>摄影点</h2>
		<img src="${pageContext.request.contextPath}/res/img/point.png" alt="..."  style="width:600px;">		
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


</body>
</html>