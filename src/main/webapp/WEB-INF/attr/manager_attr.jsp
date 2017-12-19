<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>商品属性管理表</title>
</head>
<body>
	商品属性管理<br>
	<jsp:include page="manager_class_select_attr.jsp"></jsp:include>
	
	<div id="attr_list"></div>
	<br>
	<a href="javascript:add_attr_tab('添加分类属性');">添加分类属性</a>
	
<script type="text/javascript">
	function add_attr_tab(title) {
		// add a new tab panel 
		//判断tt区域中的名为title的面板是否存在
		var b = $("#tt").tabs('exists',title);
		
		var class_2_id =$("#select_2_class_spu option:selected").val();
		var class_2_name = $("#select_2_class_spu option:selected").text();
		
		alert(b);
		if(!b) {
			$('#tt').tabs('add',{    
			    title:title,    
			    href:"goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name,
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			}); 
		}else{
			$("#tt").tabs('select',title);
		}
	}
	
	function goto_attr_add() {
		var class_2_id =$("#select_2_class_spu option:selected").val();
		var class_2_name = $("#select_2_class_spu option:selected").text();
		
		window.location.href="goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name;
	}
</script>
</body>
</html>