package com.crazy.service;

import java.util.List;

import com.crazy.domain.Store;
import com.crazy.domain.StorePage;

/**
 * 与商店有关的业务
 * 
 * @author asus
 * 
 */
public interface IStoreService {
	/**
	 * 通过地址搜索到商店
	 * 
	 * @param adress
	 * @return
	 */
	public List<Store> searchStoe(String adress);

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
	public void getStoreByname();

}
