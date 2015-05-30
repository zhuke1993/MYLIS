package com.lis.tsp.service;

import java.util.List;

import com.lis.tsp.entity.Line;

public interface LineService {
	public void add(Line c);
	//返回所有的保修单信息
	public List<Line> getAllLine();
	//得到一个Line
	public Line getOneLine(Long id);
	//更新一个Line的数据
	public void editLine(Line Line);
	//删除一个Line
	public void delect(Line Line);
	//返回一个查询结果
	public List<Line> getQueryList(String hql);
	//分页查询的操作
	public List<Line> fenYe(int start,int pageSize,String hql);
	//得到所有的数据记录
	public Number getCount(String hql);
}
