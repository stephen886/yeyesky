package com.crazy.dao;

import java.util.List;

import com.crazy.domain.Store;
/**
 *  与商店有关的Dao
* @direction 
* @author 霍元甲
* @creation 2016年11月8日
 */
public interface IStoreDao extends IBaseDao<Store>{
	/**
	 * 通过地址(按小区)获得周边的商家
	 * 
	 * @param adress
	 * @returnList<Store>
	 */
	public List<Store> getStoreByAdress(String district,int pageNo,int pageSize);
	
	
	
	/**
	 * 通过商家名称找到的商家
	 * 
	 * @param adress
	 * @returnList<Store>
	 */
	public List<Store> getStoreByname(String name);
	
	
	
	
}
