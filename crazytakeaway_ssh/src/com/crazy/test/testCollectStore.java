package com.crazy.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.crazy.dao.imple.CollectStoreDao;
import com.crazy.domain.StoreCollect;

public class testCollectStore {

	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		CollectStoreDao collectStoreDao = (CollectStoreDao) applicationContext.getBean("collectStoreDao");
		
		StoreCollect collect=new StoreCollect();
		collect.setStore_id(1);
		collect.setUser_id(2);
//		int aa = collectStoreDao.collectStore(collect);
//		System.out.println(aa);
//		
//		collectStoreDao.canalcollectStore(collect);
//		
		int aaaa = collectStoreDao.iscollect(collect);

		System.out.println("结果是:"+aaaa);
		
		
		

	}

}
