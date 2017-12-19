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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>硅谷商城</title>
</head>
<body>
	<form action="save_spu.do" method="post" enctype="multipart/form-data">
		<div class="easyui-layout" data-options="fit:true" style="height:500px">
			<div data-options="region:'north',split:true" style="height:50px">
				<jsp:include page="manager_class_select_spu.jsp"></jsp:include><br>
			</div>
			<div data-options="region:'west',split:true" style="width:100px"></div>
			<div data-options="region:'center'">
				商品名称：<input type="text" name="shp_mch"/><br>
				商品描述<textarea name="shp_msh"></textarea><br>
				上传图片:<br>
				<div id="div_file_0">
					<img id="img_0" src="image/upload_hover.png" style="cursor: pointer;" width="70px;" onclick="img_click(0)"/>
					<input id="file_0" style="display:none" type="file" name="files" onchange="img_change(0)"/><br>
				</div>
				
				<input type="submit" value="提交" /><br>
			</div>
		</div>
		
	</form>
	<script type="text/javascript">
	function img_click(index) {
		$("#file_"+index).click();
		alert(1);
		
	}
	
	function img_change(index) {
		
		//获取图片缓存
		var file = $("#file_"+index)[0].files[0];
		
		//转化为url对象
		var url = window.URL.createObjectURL(file);
		//alert(url);
		//显示图片
		$("#img_"+index).attr("src", url);
		
		// 用户选择的空白图片，最佳新的图片
		var length = $(":file").length;
		if(length == (index+1)) {
			img_add(index);
		}
	}
	
	function img_add(index) {
		index = index +1;
		var a = '<div id="div_file_"'+index+'>';
		var b = '<img id="img_'+index+'" src="image/upload_hover.png" width="70px;" onclick="img_click('+index+')"/>';
		var c = '<input id="file_'+index+'" type="file" name="files" style="display:none" onchange="img_change('+index+')"/><br>';
		var d = '</div>';
		
		$("#div_file_"+(index-1)).after(a+b+c+d);
	}
	
</script>
</body>
</html>