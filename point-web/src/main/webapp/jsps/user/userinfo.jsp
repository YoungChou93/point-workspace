<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-2.2.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/cropbox.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/chinacity.js"></script>
<title>个人资料</title>

<style type="text/css">
html{
	width: 100%;
	height: 100%;
}

body{
	margin-top: 60px;
	width: 100%;
	height: 100%;
}

.td-name {
	width: 40%;
	padding: 10px;
}

.td-value {
	width: 60%;
	padding: 10px;
}

.td-name-modify {
	width: 25%;
	padding: 10px;
}

.td-value-modify {
	width: 75%;
	padding: 10px;
}

.action {
	width: 400px;
	height: 30px;
	margin: 0 auto;
}

.cropped {
	margin: 0 auto;
	padding:5px;
}

.imageBox {
	position: relative;
	height: 400px;
	width: 400px;
	border: 1px solid #aaa;
	background: #fff;
	overflow: hidden;
	background-repeat: no-repeat;
	cursor: move;
	margin: 0 auto;
}

.imageBox .thumbBox {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 200px;
	height: 200px;
	margin-top: -100px;
	margin-left: -100px;
	box-sizing: border-box;
	border: 1px solid rgb(102, 102, 102);
	box-shadow: 0 0 0 1000px rgba(0, 0, 0, 0.5);
	background: none repeat scroll 0% 0% transparent;
}

