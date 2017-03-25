package com.crazy.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.StoreUser;

/**
 * 
 * @direction 与用户有关的持久层
 * @author 霍元甲
 * @creation 2016年11月8日
 */
public interface IStoreUserDao extends CrudRepository<StoreUser, Integer> {

	/**
	 * 根据用户名得到一个storeUser
	 * 
	 * @param us
	 * @return
	 */
	StoreUser getByUsername(String username);

	@Modifying
	@Query(value = "UPDATE store_user_tb SET store_user_tb.password=:password WHERE store_user_tb.username=:username", nativeQuery = true)
	int updatePwd(@Param("password") String password, @Param("username") String username);

}
