package com.qingniu.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class testOrder {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-all.xml");
//		IOrderService orderService = (IOrderService) applicationContext.getBean("orderService");
//		orderService.createOrder(32);
		
//		Order aa = orderService.queryOrder(3);
//		System.out.println(aa.toString());
	}

}
