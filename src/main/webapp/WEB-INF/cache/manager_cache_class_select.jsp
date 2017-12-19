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
   一级分类：<select name="flbh1" id="select_1_class_spu" class="easyui-combobox" >
	   		<option>请选择</option>
   		</select>
   
   二级分类：<select name="flbh2" id="select_2_class_spu" class="easyui-combobox" >
   		<option>请选择</option>
   </select>
    商标：<select name="pp_id" id="tm_select_sku" onchange="get_spu_by_id(this.value)">
		<option>请选择</option>
	</select>
   
   <script type="text/javascript">
	$(function() {
			/* $.getJSON("js/json/class_1.js",function(data) {
			
			$("#select_1_class_spu").empty();
			
			$(data).each(function(i,json) {
				$("#select_1_class_spu").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		}); */
		//加载一级分类列表
		$("#select_1_class_spu").combobox({
	        url: 'js/json/class_1.js', 
			valueField: 'id',    
	        textField: 'flmch1',    
	        width:80,

	        onSelect:function() {
	        	//获取组件的值，$(this)是向上找到最近的标签对象,一级分类列表的选中列表项的id
            	var class_1_id = $(this).combobox('getValue');
				//加载二级分类列表
	        	$("#select_2_class_spu").combobox({
			        url: "js/json/class_2_"+class_1_id+".js",
		            valueField: 'id',    
			        textField: 'flmch2',    
			        width:80,
			        onSelect:function() {
			        	//获取组件的值，$(this)是向上找到最近的标签对象,二级分类列表的选中列表项的id
			        	var class_2_id = $(this).combobox('getValue');
			        	/* $.ajax({
			    			type:"post",
			    			url:"get_attr_by_class_2.do",
			    			data:{"id":class_2_id},
			    			success:function(html) {
			    				alert(html);
			    				$("#attr_list").html(html);
			    			}
			    		}); */
			        	$('#attr_list').datagrid({    
			    		    url:"get_attr_by_class_2_json.do", 
			    		    queryParams:{"id":class_2_id},
			    		    columns:[[    
			    		    	 {field:'id',title:'属性编号',width:100,checkbox:true},    
			    			        {field:'shxm_mch',title:'属性名称',width:200},    
			    			        {field:'chjshj',title:'创建时间',width:300,
			    		        	formatter: function(value,row,index){
			    						var d = new Date(value);
			    		        		return d.toLocaleString();
			    					}},		        	
			    			        {field:'list_value',title:'属性值集合',width:200,
		    			        	formatter: function(value,row,index){
			    						var d = " ";
			    						$(value).each(function(i,n){
			    							d = d +n.shxzh+n.shxzh_mch;
			    						});
			    						
			    		        		return d;
			    					}}  
			    		    ]]    
			    		}); 
			        }
	            });
            	
            	$("#tm_select_sku").combobox({
			        url: "js/json/tm_class_1_"+class_1_id+".js",
		            valueField: 'id',    
			        textField: 'ppmch',    
			        width:80
	            });
			}
		});
	});
	
	function get_class_2(class_1_id) {
		
		$("#select_2_class_spu").empty();
		/* 联动二级 */
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(json){
			
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
	
	function tm_select_sku(class_1_id) {
		
		$("#tm_select_sku").empty();
		/* 联动商标 */
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(json){
			
			$(json).each(function(i,tm) {
				$("#tm_select_sku").append("<option value="+tm.id+">"+tm.ppmch+"</option>");
			});
			
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