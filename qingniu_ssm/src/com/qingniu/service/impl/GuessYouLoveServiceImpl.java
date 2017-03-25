package com.qingniu.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingniu.dao.GoodMapper;
import com.qingniu.pojo.Good;
import com.qingniu.service.IGuessYouLoveService;

@Service
public class GuessYouLoveServiceImpl implements IGuessYouLoveService {

	@Resource
	GoodMapper goodDao;

	@Override
	public List<Good> guessYouLove(int amount) {
		ArrayList<Good> pro = new ArrayList<Good>();
		ArrayList<Integer> indexlist = new ArrayList<Integer>();
		for (int i = 0; i < amount; i++) {
			int x = 1 + (int) (Math.random() * 40);
			if (!indexlist.contains(x)) {
				Good good = goodDao.findGoodByID(x);
				if (good != null) {
					pro.add(good);
				} else {
					i--;
				}
			}
		}
		return pro;
	}

}
