package com.crazy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.StoreCollect;

/**
 * 
 * @direction 收藏商店
 * @author 霍元甲
 * @creation 2016年11月8日
 */
public interface ICollectStoreDao extends CrudRepository<StoreCollect, Integer> {

	/**
	 * 取消收藏商店
	 * 
	 * @return
	 */

	@Modifying
	@Query(value = "delete from storecollect_tb where storeID=:storeid and userID=:userid", nativeQuery = true)
	void delCollectStore(@Param("storeid") Integer storeid,@Param("userid") Integer userid);

	/**
	 * 统计收藏次数
	 * 
	 * @return
	 */
	@Query(value = " select  count(1) from storecollect_tb where storeID=:storeid", nativeQuery = true)
	long countByStoreID(@Param("storeid") Integer storeid);

	/**
	 * 该用户是否收藏了该商店
	 * 
	 * @param storeid
	 * @param userid
	 * @return
	 */
	List<StoreCollect> findByStoreIDAndUserID(Integer StoreID, Integer userID);

	/**
	 * 根据用户ID拿到用户收藏的商店收藏对象
	 * 
	 * @param storeid
	 * @param userid
	 * @return
	 */
	List<StoreCollect> findByUserID(Integer userID);

}
