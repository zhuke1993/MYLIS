package com.lis.tsp.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.lis.base.dao.impl.BaseDaoImpl;
import com.lis.tsp.dao.ChauffeurDao;
import com.lis.tsp.entity.Chauffeur;
@Repository
public class ChauffeurDaoImpl extends BaseDaoImpl<Chauffeur> implements ChauffeurDao{

	/* (non-Javadoc)
	 * @see com.lis.tsp.dao.ChauffeurDao#getAllId(java.lang.String)
	 */
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<String> getAllId(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}
	
}
