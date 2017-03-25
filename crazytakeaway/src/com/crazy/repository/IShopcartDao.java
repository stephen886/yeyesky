package com.crazy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.Shopcart;

public interface IShopcartDao extends  JpaRepository<Shopcart, Integer>{

	
	List<Shopcart> findByMenu_Store_StoreIDAndUserID(Integer StoreID, Integer userID);
	
	@Modifying
	@Query(value = "delete from shopcart_tb where userid=:userid and menu_id=:menu_id", nativeQuery = true)
	void delMenu(@Param("userid") Integer userid,@Param("menu_id") Integer menu_id);

	@Modifying
	@Query(value = "update shopcart_tb set amount=:amount where userid=:userid and menu_id=:menu_id", nativeQuery = true)
	void updateMenu(@Param("amount") Integer amount,@Param("userid") Integer userid,@Param("menu_id") Integer menu_id);

	
	@Modifying
	@Query(value = "DELETE FROM shopcart_tb  WHERE  menu_id  in(select menuid  from menu_tb where store_id=:storeid) and userid=:userid", nativeQuery = true)
	void clearAll(@Param("storeid") Integer storeid,@Param("userid") Integer userid);

}
