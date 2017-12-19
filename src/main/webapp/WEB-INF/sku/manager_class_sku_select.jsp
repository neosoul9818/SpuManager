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
			$.getJSON("js/json/class_1.js",function(data) {
			
				//用js循环json分类的集合
			$(data).each(function(i,json) {
				//将分类集合中的内容生成<option>对象加载到下拉列表中
				$("#select_1_class_sku").append("<option value="+json.id+">"+json.flmch1+"</option>");
				
			});
			
		});
		
	});
	//选择一级分类的时候，触发得到二级分类表的列表框
	function get_class_2(class_1_id) {
		
		$("#select_2_class_sku").empty();
		/* 联动二级 */
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(json){
			
			$(json).each(function(i,class2) {
				$("#select_2_class_sku").append("<option value="+class2.id+">"+class2.flmch2+"</option>");
			});
			
		});
		//选择一级分类的时候，触发得到品牌列表框
		tm_select_sku(class_1_id);
		
	}
	
	function tm_select_sku(class_1_id) {
		
		$("#tm_select_sku").empty();
		/* 联动商标 */
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(json){
			
			$(json).each(function(i,tm) {
				$("#tm_select_sku").append("<option value="+tm.id+">"+tm.ppmch+"</option>");
			});
			
		});
	}
	//点击二级分类表下拉列表框选项触发该事件ajax返回和指定二级分类选项相关联的属性值的
	//页面添加进div中
	function get_attr_check_by_class_2(id) {
		$.ajax({
			type:"post",
			url:"get_attr_check_by_class_2.do",
			data:{"id":id},
			success:function(html) {
				$("#attr_list").html(html);
			}
		});
	}
	//点击商标（品牌）下拉列表框，ajax返回json数据，添加进商品列表的列表框中
	function get_spu_by_id(pp_id) {
		var class_1_id = $("#select_1_class_sku").val();
		var class_2_id = $("#select_2_class_sku").val();
		$("#sku_select_spu").empty();
		$.ajax({
			url:"sku_get_spu.do",
			data:{"pp_id":pp_id, 
				"class_1_id":class_1_id,
				"class_2_id":class_2_id},
			//ajax返回商标查询的结果集若干个产品product，封装为option，添加进select下来选择框中
			success:function(result) {
				//返回多个产品spu
				$(result).each(function(i,json){
					$("#sku_select_spu").append("<option value="+json.id+">"+json.shp_mch+"</option>");
				});
			}
			
		});
	}
</script>
<title>硅谷商城</title>
</head>
<body>
   一级分类：<select name="flbh1" id="select_1_class_sku" onchange="get_class_2(this.value)">
	   		<option>请选择</option>
   		</select>
   
   二级分类：<select name="flbh2" id="select_2_class_sku" onchange="get_attr_check_by_class_2(this.value)">
   		<option>请选择</option>
   </select>
   
   商标：<select name="pp_id" id="tm_select_sku" onchange="get_spu_by_id(this.value)">
		<option>请选择</option>
	</select>
   商品列表：<select name="shp_id" id="sku_select_spu">
		<option>请选择</option>
	</select>
	
</body>
</html>