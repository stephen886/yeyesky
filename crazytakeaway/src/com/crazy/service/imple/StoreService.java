package com.crazy.service.imple;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crazy.domain.Store;
import com.crazy.repository.IStoreDao;
import com.crazy.service.ISolrSearch;
import com.crazy.service.IStoreService;

/**
 * 与商店有关的业务的实现
 * 
 * @author asus
 * 
 */
@Service("storeService")
public class StoreService implements IStoreService {
	@Autowired
	private IStoreDao storeDao;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ISolrSearch solrSearch;

	@Override
	public Map<String,Object> searchStoe(String adress,int page) {
		String AD = adress;
		// 判断传递的是地址还是商家名称
		int service = 0;// 操作类型0,按地址查找，1按商店名称查找
		int a = adress.indexOf("市");
		if (a == -1) {
			int b = adress.indexOf("区");
			if (b == -1) {
				// 传递进来的是商店名称
				service = 1;
			} else {
				service = 0;
			}
		}

	
		Map<String, Object> stolist =new HashMap<String, Object>();
		if (service == 0) {
			// 对地址进行处理
			int i = adress.indexOf("市");
			int j = adress.indexOf("区");
			if (j != -1 && j > i && j < adress.length()) {
				adress = adress.substring(i + 1, j + 1);
			} else {
				adress = adress.substring(i + 1);
			}
//			 stolist = storeDao.findByStoreAdress_District(adress);
			stolist = solrSearch.searchByadress(adress,page);
			int c = AD.indexOf("省");
			AD = AD.substring(c + 1);
			// 如果地址长度太长，截断一部分
			if (AD.length() > 12) {
				AD = AD.substring(0, 8);
			}
			httpSession.setAttribute("adress", AD);
			// ActionContext.getContext().getSession().put("adress", AD);
		}

		if (service == 1) {
			String dizhi = null;
			dizhi = (String) httpSession.getAttribute("adress");
			if (dizhi == null) {
				dizhi = "广州市";
				httpSession.setAttribute("adress", dizhi);
				// ActionContext.getContext().getSession().put("adress", dizhi);
			}

//			stolist = storeDao.getByStorenameLike(adress);
			//如果你不是使用solr服务器，请把这句注释掉，并启用上一句代码
			stolist = solrSearch.searchByname(adress,page);
		}
		return stolist;

	}

	@Override
	public Store getStore(int storeID) {
		return storeDao.getByStoreID(storeID);
	}

}
