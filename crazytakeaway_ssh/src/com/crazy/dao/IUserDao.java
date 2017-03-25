package com.crazy.dao;

import com.crazy.domain.User;
/**
 * 
* @direction  与用户有关的持久层
* @author 霍元甲
* @creation 2016年11月8日
 */
public interface IUserDao extends IBaseDao<User>{
	


	
	
	
	/**
	 * 根据用户名得到一个user
	 * 
	 * @param us
	 * @return
	 */
	public User getUser(String username);
	

	/**
	 * 根据email得到一个user
	 * 
	 * @param us
	 * @return
	 */
	public User getUserEmail(String email);
	
	
	
	

}
