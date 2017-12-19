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
   一级分类：<select name="flbh1" id="select_1_class_spu" onchange="get_class_2(this.value)">
	   		<option>请选择</option>
   		</select>
   
   二级分类：<select name="flbh2" id="select_2_class-spu" onchange="get_attr_by_class_2_json(this.value)">
   		<option>请选择</option>
   </select>
   
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
		$.getJSON("js/json/class_2_"+ckllass_1_id+".js",function(json){
			
			$(json).each(function(i,class2) {
				$("#select_2_class-spu").append("<option value="+class2.id+">"+class2.flmch2+"</option>");
			});
		});
	}
	
	function get_attr_by_class_2(id) {
		$.ajax({
			type:"post",
			url:"get_attr_by_class_2.do",
			data:{"id":id},
			success:function(html) {
				alert(html);
				$("#attr_list").html(html);
			}
		});
	}
	
	/* 单元格formatter(格式化器)函数，带3个参数：
	value：字段值。
	rowData：行记录数据。
	rowIndex: 行索引。 */
	function get_attr_by_class_2_json(id) {
		
		$('#attr_list').datagrid({
			url:"get_attr_by_class_2_json.do",
			queryParams: {
				id: id
			},
			columns:[[
				{field:'id',title:'编号',width:100},    
		        {field:'shxm_mch',title:'属性名',width:100},    
		        {field:'chjshj',title:'创建时间',width:200,
		        	formatter: function(value,row,index){
							return new Date(value).toLocaleString();
					}
		        },
		        {field:'list_value',title:'属性值',width:500,align:'right',
		        	formatter: function(value,row,index){
						var d="";
		        		$(value).each(function(i, json){
							d = d+ "  " + json.shxzh+json.shxzh_mch;							
						});
			        	return d;
					}	
		        }
			]],
			rowStyler: function(index,row){
				if (index % 2 == 0){
					return 'background-color:#6293BB;color:#fff;';
				}
			}

		});
	}
</script>
   
   
</body>
</html>