package com.crazy.service.imple;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crazy.domain.Order;
import com.crazy.domain.OrderDetails;
import com.crazy.domain.ReceiverAdress;
import com.crazy.domain.Shopcart;
import com.crazy.domain.User;
import com.crazy.repository.IOrderDao;
import com.crazy.service.IOrderService;
import com.crazy.service.IShopcartService;
import com.crazy.service.IUserService;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private IShopcartService shopcartService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private IOrderDao orderDao;
	@Autowired
	private IUserService userService;

	@Override
	public double totalPrice(int storeid, int userid) {
		List<Shopcart> cartlist = shopcartService.getMenulist(storeid, userid);
		double count = 0;
		for (Shopcart sc : cartlist) {
			count = count + sc.getAmount() * sc.getPrice();
		}
		return count + storeService.getStore(storeid).getExpressFree();
	}

	@Transactional
	@Override
	public int createOrder(int storeid, int userid) {
		Order order = new Order();
		order.setUserID(userid);
		order.setStoreID(storeid);
		order.setOrderTime(new Date());
		order.setFinishedTime(new Date());// 模拟
		order.setStatus(0);// 模拟
		Set<OrderDetails> orderDetails = new HashSet<OrderDetails>();
		// 订单项详细内容解析
		List<Shopcart> cartlist = shopcartService.getMenulist(storeid, userid);
		for (Shopcart sc : cartlist) {
			OrderDetails od = new OrderDetails();
			od.setAmount(sc.getAmount());
			od.setMenu(sc.getMenu());
			String oprice = sc.getMenu().getPrice();
			od.setOriginal_price(Integer.valueOf(oprice));
			od.setRealPrice(sc.getPrice());
			orderDetails.add(od);
		}
		order.setOrderDetails(orderDetails);
		
		
		//收货地址
		ReceiverAdress recAdress=new ReceiverAdress();
		recAdress.setCity("广州市");
		recAdress.setProvince("广东省");
		recAdress.setDistrict("天河区");
		recAdress.setStreet("金州南路22号");
		recAdress.setDistrict("黄埔区");
		recAdress.setPhone("15202326865");
		recAdress.setUser(userService.getUser(userid));
		order.setRecAdress(recAdress);
		orderDao.saveAndFlush(order);
		shopcartService.clear(storeid, userid);// 清空购物车
		return 1;
	}

	@Override
	public List<Order> viewOrder(int userid) {
		List<Order> orderlist = orderDao.findByUserID(userid);
		for (Order order : orderlist) {
			int storeid = order.getStoreID();
			int status=order.getStatus();
			String statu=(status==1)?"已完成":"未完成";
			order.setStatu(statu);
			order.setStoreName(storeService.getStore(storeid).getStorename());
			Set<OrderDetails> details = order.getOrderDetails();
			Iterator<OrderDetails> it = details.iterator();
			double price=0;
			while (it.hasNext()) {  
				OrderDetails detail=it.next();
				price=price+detail.getRealPrice();
			}  
			order.setPrice(price);
		}
		return orderlist;
	}

}
