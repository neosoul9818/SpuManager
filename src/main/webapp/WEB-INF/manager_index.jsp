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
<link rel="stylesheet" type="text/css" href="js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function(){
	var title = "${title}";
	var url="${url}";
	if(title!=""&&url!=""){
		add_tab(title,url);
	}
	
});
	function add_tab(title, url) {
		// add a new tab panel 
		//判断tt区域中的名为title的面板是否存在
		var b = $("#tt").tabs('exists',title);
		alert(b);
		if(!b) {
			$('#tt').tabs('add',{    
			    title:title,    
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');  
			          //刷新当前tab页面
			            var current_tab = $("#tt").tabs("getSelected");
			            $("#tt").tabs("update",{
			            tab:current_tab,
			            options : {
			            content : '<iframe scrolling="auto" frameborder="0" src="\'+URL+\'" style="width:100%;height:100%;"></iframe>',
				            //或者 href : ‘‘;
				            }
			            });
			        }    
			    }]    
			}); 
		}else{
			$("#tt").tabs('select',title);
		}
	}
	/* 不建议用异步加载方式虽然可以远程加载href中的head中的js函数，但是head中如果有jquery
	会覆盖原来的jquery，导致easyui核心包在jquery前面而失效 */
	function add_tab_test(title, url) {
		// add a new tab panel  
		//判断tt区域中的名为title的面板是否存在
		var b = $("#tt").tabs('exists',title);
		if(!b) {
			$.post(url,function(data){
				$('#tt').tabs('add',{    
				    title:title,    
				    content:data,    
				    closable:true,    
				    tools:[{    
				        iconCls:'icon-mini-refresh',    
				        handler:function(){    
				            alert('refresh');    
				        }    
				    }]    
				}); 
			});
		}
	}
</script>
<title>硅谷商城</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:true,title:'硅谷商城'" style="width:200px;padding:10px;">
		<div class="easyui-accordion">
			<div title="硅谷商城" data-options="iconCls:'icon-ok'" style="width:150px,overflow:auto;padding:10px;">
				<span></span>
				<ul class="easyui-tree"> 
					<li>
						<span>商品信息管理</span>
						<ul>
							<li><a href="javascript:add_tab('商品信息管理','goto_spu.do');" target="_blank">商品信息管理</a></li>
							<li><a href="javascript:add_tab('商品属性管理','goto_spu_attr.do');" target="_blank">商品属性管理</a></li>
							<li><a href="javascript:add_tab('商品库存管理','goto_sku.do');" target="_blank">商品库存管理</a></li>
						</ul>
					</li>
					<li>
						<span>商品缓存管理</span>
						<ul>
							<li><a href="javascript:add_tab('检索缓存管理','goto_cache.do');" target="_blank">检索缓存管理</a></li>
							<li><a href="javascript:add_tab('其他缓存管理','goto_other_cache.do');" target="_blank">其他缓存管理</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div class="easyui-tabs" id="tt" style="height:700px">
			
		</div>
	</div>


</body>
</html>