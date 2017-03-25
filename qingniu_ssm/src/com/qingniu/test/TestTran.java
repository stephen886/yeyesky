package com.qingniu.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.qingniu.pojo.User;
/**
 * 事务测试
 * @author wsdhr
 *
 */
public class TestTran {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String resource = "mybatisConfig.xml";
		Reader reader = null;
		SqlSession session;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder()
				.build(reader);
		session = sqlMapper.openSession(false);//不使用自动提交
		try{
			User user=new User();
			user.setEmail("565656@qq.com");
			user.setUsername("sfdskfl");
			session.insert("insertUser",user);
			System.out.println("新加入的user id="+user.getUserid());
			
//			Author at=new Author();
//			at.setJikeUser(one);
//			at.setRealName("uuuop");
//			session.insert("insertAuthor", at);
			session.commit();//事务提交

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
