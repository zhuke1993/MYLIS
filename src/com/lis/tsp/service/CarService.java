package com.lis.tsp.service;

import java.util.List;

import com.lis.tsp.entity.Car;

public interface CarService {
	//新增一个car的数据
	public void addOneCar(Car car);
	//得到所有的car的数据
	public List<Car> getAllCar();
	//通过一个ID得到一个car数据
	public Car get(Long id);
	//修改一个car的数据
	public void update(Car car);
	//删除一个car
	public void delect(Car car);
	//通过一些条件来查询listcar
	public List<Car> getQueryCar(String hql);
	//分页查询
	public List<Car> getFenYeList(int size,int count,String hql);
	//不带参数的查询单个结果得到条数
	public Number count(String hql) ;
}
