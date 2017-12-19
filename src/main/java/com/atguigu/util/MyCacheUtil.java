package com.atguigu.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.atguigu.bean.OBJECT_T_MALL_SKU;

import redis.clients.jedis.Jedis;

/**
 * redis缓存工具类
 * 
 * @author NeoSoul
 *
 */
public class MyCacheUtil {
	/**
	 * 刷新redis中的指定key对应的value
	 * 
	 * @param key
	 * @param list
	 */
	public static <T> int refreshRedisKey(String key, List<T> list) {
		// 调用redis，刷新二级分类id对应的list_sku的缓存
		Jedis jedis = null;
		try {
			jedis = JedisPoolUtils.getJedis();
			// 刷新到缓存中
			jedis.del(key);

			for (int i = 0; i < list.size(); i++) {
				jedis.zadd(key, i, MyJsonUtil.object_to_json(list.get(i)));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return list.size();
	}

	/**
	 * 从redis缓存中得到指定key的value
	 * 
	 * @param key
	 * @param t
	 * @return
	 */
	public static <T> List<T> get_redis_key(String key, Class<T> t) {
		List<T> list = new ArrayList<>();

		Jedis jedis = null;
		try {
			jedis = JedisPoolUtils.getJedis();

			Set<String> zrange = jedis.zrange(key, 0, -1);
			Iterator<String> iterator = zrange.iterator();
			while (iterator.hasNext()) {
				String next = iterator.next();
				list.add(MyJsonUtil.json_to_object(next, t));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return list;
	}
	/**
	 * redis的更新是先删除后添加
	 * zrem k1 a 
	 * zadd k1 0 aa
	 * @param key
	 * @param old_members
	 * @param new_memebers
	 * @return
	 */
	public static int updateKey(String key, String old_member,String new_memeber) {
		Jedis jedis = null;
		try {
			jedis = JedisPoolUtils.getJedis();
			Boolean exists = jedis.exists(key);
				
			if(exists) {
				//得到旧的value的score
				Double zscore = jedis.zscore(key, old_member);
				//删除旧value
				Long zrem = jedis.zrem(key, old_member);
				//在旧的value的score排名位置添加新的value
				jedis.zadd(key, zscore, new_memeber);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		return 1;
	}

}
