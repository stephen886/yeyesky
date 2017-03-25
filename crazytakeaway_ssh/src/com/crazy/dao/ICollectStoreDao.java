package com.crazy.dao;

import java.util.List;

import com.crazy.domain.StoreCollect;

/**
 * 
* @direction 收藏商店
* @author 霍元甲
* @creation 2016年11月8日
 */
public interface ICollectStoreDao extends IBaseDao<StoreCollect>{

//	/**
//	 * 
//	 * 
//	 * @return
//	 */
//	public int collectStore(StoreCollect collect);

	/**
	 * 取消收藏商店
	 * 
	 * @return
	 */
	public int canalcollectStore(StoreCollect collect);

	/**
	 * 统计收藏次数
	 * 
	 * @return
	 */
	public int countcollect(int storeid);

	/**
	 * 该用户是否收藏了该商店
	 * 
	 * @param storeid
	 * @param userid
	 * @return
	 */
	public int iscollect(StoreCollect collect);
	
	/**
	 * 根据用户ID拿到用户收藏的商店收藏对象
	 * 
	 * @param storeid
	 * @param userid
	 * @return
	 */
	public List<StoreCollect> getcollect(int UserID);

}
