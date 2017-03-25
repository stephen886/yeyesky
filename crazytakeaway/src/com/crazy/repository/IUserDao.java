package com.crazy.repository;

import org.springframework.data.repository.CrudRepository;

import com.crazy.domain.User;

/**
 * 
 * @direction 与用户有关的持久层
 * @author 霍元甲
 * @creation 2016年11月8日
 */
public interface IUserDao extends CrudRepository<User, Integer> {

	/**
	 * 根据用户名得到一个user
	 * 
	 * @param us
	 * @return
	 */
	User getByUserName(String username);

	/**
	 * 根据email得到一个user
	 * 
	 * @param us
	 * @return
	 */
	User getByEmail(String email);
	
	User getByUserID(int userid);

}
