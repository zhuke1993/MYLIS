package com.lis.tsp.service.imp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lis.tsp.dao.CarDao;
import com.lis.tsp.entity.Car;
import com.lis.tsp.service.CarService;
@Service
@Transactional
public class CarServiceImpl implements CarService{
	@Resource
	private CarDao carDao;
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#addOneCar()
	 */
	@Override
	public void addOneCar(Car car) {
		carDao.save(car);
		//System.out.println("add");
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#getAllCar()
	 */
	@Override
	public List<Car> getAllCar() {
		return carDao.find("from Car");
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#get(java.lang.Long)
	 */
	@Override
	public Car get(Long id) {
		// TODO Auto-generated method stub
		return carDao.get(Car.class, id);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#update(com.lis.tsp.entity.Car)
	 */
	@Override
	public void update(Car car) {
		carDao.update(car);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#delect(com.lis.tsp.entity.Car)
	 */
	@Override
	public void delect(Car car) {
		carDao.delete(car);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#getQueryCar(java.lang.String)
	 */
	@Override
	public List<Car> getQueryCar(String hql) {
		// TODO Auto-generated method stub
		return carDao.find(hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#getFenYeList(int, int, java.lang.String)
	 */
	@Override
	public List<Car> getFenYeList(int size, int count, String hql) {
		
		return carDao.getFenYeList(size, count, hql);
	}
	/* (non-Javadoc)
	 * @see com.lis.tsp.service.CarService#count(java.lang.String)
	 */
	@Override
	public Number count(String hql) {
		// TODO Auto-generated method stub
		return carDao.count(hql);
	}
	
}
