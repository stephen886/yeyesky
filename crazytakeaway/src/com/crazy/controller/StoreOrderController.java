package com.crazy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crazy.service.IStoreOrderService;
import com.crazy.service.IStoreUserService;

@Controller
public class StoreOrderController {

	@Autowired
	private IStoreOrderService storeOrderService;
	@Autowired
	private IStoreUserService storeUserService;
	@Autowired
	protected HttpSession httpSession;

	@ResponseBody
	@RequestMapping(value = "admin/getOrderlist")
	public ModelAndView getOrderlist() {
		ModelAndView modelAndView = new ModelAndView("admin/unfinish");
		if (storeUserService.isLogin(httpSession)) {
			Integer storeID = storeUserService.getStoreUser(httpSession)
					.getStore().getStoreID();
			modelAndView.addObject("orderlist",
					storeOrderService.getByStoreIDAndStatus(storeID, 0));
		}
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "admin/getOrderFinished")
	public ModelAndView getOrderFinished() {
		ModelAndView modelAndView = new ModelAndView("admin/finished");
		if (storeUserService.isLogin(httpSession)) {
			Integer storeID = storeUserService.getStoreUser(httpSession)
					.getStore().getStoreID();
			modelAndView.addObject("finishlist",
					storeOrderService.getByStoreIDAndStatus(storeID, 1));
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "admin/updateOrder")
	public int updateOrder(Integer order_id) {
		int result = -1;
		if (storeUserService.isLogin(httpSession)) {
			int res = storeOrderService.updateOrder(order_id);
			if (res > 0) {
				result = 1;
			}
		}
		return result;
	}

}
