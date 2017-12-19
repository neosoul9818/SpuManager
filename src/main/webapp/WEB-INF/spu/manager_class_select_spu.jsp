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
	$(function() {
			$.getJSON("js/json/class_1.js",function(data) {
			
			$("#select_1_class_spu").empty();
			
			$(data).each(function(i,json) {
				$("#select_1_class_spu").append("<option value="+json.id+">"+json.flmch1+"</option>");
				
			});
			
		});
		
	});
	
	function get_class_2(class_1_id) {
		
		$("#select_2_class-spu").empty();
		/* 联动二级 */
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(json){
			
			$(json).each(function(i,class2) {
				$("#select_2_class-spu").append("<option value="+class2.id+">"+class2.flmch2+"</option>");
			});
			
		});
		
		tm_select_spu(class_1_id);
		
	}
	
	function tm_select_spu(class_1_id) {
		
		$("#tm_select_spu").empty();
		/* 联动商标 */
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(json){
			
			$(json).each(function(i,tm) {
				$("#tm_select_spu").append("<option value="+tm.id+">"+tm.ppmch+"</option>");
			});
			
		});
	}
</script>
<title>硅谷商城</title>
</head>
<body>
   一级分类：<select name="flbh1" id="select_1_class_spu" onchange="get_class_2(this.value)">
	   		<option>请选择</option>
   		</select>
   
   二级分类：<select name="flbh2" id="select_2_class-spu">
   		<option>请选择</option>
   </select>
   
   商标：<select name="pp_id" id="tm_select_spu">
		<option>请选择</option>
	</select>
	
</body>
</html>