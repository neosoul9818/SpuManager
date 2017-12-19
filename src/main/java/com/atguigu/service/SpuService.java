package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuService {


	void save_spu(List<String> list_image, T_MALL_PRODUCT spu);

	List<T_MALL_PRODUCT> listSpu();

	int deleteSpu(String id);

	T_MALL_PRODUCT getSpuById(String id);

	int updateSpu(T_MALL_PRODUCT spu);

}
