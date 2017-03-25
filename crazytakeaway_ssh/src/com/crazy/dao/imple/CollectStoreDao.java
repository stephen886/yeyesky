package com.crazy.dao.imple;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.crazy.dao.ICollectStoreDao;
import com.crazy.domain.StoreCollect;

@Repository("collectStoreDao")
public class CollectStoreDao extends BaseDao<StoreCollect> implements
		ICollectStoreDao {

	@Override
	public int canalcollectStore(StoreCollect collect) {
		Session session = this.getSession();
		int res = 1;
		try {
			// and s.store_id=?
			String Hsq = "delete from StoreCollect s where s.user_id=? and s.store_id=?";
			Query query = session.createQuery(Hsq);
			query.setParameter(0, collect.getUser_id());
			query.setParameter(1, collect.getStore_id());
			res = query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
		}
		return res;
	}

	@Override
	public int countcollect(int storeid) {
		Session session = this.getSession();
		int res = 1;
		try {
			String Hsq = "select  count(*) from  StoreCollect  sc where sc.store_id =:storeid";
			Query query = session.createQuery(Hsq);
			query.setInteger("storeid", storeid);
			Long rows = (Long) query.uniqueResult();
			long a = Long.valueOf(rows);
			res = (int) a;
		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
		}
		return res;
	}

	@Override
	public int iscollect(StoreCollect collect) {
		Session session = this.getSession();
		int res = 0;
		try {
			// and s.store_id=?
			String Hsq = "from StoreCollect s where s.user_id=? and s.store_id=?";
			Query query = session.createQuery(Hsq);
			query.setParameter(0, collect.getUser_id());
			query.setParameter(1, collect.getStore_id());
			// 拿数据之前先判断数据是否为空
			StoreCollect storeCollect = (StoreCollect) query.uniqueResult();
			if (storeCollect != null) {
				return storeCollect.getStore_collect_id();
			}

		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
		}
		return res;
	}

	@Override
	public List<StoreCollect> getcollect(int UserID) {
		Session session = this.getSession();
		int res = 0;
		try {
			// and s.store_id=?
			String Hsq = "SELECT s from StoreCollect s where s.user_id=?";
			Query query = session.createQuery(Hsq);
			query.setParameter(0, UserID);
			List<StoreCollect> sc = query.list();
			return sc;
		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
		}
		return null;
	}

}
