package com.crazy.service;

import java.util.List;

import com.crazy.domain.Shopcart;
import com.crazy.domain.ShopcartUtils;

public interface IShopcartService {

	/**
	 * 增加菜单到购物车
	 * 
	 * @param shopcart
	 * @return
	 */
	public int addMenu(ShopcartUtils shopcartUtils);

	public List<Shopcart> getMenulist(int storeid, int userid);

	public int delMenu(int userid, int menu_id);

	public int updateMenu(int amount, int userid, int menu_id);

	public int clear(int storeid, int userid);
}
