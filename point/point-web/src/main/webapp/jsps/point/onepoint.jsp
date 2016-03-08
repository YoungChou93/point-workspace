<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
</style>

</head>
<body>

	<div class="container" style="margin-top:10px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-7 text-center">

				<img src="${pageContext.request.contextPath}${point.bigphoto}"
					class="img-responsive" style="margin-bottom:10px"/>

				<img
					src="${pageContext.request.contextPath}${point.user.headpicture}"
					style="width: 50px;" />
				<p>${point.user.nickname}</p>

				<p>${point.createtime}</p>

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

	<script type="text/javascript">
		
	</script>
</body>

</html>


