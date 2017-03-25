package com.crazy.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.crazy.domain.Menu;

public interface IStoreMenuService {

	public List<Menu> getMenusByStoreID(Integer StoreID);

	public int delMenuByMenuID(Integer MenuID);

	public int addMenu(Menu menu);

	public Menu getByMenuID(Integer menuID);

	public int updateMenu(String menu_name, String menu_img, String menu_tag,
			String price, Integer limit_shop, Integer menuid);
}
