package com.lis.tsp.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lis.tsp.dao.ChauffeurDao;
import com.lis.tsp.entity.Chauffeur;
import com.lis.tsp.service.ChauffeurService;
@Service
@Transactional
public class ChauffeurServiceImpl implements ChauffeurService{
	@Resource
	private ChauffeurDao chauffeurDao;
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#add(com.lis.tsp.entity.Chauffeur)
	 */
	@Override
	public void add(Chauffeur chauffeur) {
		// TODO Auto-generated method stub
		 chauffeurDao.save(chauffeur);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#getAllChauffeur()
	 */
	@Override
	public List<Chauffeur> getAllChauffeur() {
		// TODO Auto-generated method stub
		return chauffeurDao.find("from Chauffeur");
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#getChauffeurById(java.lang.Long)
	 */
	@Override
	public Chauffeur getChauffeurById(Long id) {
		// TODO Auto-generated method stub
		return chauffeurDao.get(Chauffeur.class, id);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#edit(com.lis.tsp.entity.Chauffeur)
	 */
	@Override
	public void edit(Chauffeur chauffeur) {
		chauffeurDao.update(chauffeur);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#delect(java.lang.Long)
	 */
	@Override
	public void delect(Long id) {
		chauffeurDao.delete(chauffeurDao.get(Chauffeur.class, id));
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#count(java.lang.String)
	 */
	@Override
	public Number count(String hql) {
		// TODO Auto-generated method stub
		return chauffeurDao.count(hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#getFenYe(java.lang.String, int, int)
	 */
	@Override
	public List<Chauffeur> getFenYe(String hql, int start, int pageSize) {
		// TODO Auto-generated method stub
		return chauffeurDao.getFenYeList(pageSize, start, hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.ChauffeurService#getAllId(java.lang.String)
	 */
	@Override
	public List<String> getAllId(String hql) {
		// TODO Auto-generated method stub
		return chauffeurDao.getAllId(hql);
	}
	
}
