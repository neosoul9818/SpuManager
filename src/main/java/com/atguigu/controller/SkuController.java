package com.atguigu.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.SkuService;

@Controller
public class SkuController {
	
	@Autowired
	private SkuService skuService;
	
	@RequestMapping("save_sku")
	public String save_sku(T_MALL_SKU sku , MODEL_T_MALL_SKU_ATTR_VALUE list_av,
			ModelMap map) {
		List<T_MALL_SKU_ATTR_VALUE> av_list = list_av.getList_av();
		
//		HashMap<Object,Object> map = new HashMap<>();
//		map.put("sku", sku);
//		map.put("av_list",av_list);
		skuService.save_sku(sku,av_list);
		map.put("title", "添加库存信息");
		map.put("url", "goto_sku_add.do");
//		return "redirect:/goto_sku_add.do";
		return "redirect:/index.do";
	}
	
	@ResponseBody
	@RequestMapping("sku_get_spu")
	public List<T_MALL_PRODUCT> sku_get_spu(int class_1_id, int class_2_id, int pp_id) {
		
		List<T_MALL_PRODUCT> products = skuService.sku_get_spu(class_1_id, class_2_id, pp_id);
		
		return products;
	}
	
	@RequestMapping("goto_sku_add")
	public String goto_sku_add () {
		
		return "sku/manager_sku_add";
	}
	
	@RequestMapping("goto_sku")
	public String goto_sku() {
		
		return "sku/manager_sku";
	}
}
