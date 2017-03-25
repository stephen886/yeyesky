package com.crazy.service.imple;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Order;
import com.crazy.repository.IStoreOrderDao;
import com.crazy.service.IStoreOrderService;

@Service("storeOrderService")
public class StoreOrderService implements IStoreOrderService {

	@Autowired
	private IStoreOrderDao storeOrderDao;
	
	@Override
	public List<Order> getByStoreIDAndStatus(Integer storeID,Integer status) {
		// TODO Auto-generated method stub
		return storeOrderDao.getByStoreIDAndStatus(storeID, status);
	}

	@Transactional
	@Override
	public int updateOrder(Integer order_id) {
		// TODO Auto-generated method stub
		return storeOrderDao.updateOrder(order_id,new Date());
	}

}
