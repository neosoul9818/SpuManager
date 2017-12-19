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
<script type="text/javascript">
function spu_delete(spu_id,shp_mch){
	alert(1);
	var b = confirm("确认要删除 [	"+shp_mch+"  ]吗?");
	if(b) {
		$.ajax({
			type:"POST",
			url:"spu_del.do",
			data:{"id":spu_id},
			success:function(result){
				if(result.success){
					window.location.href="goto_spu_list.do";
				}
			}	
		});
	}
}

</script>
	<table align="center" width="500px" border="1">
		<tr>
			<th>商品图片
			</th>
			<th>商品名称
			</th>
			<th>商品描述
			</th>
			<th colspan="2">商品操作
			</th>
		</tr>

		<c:forEach items="${spus }" var="spu">
			<tr>
				<td><img src="upload/image/${spu.shp_tp }" width="50px"></td>
				<td>${spu.shp_mch }</td>
				<td>${spu.shp_msh }</td>
				<td><a href="javascript:add_tab('更新','goto_spu_update/${spu.id}.do');">更新</a></td>
				<%-- <td><a id="spu_del" href="spu_del/${spu.id }.do?${spu.shp_mch}">删除</a></td> --%>
				<td><a id="spu_del" href="javascript:spu_delete('${spu.id}','${spu.shp_mch }');">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	
</body>

</html>