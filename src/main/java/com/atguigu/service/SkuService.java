package com.atguigu.service;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuService {

	List<T_MALL_PRODUCT> sku_get_spu(int class_1_id, int class_2_id, int pp_id);


//	void save_sku(HashMap<Object, Object> map);


	void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> av_list);

}
