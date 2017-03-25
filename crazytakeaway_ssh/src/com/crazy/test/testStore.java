package com.crazy.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.crazy.dao.imple.StoreDao;
import com.crazy.domain.Store;

public class testStore {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		StoreDao storeDao = (StoreDao) applicationContext.getBean("storeDao");
		
//		storeDao.getStoreByname("���ֺ���(������)");
		
		List<Store> aa =storeDao.getStoreByname("番禺区");
		for (Store sto : aa) {
			System.out.println("-------------------");
			System.out.println(sto.getMenulist().toString());
			System.out.println("aa"+sto.toString());
		}
//		StoreAdress storeAD=new StoreAdress();
//		storeAD.setStore_id(2);
//		storeDao.getStoreByAdress(storeAD);

	}

}
