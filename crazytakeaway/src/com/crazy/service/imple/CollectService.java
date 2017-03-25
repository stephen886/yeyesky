package com.crazy.service.imple;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Store;
import com.crazy.domain.StoreCollect;
import com.crazy.repository.ICollectStoreDao;
import com.crazy.repository.IStoreDao;
import com.crazy.service.ICollectService;

@Service("collectService")
public class CollectService implements ICollectService {

	@Autowired
	private ICollectStoreDao collectStoreDao;
	@Resource
	private IStoreDao storeDao;

	@Override
	public int collectStore(Integer storeid, Integer userid) {
		collectStoreDao.save(new StoreCollect(storeid, userid));
		return 1;
	}

	@Transactional
	@Override
	public int canelcollectStore(Integer storeid, Integer userid) {
		System.out.println("用户：" + userid + "商家" + storeid);
		collectStoreDao.delCollectStore(storeid, userid);
		// collectStoreRepository.delCollect(userid, storeid);
		return 1;
	}

	@Override
	public long countcollectStore(int storeid) {
		return collectStoreDao.countByStoreID(storeid);
	}

	@Override
	public int iscollectStore(int storeid, int userid) {
		List<StoreCollect> colect = new ArrayList<StoreCollect>();
		colect = collectStoreDao.findByStoreIDAndUserID(storeid, userid);
		if (colect.size() > 0) {
			return colect.get(0).getID();
		}
		return 0;
	}

	@Override
	public List<Store> getCStore(int userid) {
		List<StoreCollect> sc = collectStoreDao.findByUserID(userid);
		List<Store> storeList = new ArrayList<Store>();
		for (StoreCollect scollect : sc) {
			Store store = storeDao.getByStoreID(scollect.getStoreID());
			storeList.add(store);
			System.out.println(store.toString());
		}
		return storeList;
	}

}
