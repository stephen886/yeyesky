/**
 * 
 */
package com.crazy.dao.imple;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.crazy.dao.IBaseDao;
import com.crazy.domain.PageModel;

/**
 * 
 * @direction 公共的Dao的抽取注意，泛型类是不能实例化的
 * @author 霍元甲
 * @creation 2016年11月8日
 */

@SuppressWarnings("unchecked")
@Repository
@Lazy(true)
public class BaseDao<T> implements IBaseDao<T> {

	private Class<T> clazz;

	@Resource
	private SessionFactory sessionFactory;

	protected Session getSession() {
		// 从当前线程获取session，如果没有则创建一个新的session
		return sessionFactory.getCurrentSession();
	}

	public BaseDao() {
		// 通过反射机制获取子类传递过来的实体类的类型信息
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		this.clazz = (Class<T>) type.getActualTypeArguments()[0];

	}

	@Override
	public int save(T entity) {
		int res = 1;
		try {
			getSession().save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
		}
		return res;

	}

	@Override
	public void delete(int id) {
		getSession().delete(get(id));
	}

	@Override
	public void edit(T entity) {
		getSession().merge(entity);

	}

	@Override
	public T get(Integer id) {
		return (T) getSession().get(clazz, id);
	}

	@Override
	public T load(Integer id) {
		return (T) getSession().load(clazz, id);
	}

	@Override
	public List<T> findAll() {
		String hsql = "select t from " + clazz.getSimpleName() + " t";

		return (List<T>) getSession().createQuery(hsql).list();
	}

	@Override
	public int totalCount() {
		int count = 0;
		String hql = "select count(t) from " + clazz.getSimpleName() + " t";
		Long temp = (Long) getSession().createQuery(hql).uniqueResult();
		if (temp != null) {
			count = temp.intValue();
		}
		return count;
	}

	@Override
	public void update(String sql) {
		getSession().createQuery(sql);
	}

	@Override
	public T findUnique(String sql) {
		return (T) getSession().createQuery(sql).uniqueResult();
	}

	@Override
	public <T> PageModel<T> findPageList(String hql, int page, int rows) {
		Query query = getSession().createQuery(hql);
		return findPageList(query, page, rows);
	}

	@Override
	public <T> PageModel<T> findPageList(String hql, int page, int rows,
			Object... objects) {
		Query query = getSession().createQuery(hql);
		setParameter(query, objects);
		return findPageList(query, page, rows);
	}

	<T> PageModel<T> findPageList(Query query, int page, int rows) {
		ScrollableResults sr = query.scroll();
		sr.last();
		int count = sr.getRowNumber() == -1 ? 0 : sr.getRowNumber() + 1;
		query.setFirstResult((page - 1) * rows);
		query.setMaxResults(page * rows);
		return new PageModel<T>(page, rows, count, query.list());
	}

	public void setParameter(Query query, Object... objects) {
		for (int i = 0; i < objects.length; i++) {
			query.setParameter(i, objects[i]);
		}
	}

}
