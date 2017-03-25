package com.crazy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crazy.domain.Store;
import com.crazy.service.ICollectService;
import com.crazy.service.IUserService;
import com.crazy.service.imple.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ICollectService collectService;
	@Autowired
	private IUserService userService;

	@RequestMapping("/storesearch")
	public ModelAndView storesearch(String adress,HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView("storesearch");
		httpSession.setAttribute("adress", adress);
		Map<String, Object> result = storeService.searchStoe(adress, 1);
		modelAndView.addObject("storelist",result.get("storelist"));
		int totalpage=(int) result.get("totalpage");
		modelAndView.addObject("totalpage", totalpage);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/storesearchJson")
	public List<Store> storesearchJson(String adress, Integer page) {
		int pageno = (page == null) ? 2 : page;
		Map<String, Object> result = storeService.searchStoe(adress, pageno);
		return (List<Store>) result.get("storelist");
	}

	@RequestMapping("/storeview")
	public ModelAndView storeview(Integer store_id, HttpSession httpSession) {
		ModelAndView modelAndView = new ModelAndView("storeview");
		modelAndView.addObject("store", storeService.getStore(store_id));
		// 去拿收藏商店的状态数据
		modelAndView.addObject("countCollect",collectService.countcollectStore(store_id));
		// 该用户是否登录
		modelAndView.addObject("StoreCollectID", -1);
		if (userService.isLogin(httpSession)) {
			int collectid = collectService.iscollectStore(store_id, userService.getUser(httpSession).getUserID());
			String StoreCollectColor = (collectid == -1 || collectid == 0) ? "gray": "red";
			modelAndView.addObject("StoreCollectColor", StoreCollectColor);
			modelAndView.addObject("StoreCollectID", collectid);
		}
		return modelAndView;
	}

}
