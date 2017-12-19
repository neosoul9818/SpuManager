package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;
import com.atguigu.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService {
	@Autowired
	private SkuMapper skuMapper;
	
	@Override
	public List<T_MALL_PRODUCT> sku_get_spu(int class_1_id, int class_2_id, int pp_id) {
		return skuMapper.sku_get_spu(class_1_id, class_2_id, pp_id);
	}

//	@Override
//	public void save_sku(HashMap<Object, Object> map) {
//		T_MALL_SKU sku = (T_MALL_SKU) map.get("sku");
//		skuMapper.save_sku(sku);
//		
//		List<T_MALL_SKU_ATTR_VALUE> map.get("av_list");
//		skuMapper.save_av();
//	}

	@Override
	public void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> list_av) {
		//保存库存sku
		skuMapper.save_sku(sku);
		
		//保存库存sku和属性属性值的关联表,此处需要用到主键返回策略，sku传入sku的id和shp_id
		skuMapper.save_av(sku,list_av);
		
	}

}
