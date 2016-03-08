<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>

</head>
<body>

	<div class="container" style="padding: 5px;">
		<div class="row">
			<div class="col-md-10">
				<form id="getPointForm" role="form" class="form-inline"
					action="${pageContext.request.contextPath}/point/getPoints.action">
					<div class="form-group">
						<label>省份：</label> <select id="ddlProvince"
							onchange="selectMoreCity(this)" class="form-control">
						</select>
					</div>
					<div class="form-group">
						<label>城市：</label> <select id="ddlCity" name="city"
							class="form-control">
						</select>
					</div>
					<div class="form-group">
						<label>数量：</label> <select id="number" name="number"
							class="form-control">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="50">50</option>
							<option value="100">全部</option>
						</select>
					</div>
				</form>
				<font color="red" id="message"></font>
			</div>
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/jsps/point/addpoint.jsp"
					class="btn btn-primary" target="main">添加</a>
			</div>
		</div>
	</div>

	<div id="allmap"
		style="width: 100%; height: 100%; position: absolute; z-index: 2;">
	</div>


	<script type="text/javascript">
		//切换城市
		function searchcity() {
			var cityname = $("#ddlCity").val();
			map.centerAndZoom(cityname, 12);
		}

		BindCity("武汉");

		var map = new BMap.Map("allmap");
		map.centerAndZoom(new BMap.Point(114.308525, 30.601381), 12);

		var top_left_control = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_TOP_LEFT
		});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
		var top_right_navigation = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_RIGHT,
			type : BMAP_NAVIGATION_CONTROL_SMALL
		}); //右上角，仅包含平移和缩放按钮
		/*缩放控件type有四种类型:
		BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/

		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		map.addControl(top_right_navigation);

		map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用

		$('#ddlProvince').change(function() {
			searchcity();
			getPoint();
		});

		$('#ddlCity').change(function() {
			searchcity();
			getPoint();
		});

		$('#number').change(function() {
			searchcity();
			getPoint();

		});

		function getPoint() {
			$.post("${pageContext.request.contextPath}/point/getPoints.action",
					{
						city : $('#ddlCity').val(),
						number : $('#number').val()

					}, function(result) {
						if (null != result.errorMsg) {
							alert(result.errorMsg);
						}
						if (null != result.points) {
							showPoints(result.points);
						}
						return;
					}, 'json');
		}

		function showPoints(points) {
			map.clearOverlays();
			for (var i = 0; i < points.length; i++) {
				var point = points[i];
				showOnePoint(point);

			}
		}

		function showOnePoint(point) {

			var content = "<div style='width:310px;'><h4 style='margin:0 0 5px 0;padding:0.2em 0'><h4>"
					+ point.title
					+ "</h4>"
					+ "<img style='float:right;margin:4px' id='"+point.pointid+"' src='${pageContext.request.contextPath}"+point.bigphoto+"' width='300' height='200' />"
					+ "<a href='${pageContext.request.contextPath}/point/getOnePoint.action?pointid="+ point.pointid+"'"
					+ " class='btn btn-primary' target='main'>详细</a>"
					+ "</div>";

			var marker = new BMap.Marker(new BMap.Point(point.longitude,
					point.latitude));
			map.addOverlay(marker);

			var label = new BMap.Label(point.title, {
				offset : new BMap.Size(20, -10)
			});
			marker.setLabel(label);

			var infoWindow = new BMap.InfoWindow(content);

			marker.addEventListener("click", function() {
				this.openInfoWindow(infoWindow);
				document.getElementById('point.pointid').onload = function() {
					infoWindow.redraw();

				}

			});
		}
		
		$(function() {
			getPoint();
		});
	</script>
</body>

</html>


