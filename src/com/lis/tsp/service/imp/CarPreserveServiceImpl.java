package com.lis.tsp.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lis.tsp.dao.CarPreserveDao;
import com.lis.tsp.entity.CarPreserve;
import com.lis.tsp.service.CarPreserveService;
@Service
@Transactional
public class CarPreserveServiceImpl implements CarPreserveService{
	@Resource
	private CarPreserveDao carPreserveDao;
	/* (non-Javadoc)
	 * @see com.lis.tsp.dao.CarPreserveDao#add()
	 */
	@Override
	public void add(CarPreserve c) {
		// TODO Auto-generated method stub
		carPreserveDao.save(c);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#getAllCarPreserve()
	 */
	@Override
	public List<CarPreserve> getAllCarPreserve() {
		// TODO Auto-generated method stub
		return carPreserveDao.find("from CarPreserve");
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#getOneCarPreserve(java.lang.Long)
	 */
	@Override
	public CarPreserve getOneCarPreserve(Long id) {
		// TODO Auto-generated method stub
		return carPreserveDao.get(CarPreserve.class, id);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#editCarPreserve(com.lis.tsp.entity.CarPreserve)
	 */
	@Override
	public void editCarPreserve(CarPreserve carPreserve) {
		carPreserveDao.update(carPreserve);
		
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#delect(com.lis.tsp.entity.CarPreserve)
	 */
	@Override
	public void delect(CarPreserve carPreserve) {
		carPreserveDao.delete(carPreserve);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#getQueryList(java.lang.String)
	 */
	@Override
	public List<CarPreserve> getQueryList(String hql) {
		// TODO Auto-generated method stub
		return carPreserveDao.find(hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#fenYe(int, int)
	 */
	@Override
	public List<CarPreserve> fenYe(int start, int pageSize,String hql) {
		// TODO Auto-generated method stub
		return carPreserveDao.getFenYeList(pageSize, start, hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarPreserveService#getCount(java.lang.String)
	 */
	@Override
	public Number getCount(String hql) {
		// TODO Auto-generated method stub
		return carPreserveDao.count(hql);
	}
	
}
