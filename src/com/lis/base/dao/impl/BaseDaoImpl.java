package com.lis.base.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.lis.base.dao.BaseDao;
import com.lis.base.entitys.PageBean;

public class BaseDaoImpl <T> implements BaseDao<T>{

	@Override
	public Serializable save(T o) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(T o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(T o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOrUpdate(T o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void merge(T o) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<T> find(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> find(String hql, Object[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> find(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> find(String hql, Object[] param, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> find(String hql, List<Object> param, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T get(Class<T> c, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T get(String hql, Object[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T get(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(String hql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count(String hql, Object[] param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int executeHql(String hql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int executeHql(String hql, Object[] param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int executeHql(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int executeSql(String sql) {
		// TODO Auto-generated method stub
		return 0;
	}

}
