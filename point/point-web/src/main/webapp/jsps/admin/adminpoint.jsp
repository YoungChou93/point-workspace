<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function formatStatus(value, row, index) {
		if (0 == value) {
			return "待审核";
		} else if (1 == value) {
			return "已启用";
		} else if (-1 == value) {
			return "已删除";
		}
	}
	function formatUser(value, row, index) {
		return value.nickname;
    }
	function search() {
		$('#dg').datagrid({
			queryParams : {
				status : $('#status').val()
			},
		});
	}
	function enablePoint() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要启用的摄影点！");
			return;
		}

		var row = selectedRows[0];
		url = "${pageContext.request.contextPath}/admin/enablePoint.action";
		$.post(url, {
			pointid : row.pointid
		}, function(result) {
			if (null == result.errormsg) {
				$.messager.alert("系统提示", "启用成功！");
				$("#dg").datagrid("reload");
			} else {
				$messager.alert("系统提示", result.errormsg);
				return;
			}
		}, "json");

	}

	function deletePoint() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的摄影点！");
			return;
		}

		var row = selectedRows[0];
		url = "${pageContext.request.contextPath}/admin/deletePoint.action";
		$.post(url, {
			pointid : row.pointid
		}, function(result) {
			if (null == result.errormsg) {
				$.messager.alert("系统提示", "删除成功！");
				$("#dg").datagrid("reload");
			} else {
				$messager.alert("系统提示", result.errormsg);
				return;
			}
		}, "json");

	}

	$(function() {
		$('#dg').datagrid({
			pagination : true,
			rownumbers : true,
			fit : true,
			queryParams : {
				status : $('#status').val()
			},
			singleSelect : true,
			url : "${pageContext.request.contextPath}/admin/getPoints.action",
			loadFilter : function(result) {
				if (null != result.data) {
					return result.data;
				} else {
					$.messager.alert(result.errormsg, result.errorinfo);
					return;
				}
			},
			onDblClickRow : function(rowIndex, rowData) {

			}

		});
	});
</script>
</head>
<body>
	<table id="dg" title="摄影点管理" toolbar="#tb">
		<thead>
			<tr>
				<th field="title" width="150" align="center">名称</th>
				<th field="longitude" width="100" align="center">经度</th>
				<th field="latitude" width="100" align="center">维度</th>
				<th field="createtime" width="150" align="center">时间</th>
				<th field="city" width="100" align="center">城市</th>
				<th field="status" width="100" align="center"
					formatter="formatStatus">状态</th>
				<th field="user" width="100" align="center"
					formatter="formatUser">用户</th>
				<th field="praise" width="100" align="center">赞</th>
				<th field="down" width="100" align="center">踩</th>
			</tr>
		</thead>
	</table>

	<div id="tb">
		<div>
			<label>状态：</label> <select id="status" name="status">
				<option value="0">待审核</option>
				<option value="1">已启用</option>
				<option value="-1">已删除</option>
			</select> <a href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
		<div>
			<a href="javascript:enablePoint()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">启用</a> <a
				href="javascript:deletePoint()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">删除</a>

		</div>
	</div>
</body>
</html>