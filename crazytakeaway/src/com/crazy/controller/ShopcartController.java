package com.crazy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crazy.domain.Shopcart;
import com.crazy.domain.ShopcartUtils;
import com.crazy.service.IShopcartService;
import com.crazy.service.IUserService;

@Controller
public class ShopcartController  {
	@Autowired
	private IShopcartService shopcartService;
	@Autowired
	private IUserService userService;
	@Autowired
	protected HttpSession httpSession;

	// 用户向购物车增加菜单
	@RequestMapping("/shopCartaddMenu")
	@ResponseBody
	public int addMenu(ShopcartUtils model) throws Exception {
		if(userService.isLogin(httpSession)){
			model.setUserid(userService.getUserID(httpSession));
			return shopcartService.addMenu(model);
		}
		return -1;
	}

	// 拿到购物车数据
	@RequestMapping("/shopCartgetMenu")
	@ResponseBody
	public List<Shopcart> getMenu(Integer storeid) {
		if(userService.isLogin(httpSession))
		   return shopcartService.getMenulist(storeid, userService.getUserID(httpSession));
		return null;
	}

	// 用户向购物车删除菜单
	@RequestMapping("/shopCartdelMenu")
	@ResponseBody
	public int delMenu(Integer menu_id) throws Exception {
		if(userService.isLogin(httpSession)){
			int userid=userService.getUserID(httpSession);
			return shopcartService.delMenu(userid, menu_id);
		}
		return -1;
	}

	// 用户向购物车修改菜单
	@RequestMapping("/shopCartupdateMenu")
	@ResponseBody
	public int updateMenu(ShopcartUtils model) {
		if(userService.isLogin(httpSession)){
			int userid=userService.getUserID(httpSession);
			return shopcartService.updateMenu(model.getAmount(), userid, model.getMenuid());
		}
		return -1;
	}

	// 清空
	@RequestMapping("/shopCartclearAll")
	@ResponseBody
	public int clearAll(int storeid){
		if(userService.isLogin(httpSession)){
			int userid=userService.getUserID(httpSession);
			return shopcartService.clear(storeid,userid);
		}
		return -1;
	}

}
