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
			url : "${pageContext.request.contextPath}/admin/getLoginRecord.action",
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
	<table id="dg" title="用户登录记录管理" toolbar="#tb">
		<thead>
			<tr>
				<th field="user" width="150" align="center" formatter="formatUser">昵称</th>
				<th field="logintime" width="150" align="center">登录时间</th>
				<th field="loginip" width="150" align="center">IP</th>
				<th field="logouttime" width="150" align="center">登出时间</th>
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