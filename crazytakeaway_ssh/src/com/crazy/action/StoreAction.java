package com.crazy.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.crazy.domain.Store;

/**
 * 
 * @direction
 * @author 霍元甲
 * @creation 2016年11月8日
 */
@Controller("storeAction")
@Scope("prototype")
public class StoreAction extends BaseAction<Store> {
	private static final long serialVersionUID = 1L;

	// 通过地址或商店名称搜索
	public String search() throws UnsupportedEncodingException {
		request.put("storelist", storeService.searchStoe(model.getAdress()));
		return SUCCESS;
	}

	// 通过商店ID来浏览商店
	public String view() {
		int StoreID = model.getStore_id();
		request.put("store", storeService.getStore(StoreID));
		// 去拿收藏商店的状态数据
		request.put("countCollect", collectService.countcollectStore(StoreID));
		int collectid = collectService.iscollectStore(StoreID);
		String StoreCollectColor = (collectid == -1 || collectid == 0) ? "gray"
				: "red";
		request.put("StoreCollectColor", StoreCollectColor);
		request.put("StoreCollectID", collectid);
		return SUCCESS;
	}

	// 分页显示
	public void test() throws IOException {
		System.out.println("方法执行");

		storeService.getStoreByname();
		this.PrintJsonString("成功了");
	}

}
