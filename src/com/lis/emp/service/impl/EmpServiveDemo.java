package com.lis.emp.service.impl;

import java.util.List;

import com.lis.base.entitys.PageBean;
import com.lis.emp.entity.Employee;

public interface EmpServiveDemo {


	public List<Employee> findEmployeeList(Employee s_Employee,PageBean pageBean);
	

	public Long getEmployeeCount(Employee s_Employee);

	public void saveEmployee(Employee Employee);
	

	public void delete(Employee Employee);

	public Employee getEmployeeById(int EmployeeId);
	
}
