package com.crazy.service.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Store;
import com.crazy.domain.StoreAdress;
import com.crazy.repository.IStoreInfoDao;
import com.crazy.service.IStoreInfoService;

@Service("storeInfoService")
public class StoreInfoService implements IStoreInfoService {

	@Autowired
	public IStoreInfoDao storeInfoDao;

	@Override
	public Store getByStoreID(Integer storeID) {
		// TODO Auto-generated method stub
		return storeInfoDao.getByStoreID(storeID);
	}

	@Transactional
	@Override
	public int updateStore(String storename, String store_img,
			Integer start_price, Integer express_free, String contact,
			Integer storeid, String province, String city, String district,
			String street) {
		int resInfo = storeInfoDao.updateStoreInfo(storename, store_img,
				start_price, express_free, contact, storeid);

		int resAdress = storeInfoDao.updateStoreAdress(province, city,
				district, street, storeid);

		int result = (resInfo > 0 && resAdress > 0) ? 1 : -1;
		return result;
	}
}
