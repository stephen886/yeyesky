package com.qingniu.test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestJDBC {
	public static void main(String[] args) {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext-all.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext
				.getBean("sqlSessionFactory");

		SqlSession session = sqlSessionFactory.openSession();
//		UserMapper usermap=session.getMapper(UserMapper.class);
//		System.out.println(usermap.findById(2));
//		JiKeUser temp = (JiKeUser) session.selectOne("findById",2);// 单行查询
//		System.out.println(temp.toString());
		
//		User user=new User();
//		user.setRegisterDate(new Date());
//		user.setEmail("565756@qq.com");
//		user.setUsername("sfdskfl");
//		user.setPhone("1235");
//		user.setPassword("dfdgtrgtrh");
//		usermap.addUser(user);
		
		session.commit();//事务提交
	}

}
