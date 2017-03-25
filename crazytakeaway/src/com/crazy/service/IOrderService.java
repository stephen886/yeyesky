package com.crazy.service;

import java.util.List;

import com.crazy.domain.Order;

public interface IOrderService {

	public double totalPrice(int storeid ,int userid);
	
	public int  createOrder(int storeid ,int userid);
	
	public List<Order>  viewOrder(int userid);
}
