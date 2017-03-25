package com.crazy.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Menu;
import com.crazy.repository.IStoreMenuDao;
import com.crazy.service.IStoreMenuService;

@Service("storeMenuService")
public class StoreMenuService implements IStoreMenuService {

	@Autowired
	private IStoreMenuDao storeMenuDao;

	@Override
	public List<Menu> getMenusByStoreID(Integer StoreID) {
		// TODO Auto-generated method stub
		return storeMenuDao.getByStore_StoreID(StoreID);
	}

	@Transactional
	@Override
	public int delMenuByMenuID(Integer MenuID) {
		// TODO Auto-generated method stub
		return storeMenuDao.delMenu(MenuID);
	}

	@Override
	public int addMenu(Menu menu) {
		int res = -1;
		Menu resMenu = storeMenuDao.save(menu);
		if (resMenu != null) {
			res = 1;
		}
		return res;
	}

	@Override
	public Menu getByMenuID(Integer menuID) {

		return storeMenuDao.getByMenuID(menuID);
	}

	@Transactional
	@Override
	public int updateMenu(String menu_name, String menu_img, String menu_tag,
			String price, Integer limit_shop, Integer menuid) {
		return storeMenuDao.updateMenu(menu_name, menu_img, menu_tag, price,
				limit_shop, menuid);
	}

}
