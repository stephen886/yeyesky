package com.qingniu.test;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qingniu.dao.GoodMapper;
import com.qingniu.pojo.Good;

public class GoodMapperTest {
	
	
	
	

	@Test
	public void testFindByID() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-all.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
		SqlSession session = sqlSessionFactory.openSession(false);//不使用自动提交
		GoodMapper goodDao=session.getMapper(GoodMapper.class);
		List<Good> goods = goodDao.findGoodByName("%鱼%");
		for(Good good:goods){
			System.out.println(good.getPreviews());
		}
	}

}