.imageBox .spinner {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	text-align: center;
	line-height: 400px;
	background: rgba(0, 0, 0, 0.7);
}
</style>
</head>
<body>
<jsp:include page="/jsps/main.jsp" flush="true" />
	<div class="container" style="margin-top: 20px">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">编辑</h3>
					</div>

					<ul class="list-group text-center">
						<li class="list-group-item"><a href="#userinfo"> 修改资料 </a></li>
						<li class="list-group-item"><a href="#password"> 修改密码 </a></li>
						<li class="list-group-item"><a href="#headpicture"> 修改头像
						</a></li>
					</ul>

				</div>

			</div>
			<div class="col-md-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">个人资料</h3>
					</div>
					<div class="panel-body">
						<table cellspacing="20px" style="width: 100%;">
							<tr>
								<td align="right" class="td-name">邮箱：</td>
								<td class="td-value">${user.email}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">昵称：</td>
								<td class="td-value">${user.nickname}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">性别：</td>
								<td class="td-value"><c:if test="${user.gender==0}">未知</c:if>
									<c:if test="${user.gender==1}">男</c:if> <c:if
										test="${user.gender==2}">女</c:if></td>
							</tr>
							<tr>
								<td align="right" class="td-name">地区：</td>
								<td class="td-value">${user.location}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">简介：</td>
								<td class="td-value">${user.brief}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">注册时间：</td>
								<td class="td-value"><fmt:formatDate
										value="${user.registertime}" type="date" /></td>
							</tr>
							<tr>
								<td align="right" class="td-name">微博：</td>
								<td class="td-value">${user.weibo}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">QQ：</td>
								<td class="td-value">${user.qq}</td>
							</tr>
							<tr>
								<td align="right" class="td-name">积分：</td>
								<td class="td-value">${user.score}</td>
							</tr>
						</table>


					</div>
				</div>
				<div class="panel panel-default" id="password">
					<div class="panel-heading">
						<h3 class="panel-title">密码</h3>
					</div>
					<div class="panel-body text-center">
                        <p id="passwordResult"></p>
						<form class="form-horizontal" action="${pageContext.request.contextPath}/user/modifyPassword.action">
							<div class="form-group form-inline">
								<label>原密码：</label> <input type="password" id="oldPassword" class="form-control" />
							</div>

							<div class="form-group form-inline">
								<label>新密码：</label> <input type="password" id="newPassword" class="form-control" />
							</div>

							<div class="form-group form-inline">
								<label>确认密码：</label> <input type="password" id="confirmPassword" class="form-control" />
							</div>
						</form>
						
						     <button  class="btn btn-primary" onclick="modifyPassword()">确定</button>

					</div>
				</div>
				<div class="panel panel-default" id="userinfo">
					<div class="panel-heading">
						<h3 class="panel-title">编辑资料</h3>
					</div>
					<div class="panel-body">
						<table cellspacing="20px" style="width: 100%;">
							<tr>
								<td align="right" class="td-name-modify">性别：</td>
								
								<td class="td-value-modify"><select name="gender" id="gender">
							        <option value="0">未知</option>
							        <option value="1">男</option>
							        <option value="2">女</option>
						        </select></td>
							</tr>
							<tr>
								<td align="right" class="td-name-modify">地区：</td>
								<td class="td-value-modify"><select id="ddlProvince" onchange="selectMoreCity(this)">
						        </select> <select id="ddlCity"  name="city">
						        </select></td>
							</tr>
							<tr>
								<td align="right" class="td-name-modify">简介：</td>
								<td class="td-value-modify"><input type="text" id="brief" class="form-control"  value="${user.brief}"/></td>
							</tr>
							<tr>
								<td align="right" class="td-name-modify">微博：</td>
								<td class="td-value-modify"><input type="text" id="weibo" class="form-control"  value="${user.weibo}"/></td>
							</tr>
							<tr>
								<td align="right" class="td-name-modify">QQ：</td>
								<td class="td-value-modify"><input type="text" id="qq" class="form-control"  value="${user.qq}"/></td>
							</tr>
						</table>
					    <div style="width:100%;" class=" text-center">
                           <button class="btn btn-primary" onclick="modifyUserInfo()">确定</button>
                        </div>
					</div>
				</div>
				<div class="panel panel-default" id="headpicture">
					<div class="panel-heading">
						<h3 class="panel-title">头像</h3>
					</div>
					<div class="panel-body text-center">

						<div class="imageBox">
							<div class="thumbBox"></div>
							<div class="spinner" style="display: none">Loading...</div>
						</div>

						<div class="action">
							<input type="file" id="file"  accept=".jpg,.png" style="float: left; width: 250px">
							<input type="button" id="btnCrop" value="Crop"
								style="float: right"> <input type="button"
								id="btnZoomIn" value="+" style="float: right"> <input
								type="button" id="btnZoomOut" value="-" style="float: right">
						</div>

						<div class="cropped"></div>
						
						<button class="btn btn-primary" onclick="modifyHeadPicture()">上传</button>
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
			<p>Copyright &copy; 2016.City Point All rights reserved.这里是爱好城市摄影者们的无名小站</p>
			<p>未经允许，不得擅自使用本站照片。</p>
		</div>
	</div>

	<script type="text/javascript">
	    
	    BindCity("${user.location}");
	
	    $("#gender").val(${user.gender});
	
	
	    var headpicture=null;
	
		$(window).load(function() {
			var options = {
				thumbBox : '.thumbBox',
				spinner : '.spinner',
				imgSrc : '${pageContext.request.contextPath}${sessionScope.user.headpicture}'
			}
			var cropper = $('.imageBox').cropbox(options);
			$('#file').on('change', function() {
				var reader = new FileReader();
				reader.onload = function(e) {
					options.imgSrc = e.target.result;
					cropper = $('.imageBox').cropbox(options);
				}
				reader.readAsDataURL(this.files[0]);
				this.files = [];
			})
			$('#btnCrop').on('click', function() {
				var img = cropper.getDataURL();
				headpicture=cropper.getDataURL();
				$('.cropped').append('<img src="'+img+'">');
			})
			$('#btnZoomIn').on('click', function() {
				cropper.zoomIn();
			})
			$('#btnZoomOut').on('click', function() {
				cropper.zoomOut();
			})
		});
		
		function modifyPassword(){
			$.post("${pageContext.request.contextPath}/user/modifyPassword.action",
					{
						oldPassword : $('#oldPassword').val(),
						password : $('#newPassword').val(),
						confirmPassword : $('#confirmPassword').val()

					}, function(result) {
						if (result.success) {
							alert("修改成功！");
							$('#oldPassword').val("");
							 $('#newPassword').val("");
							 $('#confirmPassword').val("");
						}else{
							//$('#passwordResult').val(result.errorMsg);
							alert(result.errorMsg);
						}
						return;
					}, 'json');
		}
		
		function modifyHeadPicture(){
			if(headpicture!=null){
				 $.post("${pageContext.request.contextPath}/user/modifyHeadPicture.action",{
					headpicture : headpicture
				},
				function(result) {
					if (result.success) {
						alert("修改成功！");
						headpicture=null;
						$('.cropped').empty();
					}else{
						//$('#passwordResult').val(result.errorMsg);
						alert(result.errorMsg);
					}
					return;
				}, 'json'); 
				
			}else{
				alert("请选择一张头像并裁剪");
			}
		}
		
		function modifyUserInfo(){
			
			 $.post("${pageContext.request.contextPath}/user/modifyUserInfo.action",{
					gender   :  $("#gender").val(),
				    location :  $("#ddlCity").val(),
				    brief    :  $("#brief").val(),
				    weibo    :  $("#weibo").val(),
				    qq       :  $("#qq").val()
				}, 
				function(result) {
					if (result.success) {
						alert("修改成功！");
					}else{
						alert(result.errorMsg);
					}
					return;
				}, 'json'); 
			
		}
		
		
	</script>
</body>
</html>