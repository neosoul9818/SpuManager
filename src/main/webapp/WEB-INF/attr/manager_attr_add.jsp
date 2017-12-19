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
<title>属性添加页面</title>
</head>
<body>

	<form action="save_attr.do" method="post">
		<div class="easyui-layout" data-options="fit:true" style="height:500px">
			<div data-options="region:'north',split:true" style="height:50px">
				<input type="text" name="class_2_id" value="${class_2_id}" />
				<input type="text" name="class_2_name" value="${class_2_name}" /><button onclick="add_attr()" type="button">添加属性</button><br>
					</div>
					<div data-options="region:'west',split:true" style="width:100px"></div>
					<div data-options="region:'center'">
						<table id="attr_0" border="1">
					<tr><td>属性名：<input type="text" name="list_attr[0].shxm_mch" /></td> <td></td><td>添加值</td></tr>
					<tr><td>属性值：<input type="text" name="list_attr[0].list_value[0].shxzh" /></td> <td>单位：<input type="text" name="list_attr[0].list_value[0].shxzh_mch" /></td><td><a href="javascript:del_value(this);" class="del">删除</a></td></tr>
					<tr><td>属性值：<input type="text" name="list_attr[0].list_value[1].shxzh" /></td> <td>单位：<input type="text" name="list_attr[0].list_value[1].shxzh_mch" /></td><td><a href="javascript:;" href="" class="del">删除</a></td></tr>
				</table>
				<br>
				<input type="submit" value="添加"/>
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
		alert(url);
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
	
	function del_value(index) {
		alert("错误有问题");
	
		$(index).parents("tr").remove();
	}
	
		index = 0;
	function add_attr() {
		alert(4);
		index=index+1;
		var attr_table="";
			attr_table += '<table id="attr_'+index+'" border="1">';
			attr_table += '	<tr><td>属性名：<input type="text" name="list_attr['+index+'].shxm_mch" /></td> <td></td><td>添加值</td></tr>';
			attr_table += '	<tr><td>属性值：<input type="text" name="list_attr['+index+'].list_value[0].shxzh" /></td> <td>单位：<input type="text" name="list_attr['+index+'].list_value[0].shxzh_mch" /></td><td><a href="javascript:;" class="del">删除</a></td></tr>';
			attr_table += '	<tr><td>属性值：<input type="text" name="list_attr['+index+'].list_value[1].shxzh" /></td> <td>单位：<input type="text" name="list_attr['+index+'].list_value[1].shxzh_mch" /></td><td><a href="javascript:;" href="" class="del">删除</a></td></tr>';
			attr_table += '</table>';
		
		$("#attr_"+(index-1)).after(attr_table);
		
	}
	
</script>
</body>
</html>