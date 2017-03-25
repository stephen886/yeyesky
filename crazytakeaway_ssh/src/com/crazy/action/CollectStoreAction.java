package com.crazy.action;


import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.crazy.domain.Store;
import com.crazy.domain.StoreCollect;

/**
 * 
* @direction 
* @author 霍元甲
* @creation 2016年11月8日
 */

@Controller("collectStoreAction")
@Scope("prototype")
public class CollectStoreAction extends BaseAction<StoreCollect> {
	private static final long serialVersionUID = 1L;

	/**
	 * 收藏商店
	 * 
	 * @throws Exception
	 */
	public void collectStore() throws Exception {
		int res = collectService.collectStore(model.getStore_id());
		PrintJsonString(res);
	}

	/**
	 * 取消收藏商店
	 * 
	 * @throws Exception
	 */
	public void collectCanel() throws Exception {
		int res = collectService.canelcollectStore(model.getStore_id());
		PrintJsonString(res);
	}
	
	
	/**
	 * 拿到收藏的数据
	 * 
	 * @throws Exception
	 */
	public String collectGetStore() throws Exception {
		System.out.println("方法执行了");
		List<Store> storelist = collectService.getCStore();
		request.put("storelist",storelist);
		return SUCCESS;
	}

}
