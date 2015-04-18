package com.lis.base.dao;

import java.io.Serializable;
import java.util.List;

import com.lis.base.entitys.PageBean;


public interface BaseDao <T> {
	public Serializable save(T o);
	public void delete(T o);

	public void update(T o);
	
	public void saveOrUpdate(T o);
	

	public void merge(T o);

	public List<T> find(String hql);


	public List<T> find(String hql, Object[] param);

	public List<T> find(String hql, List<Object> param);


	public List<T> find(String hql, Object[] param, PageBean pageBean);


	public List<T> find(String hql, List<Object> param, PageBean pageBean);


	public T get(Class<T> c, Serializable id);


	public T get(String hql, Object[] param);

	public T get(String hql, List<Object> param);


	public int count(String hql);


	public int count(String hql, Object[] param);


	public int count(String hql, List<Object> param);

	public int executeHql(String hql);

	
	public int executeHql(String hql, Object[] param);

	
	public int executeHql(String hql, List<Object> param);

	//public Integer executeSql(String sql); 为啥用Integer
	
	public int executeSql(String sql);
}
