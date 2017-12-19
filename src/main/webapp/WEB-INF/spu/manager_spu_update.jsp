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
<script type="text/javascript">

</script>
<title>硅谷商城</title>
</head>
<body>
	<form action="">
	<table align="center" width="500px" border="1">
			<tr><td>商品名</td><td><input id="shp_mch" type="text" value="${spu.shp_mch}"/></td></tr>
			<tr><td>商品描述</td><td><textarea id="shp_msh" style="width:300px;height:100px;">${spu.shp_msh}</textarea></td></tr>
			<tr><td>创建时间</td><td>${spu.chjshj}</td></tr>
			<tr><td>商品图片</td><td><img src="upload/image/${spu.shp_tp}" width="50px"></td></tr>
			<tr><td> <button onclick="updateSpu()">提交</button>  </td></tr>
		</table>
	</form>

</body>

<script type="text/javascript">
	function  updateSpu() {
		var shp_mch = $("#shp_mch").val();
		var shp_msh = $("#shp_msh").val();
		$.ajax({
			type : "POST",
			url : "${APP_PATH}/spu_update.do",
			data : {
				"id" : "${spu.id}",
				"shp_mch" : shp_mch,
				"shp_msh" : shp_msh
			},
			success : function(result){
				if(result.success){
					alert("修改成功!!")
    				window.location.href = "${APP_PATH}/goto_spu_list.do";
    			}else{
    				alert("用户信息更新失败");
    			}
			}
		})
	}
	
</script>
</html>