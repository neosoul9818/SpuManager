package com.atguigu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuMapper {

	List<T_MALL_PRODUCT> sku_get_spu(@Param("flbh1") int class_1_id,@Param("flbh2") int class_2_id,@Param("pp_id") int pp_id);

	void save_sku(T_MALL_SKU sku);
	//@Param("sku") 取出sku的shp_id和主键id ,@Param("list_av") 
	void save_av(@Param("sku")T_MALL_SKU sku, @Param("list_av") List<T_MALL_SKU_ATTR_VALUE> list_av);

}
