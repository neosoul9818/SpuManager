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

<title>硅谷商城</title>
</head>
<body>
商品缓存管理页面<br>
<jsp:include page="manager_cache_class_select.jsp"></jsp:include>
<div id="attr_list"></div>
<br>
	<a href="javascript:refresh_class_search_cache();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">刷新分类检索缓存</a>
	<a href="javascript:refresh_attr_search_cache();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">刷新属性检索缓存</a>
	
	
	<script type="text/javascript">
	function refresh_class_search_cache () {
		var class_2_id=$("#select_2_class_spu").combobox("getValue");
		$.post("refresh_class_cache.do",{class_2_id:class_2_id},function(data){
			alert("分类检索刷新了"+data+"条缓存数据");
		});
	}
	function refresh_attr_search_cache () {
		var class_2_id=$("#select_2_class_spu").combobox("getValue");
		var checkeds = $("#attr_list").datagrid("getChecked");
		var attr_array=new Array();
		$(checkeds).each(function(i,json){
			//为什么此处传递的是属性id，不是属性id+属性值id？
			attr_array[i] = json.id;
		});
		$.post("refresh_attr_search_cache.do",{class_2_id:class_2_id,attr_array:attr_array},function(data){
			alert("属性检索刷新了"+data+"条缓存数据");
		});
	}
</script>
	
</body>
</html>