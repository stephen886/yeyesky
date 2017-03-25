package com.crazy.dao.imple;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.crazy.dao.IUserDao;
import com.crazy.domain.User;

@SuppressWarnings("unchecked")
@Repository("userDao")
public class UserDao extends BaseDao<User> implements IUserDao {

	@Override
	public User getUser(String username) {
		Session session = this.getSession();
		Query query = session
				.createQuery("from User us where us.user_name=:name");
		query.setString("name", username);
		User user = (User) query.uniqueResult();
		return user;
	}

	@Override
	public User getUserEmail(String email) {
		Session session = this.getSession();
		Query query = session.createQuery("from User us where us.email=:email");
		query.setString("email", email);
		User user = (User) query.uniqueResult();
		return user;
	}

}
