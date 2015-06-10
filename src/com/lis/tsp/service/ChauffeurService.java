package com.lis.tsp.service;

import java.util.List;

import com.lis.tsp.entity.Chauffeur;

public interface ChauffeurService {
	//增加一个司机
	public void add(Chauffeur chauffeur);
	//得到所有的司机信息
	public List<Chauffeur> getAllChauffeur();
	//根据一个ID来得到一个对象信息
	public Chauffeur getChauffeurById(Long id);
	//更新一个司机对象
	public void edit(Chauffeur chauffeur);
	//根据一个ID来删除一个司机
	public void delect(Long id);
	//得到所有的司机数
	public Number count(String hql);
	//得到分页的list
	public List<Chauffeur> getFenYe(String hql,int start,int pageSize);
	//得到所有司机的ID
	public List<String> getAllId(String hql);
}
