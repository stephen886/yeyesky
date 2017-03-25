package com.crazy.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.Store;

public interface IStoreInfoDao extends JpaRepository<Store, Integer> {

	Store getByStoreID(Integer storeID);

	@Modifying
	@Query(value = "UPDATE store_tb SET storename=:storename,store_img=:store_img,start_price=:start_price,express_free=:express_free,contact=:contact WHERE storeid=:storeid", nativeQuery = true)
	int updateStoreInfo(@Param("storename") String storename,
			@Param("store_img") String store_img,
			@Param("start_price") Integer start_price,
			@Param("express_free") Integer express_free,
			@Param("contact") String contact, @Param("storeid") Integer storeid);

	@Modifying
	@Query(value = "UPDATE store_adress_tb SET province=:province,city=:city,district=:district,street=:street WHERE storeid=:storeid", nativeQuery = true)
	int updateStoreAdress(@Param("province") String province,
			@Param("city") String city, @Param("district") String district,
			@Param("street") String street, @Param("storeid") Integer storeid);

}
