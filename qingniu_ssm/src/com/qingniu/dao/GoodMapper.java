package com.qingniu.dao;

import java.util.List;

import com.qingniu.pojo.Good;
import com.qingniu.pojo.GoodPreview;

public interface GoodMapper {

	List<Good> findGoodByName(String name);

	Good findGoodByID(int goodID);
	
	List<GoodPreview> findPreviewbyGoodID(int goodID);

}
