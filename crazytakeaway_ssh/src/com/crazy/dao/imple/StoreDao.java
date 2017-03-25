package com.crazy.dao.imple;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.crazy.dao.IStoreDao;
import com.crazy.domain.Store;
@Repository("storeDao")
public class StoreDao extends BaseDao<Store> implements IStoreDao {

	@Override
	public List<Store> getStoreByAdress(String district,int pageNo,int pageSize) {
		List<Store> storelist = new ArrayList<Store>();

		Session session = this.getSession();
//		String hql = "from Store s,StoreAdress ad where s.store_id=ad.store_id and ad.district=:district";
		String hql = "from Store s,StoreAdress ad where s.store_id=ad.store_id and ad.district=:district";
		Query query = session.createQuery(hql);
		query.setString("district", district);
		query.setFirstResult(pageNo).setMaxResults(pageSize);
		List result = query.list();
		Iterator it = result.iterator();
		while (it.hasNext()) {
			Object[] tuple = (Object[]) it.next();
			Store store = (Store) tuple[0];
			storelist.add(store);
		}
		return storelist;
	}

	@Override
	public List<Store> getStoreByname(String name) {
		List<Store> storelist = new ArrayList<Store>();
		Session session = this.getSession();
		String hql = "from Store s where s.store_name like ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "%" + name + "%");
		storelist = query.list();
		return storelist;
	}

	

}
