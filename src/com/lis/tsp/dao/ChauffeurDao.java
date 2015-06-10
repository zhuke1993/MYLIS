package com.lis.tsp.dao;

import java.util.List;

import com.lis.base.dao.BaseDao;
import com.lis.tsp.entity.Chauffeur;

public interface ChauffeurDao extends BaseDao<Chauffeur>{
	//得到所有司机的ID
		public List<String> getAllId(String hql);
}
