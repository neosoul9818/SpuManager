package com.atguigu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.service.AttrService;
import com.atguigu.service.SearchService;
import com.atguigu.util.MyCacheUtil;

@Controller
public class SearchCacheController {
	
	@Autowired
	private SearchService searchService;
	@Autowired
	private AttrService attrService;
	
	@RequestMapping(value="refresh_attr_search_cache",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String refresh_attr_search_cache(@RequestParam("attr_array[]") int[] attr_array,String class_2_id,Model model) {
		System.out.println("1111111111111");
		//循环attr_array属性数组，将每个属性对应的属性值集合查询出来
		for (int i = 0; i < attr_array.length; i++) {
			int attr_id =attr_array[i];
			//通过属性名id,查询t_mall_value表得到属性值id的集合，注意：不是select * 是select id
			List<Integer> list_value_id=attrService.get_value_by_attrId(attr_id);
			//循环属性值，查询对应的list_sku集合，生成key
			for (int j = 0; j < list_value_id.size(); j++) {
				//每个属性名id对应的属性值id集合中的每个属性值id
				int val_id = list_value_id.get(j);
				//生成key（二级分类id+属性名id+属性值id,因为属性查询商品集合是建立在分类查询商品集合的sql语句基础上的，所以要加二级分类id）
				String key = "attr_"+class_2_id+"_"+attr_id+"_"+val_id;

				List<T_MALL_SKU_ATTR_VALUE> list_av = new ArrayList<>();
				T_MALL_SKU_ATTR_VALUE attr_value = new T_MALL_SKU_ATTR_VALUE();
				attr_value.setShxm_id(attr_id);
				attr_value.setShxzh_id(val_id);
				list_av.add(attr_value);
				//有的属性值下面没有商品，所以list_sku为空[]，但是不为null，一组属性名id和属性值id可以对应多个skuid，此处的list_av每次只有一个元素
				List<OBJECT_T_MALL_SKU> list_sku = searchService.search_sku_by_attr(class_2_id, "", list_av);
				
				//循环list_sku 	,将list_sku写入key
				MyCacheUtil.refreshRedisKey(key, list_sku);
			}
			System.out.println("222222222222");
		}
		return "共刷新0条二级分类的商品数据";
	}
	
	@RequestMapping(value="refresh_class_cache",produces="text/html;charset=utf-8")
	@ResponseBody
	public String refresh_class_cache(String class_2_id,Model model) {
		//根据二级分类的id刷新对应的redis中的key的缓存
		//redis中的key命名规则：必须和业务相关，不能和技术相关，必须有key的查询条件，唯一。
		
		String key ="class_2_"+class_2_id;
		
		List<OBJECT_T_MALL_SKU> list_sku = searchService.select_sku_by_class_2(class_2_id);
		
		MyCacheUtil.refreshRedisKey(key,list_sku);
		return "刷新了"+list_sku.size()+"条数据";
	}
	
	@RequestMapping("goto_cache")
	public String goto_cache() {
		
		return "cache/search_manager_cache";
	}
}
