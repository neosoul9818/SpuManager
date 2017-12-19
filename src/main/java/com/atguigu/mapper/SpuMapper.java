package com.atguigu.mapper;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.T_MALL_CLASS_1;
import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuMapper {

	void insert_spu(T_MALL_PRODUCT spu);

	void insert_images(HashMap<Object, Object> hashMap);

	List<T_MALL_PRODUCT> listSpu();

	int deleteSpu(String id);

	T_MALL_PRODUCT getSpuById(String id);

	int updateSpu(T_MALL_PRODUCT spu);

}
