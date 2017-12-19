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
	/* function show_check(attr_id,check) {
		if(check){
			$("#attr_radio_"+attr_id).show();
		}else{
			$("#attr_radio_"+attr_id).hide();
		}
	} */
</script>
<title>硅谷商城</title>
</head>
<body>
 属性列表页面<br>
		<!--manager_attr_check_list  该页面是ajax返回的html页面，动态添加进manager_sku页面中，sku页面中包含了manager_class_sku_select页面，-->
 	<c:forEach items="${attr_list }" var="attr" varStatus="status">
 		<input type="checkbox"  value="${attr.id }" name="list_av[${status.index}].shxm_id"/> ${attr.shxm_mch}
 	</c:forEach>
 	<hr>
	<c:forEach items="${attr_list }" var="attr" varStatus="status">
	 	<div id="attr_radio_${attr.id }">
			 ${attr.shxm_mch}:
			<c:forEach items="${attr.list_value }" var="val">
				<input  type="radio" value="${val.id }" name="list_av[${status.index}].shxzh_id"/>${val.shxzh }${val.shxzh_mch}
			</c:forEach>
		</div>
			<br>
	</c:forEach>
</body>
</html>