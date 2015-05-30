package com.lis.tsp.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lis.tsp.dao.CarRepairDao;
import com.lis.tsp.entity.Car;
import com.lis.tsp.entity.CarRepair;
import com.lis.tsp.service.CarRepairService;
import com.lis.tsp.service.CarService;

@Service
@Transactional
public class CarRepairServiceImpl implements CarRepairService{
	@Resource
	private CarRepairDao carRepairDao;

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#add(com.lis.tsp.entity.CarRepair)
	 */
	@Override
	public void add(CarRepair c) {
		// TODO Auto-generated method stub
		carRepairDao.save(c);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#getAllCarRepair()
	 */
	@Override
	public List<CarRepair> getAllCarRepair() {
		// TODO Auto-generated method stub
		return carRepairDao.find("from CarRepair");
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#getOneCarRepair(java.lang.Long)
	 */
	@Override
	public CarRepair getOneCarRepair(Long id) {
		// TODO Auto-generated method stub
		return carRepairDao.get(CarRepair.class, id);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#editCarRepair(com.lis.tsp.entity.CarRepair)
	 */
	@Override
	public void editCarRepair(CarRepair CarRepair) {
		carRepairDao.update(CarRepair);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#delect(com.lis.tsp.entity.CarRepair)
	 */
	@Override
	public void delect(CarRepair CarRepair) {
		carRepairDao.delete(CarRepair);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#getQueryList(java.lang.String)
	 */
	@Override
	public List<CarRepair> getQueryList(String hql) {
		// TODO Auto-generated method stub
		return carRepairDao.find(hql);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#fenYe(int, int, java.lang.String)
	 */
	@Override
	public List<CarRepair> fenYe(int start, int pageSize, String hql) {
		// TODO Auto-generated method stub
		return carRepairDao.getFenYeList(pageSize, start, hql);
	}

	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarRepairService#getCount(java.lang.String)
	 */
	@Override
	public Number getCount(String hql) {
		// TODO Auto-generated method stub
		return carRepairDao.count(hql);
	}
	
	
}
