package com.lis.tsp.service;

import java.util.List;

import com.lis.tsp.entity.CarRepair;
import com.lis.tsp.entity.CarRepair;

public interface CarRepairService {
	public void add(CarRepair c);
	//返回所有的保修单信息
	public List<CarRepair> getAllCarRepair();
	//得到一个CarRepair
	public CarRepair getOneCarRepair(Long id);
	//更新一个CarRepair的数据
	public void editCarRepair(CarRepair CarRepair);
	//删除一个CarRepair
	public void delect(CarRepair CarRepair);
	//返回一个查询结果
	public List<CarRepair> getQueryList(String hql);
	//分页查询的操作
	public List<CarRepair> fenYe(int start,int pageSize,String hql);
	//得到所有的数据记录
	public Number getCount(String hql);
}
