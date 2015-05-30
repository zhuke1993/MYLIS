package com.lis.tsp.entity;

import java.sql.Date;

public class CarRepair {
	private Long id;//-//维修编号
	private String repairPlace;//维修地点
	private Date repairTime;//维修时间
	private Double repairMoney;//维修金额
	private String repairDescription;//维修批注
	private int repairPeriod;//维修周期
	private Car car;//一个保单中有一个car属性 车辆的id-
	private String empName;//用户的名称。这里应该是对象。先用字符串代替
	private String disposeName;//维修人员
	private Date updateTime;//更新时间
	private Date repairCreateTime;//保单创建时间 
	private int del_status;//逻辑判断是否删除
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the repairPlace
	 */
	public String getRepairPlace() {
		return repairPlace;
	}
	/**
	 * @param repairPlace the repairPlace to set
	 */
	public void setRepairPlace(String repairPlace) {
		this.repairPlace = repairPlace;
	}
	/**
	 * @return the repairTime
	 */
	public Date getRepairTime() {
		return repairTime;
	}
	/**
	 * @param repairTime the repairTime to set
	 */
	public void setRepairTime(Date repairTime) {
		this.repairTime = repairTime;
	}
	/**
	 * @return the repairMoney
	 */
	public Double getRepairMoney() {
		return repairMoney;
	}
	/**
	 * @param repairMoney the repairMoney to set
	 */
	public void setRepairMoney(Double repairMoney) {
		this.repairMoney = repairMoney;
	}
	/**
	 * @return the repairDescription
	 */
	public String getRepairDescription() {
		return repairDescription;
	}
	/**
	 * @param repairDescription the repairDescription to set
	 */
	public void setRepairDescription(String repairDescription) {
		this.repairDescription = repairDescription;
	}
	/**
	 * @return the repairPeriod
	 */
	public int getRepairPeriod() {
		return repairPeriod;
	}
	/**
	 * @param repairPeriod the repairPeriod to set
	 */
	public void setRepairPeriod(int repairPeriod) {
		this.repairPeriod = repairPeriod;
	}
	/**
	 * @return the car
	 */
	public Car getCar() {
		return car;
	}
	/**
	 * @param car the car to set
	 */
	public void setCar(Car car) {
		this.car = car;
	}
	/**
	 * @return the empName
	 */
	public String getEmpName() {
		return empName;
	}
	/**
	 * @param empName the empName to set
	 */
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	/**
	 * @return the disposeName
	 */
	public String getDisposeName() {
		return disposeName;
	}
	/**
	 * @param disposeName the disposeName to set
	 */
	public void setDisposeName(String disposeName) {
		this.disposeName = disposeName;
	}
	/**
	 * @return the updateTime
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	/**
	 * @param updateTime the updateTime to set
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	/**
	 * @return the repairCreateTime
	 */
	public Date getRepairCreateTime() {
		return repairCreateTime;
	}
	/**
	 * @param repairCreateTime the repairCreateTime to set
	 */
	public void setRepairCreateTime(Date repairCreateTime) {
		this.repairCreateTime = repairCreateTime;
	}
	/**
	 * @return the del_status
	 */
	public int getDel_status() {
		return del_status;
	}
	/**
	 * @param del_status the del_status to set
	 */
	public void setDel_status(int del_status) {
		this.del_status = del_status;
	}
	
}
