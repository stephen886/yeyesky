package com.crazy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.crazy.domain.Store;

public interface IStoreDao extends JpaRepository<Store, Integer> {

	List<Store> getByStorenameLike(String storename);


	List<Store> findByStoreAdress_District(String district);

	Store getByStoreID(Integer storeID);

}
