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
	overflow: hidden;
}
</style>

</head>
<body>



	
			<div 
				style="padding: 5px; position: absolute; z-index: 3; top: 10%; left: 5%;">
				
				<form role="form" class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/point/addPoint.action"
					style="background: rgba(10, 10, 10, 0.6); padding: 20px;">
					<div class="form-group form-inline text-center">
					     <font color="red">${errorMsg}${message}</font>
					</div>
					<div class="form-group form-inline">
						<label class="col-md-3" style="color:white">标题：</label> <input type="text" name="title"
							id="" class="form-control" placeholder="title" value="${point.title}">
					</div>

					<div class="form-group form-inline">
						<label class="col-md-3" style="color:white">地点：</label> <select id="ddlProvince"
							onchange="selectMoreCity(this)" class="form-control">
						</select> <select id="ddlCity" class="form-control " name="city">
						</select>
					</div>

					<div class="form-group form-inline">
						<label class="col-md-3" style="color:white">经度：</label> 
						<input type="text" name="longitude" id="longitude" class="form-control" readonly="readonly" placeholder="在地图上点击" value="${point.longitude}"/>
					</div>
					<div class="form-group form-inline">
						<label class="col-md-3" style="color:white">纬度：</label> 
						<input type="text" name="latitude" id="latitude" class="form-control" readonly="readonly" placeholder="在地图上点击" value="${point.latitude}"/>
					</div>
					<div class="form-group form-inline">
						<label class="col-md-3" style="color:white">描述：</label>
						<textarea name="content" id="" class="form-control" >${point.content}</textarea>
					</div>
					<div class="form-group">
						<label class="col-md-3" style="color:white">照片:</label> 
						<div class="col-md-9">
						<input  type="file" name="photo" id="" accept=".jpg">
						<p class="help-block" style="color:white">选择一张照片，不大于5MB</p>
						</div>
					</div>
                    <div class="form-group">
						<label class="col-md-3"></label> 
						<button type="submit" class="btn btn-primary">确定</button>
					</div>


				</form>
			</div>

	<div id="allmap"
		style="width: 100%; height: 100%; position: absolute; z-index: 2;">
	</div>

	<script type="text/javascript">
		//切换城市
		function searchcity() {
			var cityname = $("#ddlCity").val();
			map.centerAndZoom(cityname, 15);
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


		map.addEventListener("click", function(e) {
			map.clearOverlays();
			var marker = new BMap.Marker(new BMap.Point(e.point.lng,
					e.point.lat));
			map.addOverlay(marker);
			$("#longitude").val(e.point.lng);
			$("#latitude").val(e.point.lat);
		});
		
		$('#ddlProvince').change(function(){ 
			searchcity();			
		});
		
		$('#ddlCity').change(function(){ 
			searchcity();			
		});
	</script>
</body>

</html>


