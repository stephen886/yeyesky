package com.crazy.service.imple;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crazy.dao.IStoreDao;
import com.crazy.domain.PageModel;
import com.crazy.domain.Store;
import com.crazy.domain.StorePage;
import com.crazy.service.IStoreService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 与商店有关的业务的实现
 * 
 * @author asus
 * 
 */
@Service("storeService")
public class StoreService implements IStoreService {
	@Resource
	private IStoreDao storeDao;

	@Override
	public List<Store> searchStoe(String adress) {
		String AD = adress;
		// 判断传递的是地址还是商家名称
		int service = 0;// 操作类型0,按地址查找，1按商店名称查找
		int a = adress.indexOf("市");
		if (a == -1) {
			int b = adress.indexOf("区");
			if (b == -1) {
				// 传递进来的是商店名称
				service = 1;
			} else {
				service = 0;
			}
		}

		List<Store> stolist = null;
		if (service == 0) {
			// 对地址进行处理
			int i = adress.indexOf("市");
			int j = adress.indexOf("区");
			System.out.println(i + "-" + j);
			System.out.println(adress.length());
			if (j != -1 && j > i && j < adress.length()) {
				adress = adress.substring(i + 1, j + 1);
			} else {
				adress = adress.substring(i + 1);
			}
			stolist = storeDao.getStoreByAdress(adress, 1, 12);
			int c = AD.indexOf("省");
			AD = AD.substring(c + 1);
			// 如果地址长度太长，截断一部分
			if (AD.length() > 12) {
				AD = AD.substring(0, 8);
			}
			ActionContext.getContext().getSession().put("adress", AD);
		}

		if (service == 1) {
			String dizhi = null;
			dizhi = (String) ActionContext.getContext().getSession()
					.get("adress");
			if (dizhi == null) {
				dizhi = "广州市";
				ActionContext.getContext().getSession().put("adress", dizhi);
			}
			stolist = storeDao.getStoreByname(adress);
		}
		return stolist;

	}

	@Override
	public Store getStore(int storeID) {
		return storeDao.get(storeID);
	}

	@Override
	public void getStoreByname() {

		String hql = "from Store s,StoreAdress ad where s.store_id=ad.store_id and ad.district='番禺区'";
		PageModel<Store> aa = storeDao.findPageList(hql, 1, 100);
		Iterator it = aa.getDatas().iterator();
		while (it.hasNext()) {
			Object[] tuple = (Object[]) it.next();
			Store store = (Store) tuple[0];
			System.out.println(store.toString());
		}
	}

}
