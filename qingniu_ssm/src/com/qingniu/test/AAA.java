package com.qingniu.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qingniu.dao.GoodMapper;
import com.qingniu.pojo.Good;
import com.qingniu.pojo.GoodParameter;
import com.qingniu.pojo.GoodPreview;

public class AAA {

	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-all.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
		SqlSession session = sqlSessionFactory.openSession(false);//不使用自动提交
//		GoodMapper goodDao=session.getMapper(GoodMapper.class);
//		System.out.println(goodDao.findByName("%鱼%"));
		
		//参数测试
//		GoodParameter param=session.selectOne("findParambyID", 1);//单行查询
//		System.out.println(param);
		//预览图片
//		List<GoodPreview> param=session.selectList("findPreviewbyGoodID", 41);
//		System.out.println(param);
		//查询产品
		GoodMapper goodDao=session.getMapper(GoodMapper.class);
		Good param = goodDao.findGoodByID(41);
		
		System.out.println(param);
	}

}
