package com.lis.tsp.service;

import java.util.List;

import com.lis.tsp.entity.CarPreserve;

public interface CarPreserveService {
	public void add(CarPreserve c);
	//返回所有的保修单信息
	public List<CarPreserve> getAllCarPreserve();
	//得到一个carpreserve
	public CarPreserve getOneCarPreserve(Long id);
	//更新一个carpreserve的数据
	public void editCarPreserve(CarPreserve carPreserve);
	//删除一个carpreserve
	public void delect(CarPreserve carPreserve);
	//返回一个查询结果
	public List<CarPreserve> getQueryList(String hql);
	//分页查询的操作
	public List<CarPreserve> fenYe(int start,int pageSize,String hql);
	//得到所有的数据记录
	public Number getCount(String hql);
}
