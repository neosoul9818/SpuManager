package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;
import com.atguigu.service.SpuService;

@Service
public class SpuServiceImpl implements SpuService {
	
	@Autowired
	private SpuMapper spuMapper;
	

	@Override
	public void save_spu(List<String> list_image, T_MALL_PRODUCT spu) {
		//保存商品信息
		spu.setShp_tp(list_image.get(0));
		spuMapper.insert_spu(spu);
		
		//保存图片信息
		HashMap<Object,Object> hashMap = new HashMap<>();
		hashMap.put("spu_id", spu.getId());
		hashMap.put("list_img", list_image);
		
		spuMapper.insert_images(hashMap);
	}


	@Override
	public List<T_MALL_PRODUCT> listSpu() {
		return spuMapper.listSpu();
	}


	@Override
	public int deleteSpu(String id) {
		return spuMapper.deleteSpu(id);
	}


	@Override
	public T_MALL_PRODUCT getSpuById(String id) {
		return spuMapper.getSpuById(id);
	}

	@Override
	public int updateSpu(T_MALL_PRODUCT spu) {
		return spuMapper.updateSpu(spu);
	}

}
