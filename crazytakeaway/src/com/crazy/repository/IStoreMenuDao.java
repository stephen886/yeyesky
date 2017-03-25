package com.crazy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.Menu;

public interface IStoreMenuDao extends JpaRepository<Menu, Integer> {

	List<Menu> getByStore_StoreID(Integer StoreID);

	@Modifying
	@Query(value = "delete from menu_tb where menuid=:menuid", nativeQuery = true)
	int delMenu(@Param("menuid") Integer menuid);

	Menu getByMenuID(Integer menuID);

	@Modifying
	@Query(value = "UPDATE menu_tb SET menu_name=:menu_name,menu_img=:menu_img,menu_tag=:menu_tag,price=:price,limit_shop=:limit_shop WHERE menuid=:menuid", nativeQuery = true)
	int updateMenu(@Param("menu_name") String menu_name,
			@Param("menu_img") String menu_img,
			@Param("menu_tag") String menu_tag, @Param("price") String price,
			@Param("limit_shop") Integer limit_shop,
			@Param("menuid") Integer menuid);

}
