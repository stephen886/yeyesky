package com.qingniu.service;

import java.util.List;

import com.qingniu.pojo.Good;

public interface IGuessYouLoveService {

	/**
	 * 
	 * @param amount表示数量
	 * @return
	 */
	List<Good> guessYouLove(int amount);

}
