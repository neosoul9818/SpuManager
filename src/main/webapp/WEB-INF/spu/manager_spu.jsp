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
<script type="text/javascript">
	$(function() {
		alert("head中的js函数在同步中不能显示,在异步中可以显示");
	});
	
	
	
</script>
<title>商品信息管理表</title>
</head>
<body>
<script type="text/javascript">
	$(function() {
		alert("在同步中不能显示head中的js函数,可以显示body中的js函数");
	});
	
	function get_spu_test(url){

		// 向数据表格区域添加返回的spu商品信息列表
		$('#dg').datagrid({    
		    url:url,    
		    columns:[[   
		    	{field:'id',title:'商品编号',width:100},    
		        {field:'shp_tp',title:'商品图片',width:200},    
		        {field:'shp_mch',title:'商品名称',width:100},    
		        {field:'shp_msh',title:'商品描述',width:200},   
		        {field:'chjshj',title:'创建时间',width:300,
		        	formatter: function(value,row,index){
						var d = new Date(value);
		        		return d.toLocaleString();
					}		        	
		        } 
		    ]]    
		}); 
	}
	
</script>
	商品信息管理<hr>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',split:true" style="height:50px">
		</div>
		<div data-options="region:'west',split:true" style="width:100px">

			<a href="javascript:get_spu_test('goto_spu_list.do');" target="_blank">商品信息查询</a><br>
			<a href="javascript:add_tab('商品信息添加','goto_spu_add.do');" target="_blank" >商品信息添加</a><br>
		</div>
		<div data-options="region:'center'">
			<div id="dg" class="easyui-datagrid">
			
			</div>
		</div>
	</div>
</body>
</html>