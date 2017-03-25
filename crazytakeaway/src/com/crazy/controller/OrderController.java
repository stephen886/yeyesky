package com.crazy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crazy.service.IOrderService;
import com.crazy.service.IShopcartService;
import com.crazy.service.IUserService;
import com.crazy.service.imple.StoreService;

@Controller
public class OrderController {

	@Autowired
	private IShopcartService shopcartService;
	@Autowired
	private IUserService userService;
	@Autowired
	protected HttpSession httpSession;
	@Autowired
	private StoreService storeService;
	@Autowired
	private IOrderService orderService;

	// 预览订单
	@RequestMapping("/orderpreview")
	public String preview(Integer storeid, Model model) {
		if (userService.isLogin(httpSession)) {
			int userid = userService.getUserID(httpSession);
			model.addAttribute("cartlist",shopcartService.getMenulist(storeid, userid));
			model.addAttribute("store", storeService.getStore(storeid));
			model.addAttribute("totalPrice",orderService.totalPrice(storeid, userid));
		}
		return "order";
	}

	// 生成订单
	@ResponseBody
	@RequestMapping("/ordergenerate")
	public int generate(Integer storeid) {
		if (userService.isLogin(httpSession)) {
			int userid = userService.getUserID(httpSession);
			orderService.createOrder(storeid, userid);
			return 1;
		}
		return 0;
	}
	
	
	//查看订单
	@RequestMapping("/orderview")
	public String view(Model model) {
		if (userService.isLogin(httpSession)) {
			int userid = userService.getUserID(httpSession);
			model.addAttribute("orderlist", orderService.viewOrder(userid));
		}
		return "userorder";
	}
	

}
