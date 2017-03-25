package com.qingniu.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qingniu.pojo.Good;

@Controller("productAction")
@Scope("prototype")
public class ProductAction extends BaseAction<Good> {
	private static final long serialVersionUID = 1L;

	// 通过商品ID来浏览
	public String view() {
		int goodID = model.getGoodID();
		request.put("good", productService.getGoodByID(goodID));
		request.put("goods", guessYouLoveService.guessYouLove(8));
		return SUCCESS;
	}

	
	
	//坑爹购物车
	public void getCartNum() {}

}
