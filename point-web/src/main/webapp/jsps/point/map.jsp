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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/style.css"> 
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
<script type="text/javascript">
    $('#bus').hide();
</script>
</head>
<body>
    <jsp:include page="/jsps/main.jsp" flush="true" />
	<div class="container" style="padding: 5px;margin-top: 50px;">
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

					<div class="form-group">
						<label>类别：</label> <select id="category" name="category"
							class="form-control">
							<option value="1">所有</option>
						    <c:if test="${!empty user}">
							<option value="2">自己</option>
							</c:if>
						</select>
					</div>
				</form>
				<font color="red" id="message"></font>
			</div>
            <c:if test="${!empty user}">
			<div class="col-md-2">
				<a href="${pageContext.request.contextPath}/addpoint.action"
					class="btn btn-primary" >添加</a>
			</div>
			</c:if>
		</div>
	</div>

	<div id="allmap"
		style="width: 100%; height: 100%; position: absolute; z-index: 2;">
	</div>
    <div id="bus" style="visibility:hidden;overflow-y:scroll;position: absolute; z-index: 3;left:5%;top:15%;width:350px;height:450px;background: rgba(10, 10, 10, 0.6); padding-left:10px; padding-right:10px;">

    <h3 style="color:white">公交查询</h3>
    <div class="form-group form-inline">
    <label style="color:white">起点：</label> 
		<input type="text"  id="origin" class="form-control" >
		<button onclick="closeBus()"  class="btn btn-default" style="float:right;">关闭</button>
	</div>
	<div class="form-group form-inline">
	    <label style="color:white">终点：</label> 
		<input type="text"  id="longitude" class="form-control" readonly="readonly"  style="width:100px;"/>
		<input type="text"  id="latitude" class="form-control" readonly="readonly" style="width:100px;"/>
		<button onclick="busSearch()"  class="btn btn-primary">查询</button>
	</div>
    
    <div id="busResult"></div>
    
    </div>

	<script type="text/javascript">
	
	    var localpoints=null;
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
		/* var top_right_navigation = new BMap.NavigationControl({
			anchor : BMAP_ANCHOR_TOP_RIGHT,
			type : BMAP_NAVIGATION_CONTROL_SMALL
		}); //右上角，仅包含平移和缩放按钮 */
		/*缩放控件type有四种类型:
		BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/

		map.addControl(top_left_control);
		map.addControl(top_left_navigation);
		//map.addControl(top_right_navigation);

		map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
		map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
		
		
		var stCtrl = new BMap.PanoramaControl(); //构造全景控件
		stCtrl.setOffset(new BMap.Size(20, 20));
		map.addControl(stCtrl);//添加全景控件
		
		var transit = new BMap.TransitRoute(map, {
			renderOptions: {map: map, panel: "busResult"}
		});
		

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
		
		$('#category').change(function() {
			searchcity();
			getPoint();

		});

		
		/* 从后台服务器获取摄影点*/
		function getPoint() {
			$.post("${pageContext.request.contextPath}/point/getPoints.action",
					{
						city : $('#ddlCity').val(),
						number : $('#number').val(),
                        category :$('#category').val()
                        
					}, function(result) {
						if (null != result.errorMsg) {
							alert(result.errorMsg);
							map.clearOverlays();
						}
						if (null != result.points) {
							localpoints=result.points;
							showPoints(result.points);
						}
						return;
					}, 'json');
		}

		
		/* 为摄影点添加信息窗口并显示*/
		function showPoints(points) {
			map.clearOverlays();
			for (var i = 0; i < points.length; i++) {
				var point = points[i];
				showOnePoint(point);
			}
			marker.setLabel(label);
		}
		function showOnePoint(point) {
			var content = "<div style='width:310px;'><h4 style='margin:0 0 5px 0;padding:0.2em 0'><h3>"
					+ point.title
					+ "</h3>"
					+ "<img style='float:right;margin:4px' id='"+point.pointid+"' src='${pageContext.request.contextPath}"+point.bigphoto+"' width='300' height='200' />"
					+ "<a href='${pageContext.request.contextPath}/point/getOnePoint.action?pointid="+ point.pointid+"'"
					+ " class='btn btn-primary' target='_Blank' style='margin-right:10px;'>详细</a>"
					+ "<button onclick='showBus("+point.longitude+","+point.latitude+")' class='btn btn-primary' style='margin-right:10px;'>路线</button>"
					+ "<p style='float:right;'>"+point.user.nickname+"</p>"
					+ "<img style='width:30px;float:right;' src='${pageContext.request.contextPath}"+point.user.headpicture+"'/>"
					+ "</div>";

			
			var marker = new BMap.Marker(new BMap.Point(point.longitude,point.latitude));
			map.addOverlay(marker);

			var label = new BMap.Label(point.title, {
				offset : new BMap.Size(20, -10)
			});
			var length=point.title.length;
			length=length*16;
			length=length+'px';
			label.setStyle({
				 color : "red",
				 fontSize : "15px",
				 fontFamily:"微软雅黑",
				 backgroundColor:"white",
				 paddingRight:length,
				 border:"2px solid red"
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
		
		
		/* 显示公交查询面板*/
		function showBus(longitude, latitude){
			$("#longitude").val(longitude);
			$("#latitude").val(latitude);
			//$('#bus').show();
			$('#bus').css("visibility","visible");
			
		}
		
		/* 公交查询路线*/
		function busSearch(){
			var origin=$("#origin").val();
			if(origin!=null && ""!=origin){
			var point = new BMap.Point($("#longitude").val(),$("#latitude").val());
			transit.search(origin, point);
			}else{
				alert("请输入起点");
			}
			
		}
		
		/* 关闭公交查询面板*/
		function closeBus(){
            $('#bus').css("visibility","hidden");
			if(localpoints!=null){
				showPoints(localpoints);
			}else{
				getPoint();
			}
		}
		
		
		$(function() {
			getPoint();
		});

        $("#citypage").addClass('active');
		
	</script>
</body>

</html>


