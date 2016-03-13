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
	
	function openTab(text,url){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				closable:true,
				content:content
			});
		}
	}
	
	var userTreeData=[{
			attributes: '',
				text: '账号管理',
				state: 'open'
	},{
		attributes: '',
		text: '账号管理',
		state: 'open'
}]
	
	
	$("#usertree").tree({
        data: userTreeData,
        onClick : function(node){  
            if (node.state == 'closed'){  
                $(this).tree('expand', node.target);  
            }else if (node.state == 'open'){  
                $(this).tree('collapse', node.target);  
            }else{
                var tabTitle = node.text;
                var url = node.attributes;
                openTab(tabTitle, url);
            }
        }
    });
	
</script>
</head>
<body class="easyui-layout">



	<div region="center">
		<div id="tabs" class="easyui-tabs" fit="true" border="false">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div align="center" style="padding-top: 100px">
					<font color="red" size="10">欢迎您，管理员！</font>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="管理员" split="true">
		<div id="nvgtmenu" class="easyui-accordion"
			data-options="border:false">
			<div title="用户管理">
				<ul id="usertree">
					
				</ul>
			</div>
		</div>
	</div>





</body>
</html>