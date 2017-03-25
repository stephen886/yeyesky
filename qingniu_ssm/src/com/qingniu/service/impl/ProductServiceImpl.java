package com.qingniu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingniu.dao.GoodMapper;
import com.qingniu.pojo.Good;
import com.qingniu.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService {

	@Resource
	GoodMapper goodDao;

	@Override
	public Good getGoodByID(int goodid) {
		Good good = goodDao.findGoodByID(goodid);
		//不正常的填充数据
		if(good.getDetails().isEmpty()){
			good.setDetails(goodDao.findGoodByID(41).getDetails());
		}
		return goodDao.findGoodByID(goodid);
	}

}
