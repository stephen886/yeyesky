package com.crazy.service;

import java.util.List;
import java.util.Map;

import com.crazy.domain.Store;

/**
 * 与商店有关的业务
 * 
 * @author asus
 * server
 */
public interface IStoreService {
	/**
	 * 通过地址搜索到商店
	 * 
	 * @param adress
	 * @return
	 */
	public Map<String,Object> searchStoe(String adress,int page);

	/**
	 * 通过storeID得到商店
	 * 
	 * @param adress
	 * @return
	 */
	public Store getStore(int storeID);
	
	/**
	 * 按商家名字或者地址找到商店，通过分页返回数据
	 * 
	 * @param adress
	 * @returnList<Store>
	 */
//	public List<Store> getStoreByname();

}
