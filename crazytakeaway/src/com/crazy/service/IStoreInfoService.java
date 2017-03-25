package com.crazy.service;

import org.springframework.data.repository.query.Param;

import com.crazy.domain.Store;
import com.crazy.domain.StoreAdress;

public interface IStoreInfoService {

	public Store getByStoreID(Integer storeID);

	public int updateStore(String storename, String store_img,
			Integer start_price, Integer express_free, String contact,
			Integer storeid, String province, String city, String district,
			String street);

}
