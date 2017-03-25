package com.crazy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.crazy.domain.Menu;
import com.crazy.domain.Store;
import com.crazy.domain.StoreUser;
import com.crazy.service.IStoreMenuService;
import com.crazy.service.IStoreService;
import com.crazy.service.IStoreUserService;
import com.crazy.utils.uploadUtils;

@Controller
public class StoreMenuController {

	@Autowired
	private IStoreUserService storeUserService;
	@Autowired
	private IStoreMenuService storeMenuService;
	@Autowired
	private IStoreService storeService;
	@Autowired
	protected HttpSession httpSession;
	@Autowired
	protected HttpServletRequest request;

	@ResponseBody
	@RequestMapping(value = "admin/getMenulist")
	public ModelAndView getMenulist() {
		ModelAndView modelAndView = new ModelAndView("admin/list");
		if (storeUserService.isLogin(httpSession)) {
			StoreUser storeUser = storeUserService.getStoreUser(httpSession);
			Integer storeID = storeUser.getStore().getStoreID();
			modelAndView.addObject("menulist",
					storeMenuService.getMenusByStoreID(storeID));
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "admin/delMenu")
	public int delMenuByMenuID(Integer menuID) {
		int res = -1;
		if (storeUserService.isLogin(httpSession)) {
			res = storeMenuService.delMenuByMenuID(menuID);
		}
		return res;
	}

	@ResponseBody
	@RequestMapping(value = "admin/addMenu")
	public ModelAndView addMenu(Menu menu,
			@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView("admin/fail");
		if (storeUserService.isLogin(httpSession)) {
			String imgName = uploadUtils.uploadImg(file, request,
					"img/menu_img");
			if (!imgName.equals("fail")) {
				menu.setMenuImg(imgName);
				int StoreID = storeUserService.getStoreUser(httpSession)
						.getStore().getStoreID();
				Store store = storeService.getStore(StoreID);
				menu.setStore(store);
				int res = storeMenuService.addMenu(menu);
				if (res == 1) {
					modelAndView.setViewName("admin/success");
				}
			}

		} else {
			modelAndView.setViewName("adminlogin");
		}
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "admin/updateMenu")
	public ModelAndView updateMenu(Menu menu,
			@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView("admin/fail");
		if (storeUserService.isLogin(httpSession)) {
			String imgName = uploadUtils.uploadImg(file, request,
					"img/menu_img");
			if (!imgName.equals("fail")) {
				menu.setMenuImg(imgName);
				String menu_name = menu.getMenuName();
				Integer limit_shop = menu.getLimitShop();
				String menu_tag = menu.getMenuTag();
				String price = menu.getPrice();
				Integer menuid = menu.getMenuID();
				String menu_img = imgName;
				
				int res = storeMenuService.updateMenu(menu_name, menu_img,
						menu_tag, price, limit_shop, menuid);
				if (res > 0) {
					modelAndView.setViewName("admin/success");
				}
			}

		} else {
			modelAndView.setViewName("adminlogin");
		}
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "admin/getMenu")
	public ModelAndView getMenuByMenuID(Integer menuID) {
		ModelAndView modelAndView = new ModelAndView("admin/updatemenu");
		Menu menu = storeMenuService.getByMenuID(menuID);
		modelAndView.addObject("menu", menu);
		modelAndView.addObject("menuID",menuID);
		return modelAndView;

	}

}
