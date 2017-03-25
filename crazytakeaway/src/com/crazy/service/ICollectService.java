package com.crazy.service;

import java.io.IOException;
import java.util.List;

import com.crazy.domain.Store;

public interface ICollectService {

	/**
	 * 收藏商店
	 * 
	 * @return 返回的是主键ID
	 * @throws IOException
	 */
	public int collectStore(Integer storeid,Integer userid);

	/**
	 * 取消收藏商店
	 * 
	 * @return
	 * @throws IOException
	 */
	public int canelcollectStore(Integer storeid,Integer userid);

	/**
	 * 统计商店收藏次数
	 * 
	 * @return
	 */
	public long countcollectStore(int storeid);

	/**
	 * 该用户是否收藏了该商店
	 * 
	 * @param storeid
	 * @return 收藏主键ID
	 */
	public int iscollectStore(int storeid,int userid);

	/**
	 * 根据用户ID拿到用户所收藏的商店
	 * 
	 * @param storeid
	 * @return 收藏主键ID
	 */
	public List<Store> getCStore(int userid);

}
