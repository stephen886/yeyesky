package com.crazy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crazy.domain.Store;
import com.crazy.service.ICollectService;
import com.crazy.service.IUserService;

@Controller
public class StoreCollectController {

	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ICollectService collectService;
	@Autowired
	private IUserService userService;

	// 收藏商店
	@ResponseBody
	@RequestMapping(value = "/collectStore", method = RequestMethod.GET)
	public int collectStore(Integer store_id) {
		if (userService.isLogin(httpSession)) {
			collectService.collectStore(store_id, userService
					.getUser(httpSession).getUserID());
			return 1;
		}
		return -1;
	}

	// 取消收藏商店
	@ResponseBody
	@RequestMapping(value = "/collectCanel", method = RequestMethod.GET)
	public int collectCanel(@RequestParam("store_id") Integer store_id) {
		if (userService.isLogin(httpSession)) {
			collectService.canelcollectStore(store_id,
					userService.getUser(httpSession).getUserID());
			return 1;
		}
		return -1;
	}

	// 拿到收藏的数据
	@RequestMapping(value = "/collectGetStore", method = RequestMethod.GET)
	public String collectGetStore(Model model) {
		if (userService.isLogin(httpSession)) {
			List<Store> storelist = collectService.getCStore(userService.getUser(
					httpSession).getUserID());
			model.addAttribute("storelist", storelist);
		}
		return "userCollectStore";
	}

}
