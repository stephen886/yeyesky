package com.crazy.service;

import java.util.List;

import com.crazy.domain.Order;

public interface IStoreOrderService {

	List<Order> getByStoreIDAndStatus(Integer storeID,Integer status);
	
	public int updateOrder(Integer order_id);
}
