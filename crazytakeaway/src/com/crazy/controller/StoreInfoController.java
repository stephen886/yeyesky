package com.crazy.controller;

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
import com.crazy.domain.StoreAdress;
import com.crazy.domain.StoreUser;
import com.crazy.service.IStoreInfoService;
import com.crazy.service.IStoreUserService;
import com.crazy.utils.uploadUtils;

@Controller
public class StoreInfoController {

	@Autowired
	private IStoreInfoService storeInfoService;
	@Autowired
	private IStoreUserService storeUserService;
	@Autowired
	protected HttpSession httpSession;
	@Autowired
	protected HttpServletRequest request;

	@ResponseBody
	@RequestMapping(value = "admin/getStoreInfo")
	public ModelAndView getStoreInfo(Integer StoreID) {
		ModelAndView modelAndView = new ModelAndView("admin/info");
		if (storeUserService.isLogin(httpSession)) {
			StoreUser storeUser = storeUserService.getStoreUser(httpSession);
			Store store = storeInfoService.getByStoreID(storeUser.getStore()
					.getStoreID());
			modelAndView.addObject("storeinfo", store);
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "admin/updateStoreInfo")
	public ModelAndView addMenu(Store store, StoreAdress storeAdress,
			@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView = new ModelAndView("admin/fail");
		if (storeUserService.isLogin(httpSession)) {
			String imgName = uploadUtils.uploadImg(file, request,
					"img/store_img");
			if (!imgName.equals("fail")) {
				String storename = store.getStorename();
				String store_img= imgName;
				Integer start_price= store.getStartPrice();
				Integer express_free= store.getExpressFree();
				String contact= store.getContact();
				Integer storeid= store.getStoreID();
				String province= storeAdress.getProvince();
				String city= storeAdress.getCity();
				String district= storeAdress.getDistrict();
				String street= storeAdress.getStreet();
				
				int res = storeInfoService.updateStore(storename, store_img,
						start_price, express_free, contact, storeid, province,
						city, district, street);
				if (res == 1) {
					modelAndView.setViewName("admin/success");
				}
			}

		} else {
			modelAndView.setViewName("adminlogin");
		}
		return modelAndView;

	}

}
