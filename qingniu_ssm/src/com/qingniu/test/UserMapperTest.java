package com.qingniu.test;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qingniu.dao.UserMapper;
import com.qingniu.pojo.User;

public class UserMapperTest {

	@Test
	public void test() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext-all.xml");
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
		SqlSession session = sqlSessionFactory.openSession(false);//不使用自动提交
		try{
			
			//查询
//			User temp = (User) session.selectOne("selectUsers", 1);// 单行查询
//			System.out.println(temp);
			UserMapper usermap=session.getMapper(UserMapper.class);
			//添加
//			User user=new User();
//			user.setEmail("565656@qq.com");
//			user.setUsername("sfdskfl");
//			user.setPassword("fgfgrtf");
//			usermap.addUser(user);
			//接口查询
			System.out.println(usermap.findbyUsername("auss"));
//			System.out.println(usermap.findbyEmail("565756@qq.com"));
			
			
			
			
			
			
			
			
//			session.insert("addUser",user);
//			System.out.println("新加入的user id="+user.getUserid());
//			
//			Author at=new Author();
//			at.setJikeUser(one);
//			at.setRealName("uuuop");
//			session.insert("insertAuthor", at);
//			session.commit();//事务提交

		}
		catch(Exception e)
		{
			e.printStackTrace();
			session.rollback();//回滚
		}
		finally
		{
			session.close();//关闭session
		}
	}

}
