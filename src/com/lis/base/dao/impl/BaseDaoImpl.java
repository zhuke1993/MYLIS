package com.lis.base.dao.impl;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.lis.base.dao.BaseDao;
import com.lis.base.entitys.PageBean;

@Repository("BaseDao")
@SuppressWarnings("all")
public class BaseDaoImpl<T> implements BaseDao<T> {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	@Override
	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	@Override
	public void update(T o) {
		this.getCurrentSession().delete(o);
	}

	@Override
	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
	}

	@Override
	public void merge(T o) {
		this.getCurrentSession().merge(o);
	}

	// HQL不带参数的查询多条数据
	@Override
	public List<T> find(String hql) {
		return this.getCurrentSession().createQuery(hql).list();
	}

	// HQL带参数的查询多条数据
	@Override
	public List<T> find(String hql, Object[] param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter(i, param[i]);
			}
		}
		return query.list();
	}

	// HQL带参数集合查询多条数据
	@Override
	public List<T> find(String hql, List<Object> param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		return query.list();
	}

	// HQL带参数对象数组 分页查询多条数据
	@Override
	public List<T> find(String hql, Object[] param, PageBean pageBean) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter(i, param[i]);
			}
		}
		return query.setFirstResult(pageBean.getStart())
				.setMaxResults(pageBean.getPageSize()).list();
	}

	// HQL带参数将集合 分页查询多条数据
	@Override
	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				query.setParameter(i, param.get(i));
			}
		}
		return query.setFirstResult(pageBean.getStart())
				.setMaxResults(pageBean.getPageSize()).list();

	}

	// 根据主键得到单条记录
	@Override
	public T get(Class<T> c, Serializable id) {
		return (T) getCurrentSession().get(c, id);
	}

	// 带对象数组参数得到单条记录
	@Override
	public T get(String hql, Object[] param) {
		Query query = getCurrentSession().createQuery(hql);
		List list = find(hql, param);
		if (list != null && list.size() > 0) {
			return (T) list.get(0);
		} else {
			return null;
		}
	}

	// 带集合参数得到单条记录
	@Override
	public T get(String hql, List<Object> param) {
		Query query = getCurrentSession().createQuery(hql);
		List list = find(hql, param);
		if (list != null && list.size() > 0) {
			return (T) list.get(0);
		} else {
			return null;
		}
	}
	//不带参数的查询单个结果得到条数
	@Override
	public int count(String hql) {
		return (int) getCurrentSession().createQuery(hql).uniqueResult();
	}
	//带参数的查询单个结果得到条数
	@Override
	public int count(String hql, Object[] param) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				query.setParameter(i, param[i]);
			}
		}
		return (int) query.uniqueResult();
	}
	
	@Override
	public int count(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (int) q.uniqueResult();
	}
	//直接执行HQL
	@Override
	public int executeHql(String hql) {
		return 	getCurrentSession().createQuery(hql).executeUpdate();
	}
	//直接执行带对象数组参数的HQL
	@Override
	public int executeHql(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}
	//直接执行带集合参数的HQL
	@Override
	public int executeHql(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if(param!= null && param.size()>0){
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}
	//直接执行sql语句
	@Override
	public int executeSql(String sql) {
		return (int)getCurrentSession().createSQLQuery(sql).executeUpdate();
	}

}
