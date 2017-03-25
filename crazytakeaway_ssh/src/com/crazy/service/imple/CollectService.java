package com.crazy.service.imple;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crazy.dao.ICollectStoreDao;
import com.crazy.dao.IStoreDao;
import com.crazy.domain.Store;
import com.crazy.domain.StoreCollect;
import com.crazy.service.ICollectService;
import com.crazy.utils.Sessions;

@Service("collectService")
public class CollectService implements ICollectService {
	@Resource
	private ICollectStoreDao collectStoreDao;
	@Resource
	private IStoreDao storeDao;

	// 约定，返回-1表示用户没有登录
	@Override
	public int collectStore(int storeid) {
		if (Sessions.isLogin()) {
			int userid = Sessions.getUser().getUser_id();
			return collectStoreDao.save(new StoreCollect(storeid,userid));
		}
		return -1;
	}

	@Override
	public int canelcollectStore(int storeid) {
		if (Sessions.isLogin()) {
			int userid = Sessions.getUser().getUser_id();
			return collectStoreDao.canalcollectStore(new StoreCollect(storeid,
					userid));
		}
		return -1;

	}

	@Override
	public int countcollectStore(int storeid) {
		return collectStoreDao.countcollect(storeid);
	}

	@Override
	public int iscollectStore(int storeid) {
		if (Sessions.isLogin()) {
			int userid = Sessions.getUser().getUser_id();
			return collectStoreDao.iscollect(new StoreCollect(storeid, userid));
		}
		return -1;
	}

	
	

	public void setCollectStoreDao(ICollectStoreDao collectStoreDao) {
		this.collectStoreDao = collectStoreDao;
	}

	@Override
	public List<Store> getCStore() {
		int userid=1;
		if (Sessions.isLogin()) {
			userid = Sessions.getUser().getUser_id();
		}
		List<StoreCollect> sc = collectStoreDao.getcollect(userid);
		List<Store> storeList=new ArrayList<Store>();
		for(StoreCollect scollect:sc){
			Store store=storeDao.get(scollect.getStore_id());
			storeList.add(store);
			System.out.println(store.toString());
		}
		return storeList;
	}

}
