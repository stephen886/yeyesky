package com.crazy.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.crazy.domain.Order;

public interface IStoreOrderDao extends JpaRepository<Order, Integer> {

	List<Order> getByStoreIDAndStatus(Integer storeID, Integer status);

	@Modifying
	@Query(value = "UPDATE order_tb SET order_tb.`status`='1',order_tb.finished_time=:finished_time WHERE order_tb.tradeid=:order_id", nativeQuery = true)
	int updateOrder(@Param("order_id") Integer order_id,@Param("finished_time") Date finished_time);
}
