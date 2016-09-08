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
			return "未激活";
		} else if (1 == value) {
			return "已激活";
		} else if (1 == value) {
			return "已注销";
		}
	}
	function formatGender(value, row, index) {
		if (0 == value) {
			return "未知";
		} else if (1 == value) {
			return "男";
		} else if (1 == value) {
			return "女";
		}
	}

	function formatRole(value, row, index) {
		if (0 == value) {
			return "管理员";
		} else if (1 == value) {
			return "普通用户";
		}
	}
	function search() {
		$('#dg').datagrid({
			queryParams : {
				filter : $('#filter').val()
			},
		});
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
			url : "${pageContext.request.contextPath}/admin/getUsers.action",
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
	<table id="dg" title="用户账号管理" toolbar="#tb">
		<thead>
			<tr>
				<th field="nickname" width="150" align="center">昵称</th>
				<th field="email" width="150" align="center">邮箱</th>
				<th field="gender" width="100" align="center"
					formatter="formatGender">性别</th>
				<th field="location" width="100" align="center">地区</th>
				<th field="status" width="100" align="center"
					formatter="formatStatus">状态</th>
				<th field="registertime" width="150" align="center">注册时间</th>
				<th field="weibo" width="100" align="center">微博</th>
				<th field="qq" width="100" align="center">QQ</th>
				<th field="logincounts" width="100" align="center">登录次数</th>
				<th field="lasttime" width="150" align="center">最后登录IP</th>
				<th field="lastip" width="150" align="center">最后登录时间</th>
				<th field="role" width="100" align="center" formatter="formatRole">角色</th>
				<th field="score" width="100" align="center">积分</th>

			</tr>
		</thead>
	</table>

	<div id="tb">
		&nbsp;<input type="text" id="filter" size="15"
			onkeydown="if(event.keyCode==13) search()" /> <a
			href="javascript:search()" class="easyui-linkbutton"
			iconCls="icon-search" plain="true">搜索</a>
	</div>
</body>
</html>