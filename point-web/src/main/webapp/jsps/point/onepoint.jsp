<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery.twbsPagination.js"></script>
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

.pointcomment {
	background-color: rgb(245, 245, 245);
	padding: 10px;
	margin-bottom: 10px;
}

.pointcommet-content {
	margin-top: 20px;
	margin-left: 30px;
	padding: 20px;
	letter-spacing: 2px;
	line-height: 110%;
	font-size: 20px;
	word-break: break-all;
}

.pointcommet-img {
	width: 25px;
	float: left;
	margin-right: 10px;
}
.pointcommet-time {
	font-size: 10px;
	position:relative;
	top:10px;
}
</style>
<script type="text/javascript">
	
	function onComment() {

		var comment = $('#comment').val();
		if (null == comment || '' == comment) {
			alert("评论不能为空");
			return;
		}
		$.post('${pageContext.request.contextPath}/pointcomment/addPointComment.action',
				{
					pointid : "${point.pointid}",
					comment : comment
				}, function(result) {
					if (result.errorMsg == null) {
						alert("评论成功");
						$('#comment').val("");
					} else {
						alert(result.errorMsg);
					}
		});
	}
	
	function getDiv(object){
		 var div="<div class='pointcomment panel panel-default'>"+
			"<div class='text-left'>"+
			"<img src='${pageContext.request.contextPath}"+object.user.headpicture+
			"' class='pointcommet-img'/>"+
			"<p>"+object.user.nickname+"</p></div>"+
		    "<p class='pointcomment-content text-left'>"+object.comment+"</p>"+
		     "<div class='pointcommet-time text-right'><p>"+object.createtime+"</p></div></div>";
		return div;
	}
	$(function() {	
		var totalpage=Math.ceil(${total}/10);
	$('#pagination-page').twbsPagination(
			{
				totalPages : totalpage,
			    version : '1.1',
				onPageClick : function(event, page) {
					$.post('${pageContext.request.contextPath}/pointcomment/getPointComment.action',
						{
							rows : 10,
							page : page,
							pointid : "${point.pointid}"
						},
						function(result) {
				
							 if (result.errorMsg == null) {
								$('#divforComment').empty();
								result=eval("("+result+")");
                                var data=result.data.rows;
                                var length = data.length;
								for (var i = 0; i < length; i=i + 1) {
									 var object=data[i];
                                     $("#divforComment").append(getDiv(object));
								} 
								
							} else {
								alert(result.errorMsg);
							}  
						
							});
				}
	});
	
	
	});
</script>
</head>
<body>

	<div class="container" style="margin-top: 10px">
		<div class="row">

			<div class="col-md-1"></div>
			<div class="col-md-11">
				<img
					src="${pageContext.request.contextPath}${point.user.headpicture}"
					style="width: 50px; float: left; margin-right: 10px;" />
				<div>
					<p>
						<strong>${point.user.nickname}</strong>
					</p>
					<p>
						<fmt:formatDate value="${point.createtime}" type="both" />
					</p>
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

	<div class="container" style="margin-top: 10px">
		<div class="col-md-1"></div>
		<div class="col-md-7 text-center">
			<div class="form-group text-left">
				<h3>评论</h3>
			</div>
			<textarea id="comment" rows="" cols="3" class="form-control"
				style="height: 100px;"></textarea>
			<div class="form-group text-right">
				<button class="btn btn-primary" style="margin-top: 10px;"
					onclick="onComment()">确定</button>
			</div>
			<div id="divforComment" style="word-break: break-all;">
				<div class="pointcomment panel panel-default">
					<div class="text-left">
						<img
							src="${pageContext.request.contextPath}${point.user.headpicture}"
							style="width: 30px; float: left; margin-right: 10px;" />
						<p>${point.user.nickname}</p>
					</div>
					<p class="pointcomment-content text-left"></p>
					<div class="text-right">
						<p>wwwwwww</p>
					</div>
				</div>
			</div>


			<ul id="pagination-page" class="pagination-sm"></ul>
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


