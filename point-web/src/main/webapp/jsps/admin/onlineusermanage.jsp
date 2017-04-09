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
	function formatUser(value, row, index) {
			return value.nickname;
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
			singleSelect : true,
			url : "${pageContext.request.contextPath}/admin/getOnlineUsers.action",
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
	<table id="dg" title="在线用户管理" toolbar="#tb">
		<thead>
			<tr>
				<th field="user" width="150" align="center" formatter="formatUser">昵称</th>
				<th field="email" width="150" align="center">邮箱</th>
				<th field="lasttime" width="150" align="center">登录时间</th>
				<th field="ipcode" width="150" align="center">IP</th>
				<th field="sessionid" width="150" align="center">SessionID</th>
			</tr>
		</thead>
	</table>

	<div id="tb">
	&nbsp;<input type="text" id="filter" size="20"
				onkeydown="if(event.keyCode==13) search()" /> 
				<a href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
	</div>
</body>
</html>