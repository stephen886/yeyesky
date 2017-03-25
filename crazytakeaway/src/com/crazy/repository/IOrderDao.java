package com.crazy.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.crazy.domain.Order;
import com.crazy.domain.Shopcart;

public interface IOrderDao extends JpaRepository<Order, Integer> {
	List<Order> findByUserID(Integer userID);
}
