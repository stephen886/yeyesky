package com.crazy.service.imple;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Shopcart;
import com.crazy.domain.ShopcartUtils;
import com.crazy.repository.IMenuDao;
import com.crazy.repository.IShopcartDao;
import com.crazy.service.IShopcartService;

@Service("shopcartService")
public class ShopcartService implements IShopcartService {

	@Resource
	private IShopcartDao shopcartDao;
	@Resource
	private IMenuDao menuDao;

	@Override
	public int addMenu(ShopcartUtils scUtils) {
		shopcartDao.save(scUtils.toShopcart());
		return 1;

	}

	@Override
	public List<Shopcart> getMenulist(int storeid, int userid) {
		return shopcartDao.findByMenu_Store_StoreIDAndUserID(storeid, userid);
	}

	@Transactional
	@Override
	public int delMenu(int userid, int menu_id) {
		shopcartDao.delMenu(userid, menu_id);
		return 1;
	}

	@Transactional
	@Override
	public int updateMenu(int amount, int userid, int menu_id) {
		if (amount <= 0) {
			shopcartDao.delMenu(userid, menu_id);
		} else {
			shopcartDao.updateMenu(amount, userid, menu_id);
		}
		return 1;

	}

	@Transactional
	@Override
	public int clear(int storeid, int userid) {
		shopcartDao.clearAll(storeid, userid);
		return 1;
	}
}
