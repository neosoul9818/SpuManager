<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>
<title>库存信息管理表</title>
</head>
<body>
	库存sku管理<hr> 
	<form action="save_sku.do" method="post">
		<!-- 以下包含的页面是3个下拉框 ，添加进attr_list的div区域中-->
		<jsp:include page="manager_class_sku_select.jsp"></jsp:include>
		<br>
		<div id="attr_list"></div>
		<hr>
		属性库存名称:<input type="text" name="sku_mch"><br>
		商品库存数量:<input type="text" name="kc"><br>
		商品库存价格:<input type="text" name="jg"><br>
		商品库存地址:<input type="text" name="kcdz"><br>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>