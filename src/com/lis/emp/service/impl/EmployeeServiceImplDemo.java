package com.lis.emp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lis.base.dao.BaseDao;
import com.lis.base.entitys.PageBean;
import com.lis.emp.entity.Employee;
@Service("empServiveDemo")
public class EmployeeServiceImplDemo implements EmpServiveDemo{
	@Resource
	
	private  BaseDao<Employee> baseDao;
	@Override
	public List<Employee> findEmployeeList(Employee employee,
			PageBean pageBean) {
		StringBuffer hql=new StringBuffer("from Employee");
		hql.append(" order by age desc");
		if(pageBean!=null){
			
		}
		return null;
	}

	@Override
	public Long getEmployeeCount(Employee employee) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveEmployee(Employee employee) {
		baseDao.save(employee);
	}

	@Override
	public void delete(Employee employee) {
		baseDao.delete(employee);
	}

	@Override
	public Employee getEmployeeById(int employeeId) {
		return baseDao.get(Employee.class,employeeId);
	}

}
