package com.lis.tsp.entity;

import java.sql.Date;
import java.util.Set;

public class CarPreserve {
	private Long id;//-
	private String preserveNumber;//保修编号
	private String preserverPlace;//保修地点
	private Date preserveTime;//入保修时间
	private Double preserveMoney;//保修金额
	private String preserveDescription;//保修批注
	private int preservePeriod;//保修周期
	private Car car;//一个保单中有一个car属性 车辆的id-
	private String empName;//用户的名称。这里应该是对象。先用字符串代替
	private String disposeName;//维修人员
	private Date updateTime;//更新时间
	private Date preserveCreateTime;//保单创建时间 
	private int del_status;//逻辑判断是否删除
	
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
	 * @return the preserveCreateTime
	 */
	public Date getPreserveCreateTime() {
		return preserveCreateTime;
	}
	/**
	 * @param preserveCreateTime the preserveCreateTime to set
	 */
	public void setPreserveCreateTime(Date preserveCreateTime) {
		this.preserveCreateTime = preserveCreateTime;
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
	 * @return the preserveNumber
	 */
	public String getPreserveNumber() {
		return preserveNumber;
	}
	/**
	 * @param preserveNumber the preserveNumber to set
	 */
	public void setPreserveNumber(String preserveNumber) {
		this.preserveNumber = preserveNumber;
	}
	/**
	 * @return the preserverPlace
	 */
	public String getPreserverPlace() {
		return preserverPlace;
	}
	/**
	 * @param preserverPlace the preserverPlace to set
	 */
	public void setPreserverPlace(String preserverPlace) {
		this.preserverPlace = preserverPlace;
	}
	/**
	 * @return the preserveTime
	 */
	public Date getPreserveTime() {
		return preserveTime;
	}
	/**
	 * @param preserveTime the preserveTime to set
	 */
	public void setPreserveTime(Date preserveTime) {
		this.preserveTime = preserveTime;
	}
	/**
	 * @return the preserveMoney
	 */
	public Double getPreserveMoney() {
		return preserveMoney;
	}
	/**
	 * @param preserveMoney the preserveMoney to set
	 */
	public void setPreserveMoney(Double preserveMoney) {
		this.preserveMoney = preserveMoney;
	}
	/**
	 * @return the preserveDescription
	 */
	public String getPreserveDescription() {
		return preserveDescription;
	}
	/**
	 * @param preserveDescription the preserveDescription to set
	 */
	public void setPreserveDescription(String preserveDescription) {
		this.preserveDescription = preserveDescription;
	}
	/**
	 * @return the preservePeriod
	 */
	public int getPreservePeriod() {
		return preservePeriod;
	}
	/**
	 * @param preservePeriod the preservePeriod to set
	 */
	public void setPreservePeriod(int preservePeriod) {
		this.preservePeriod = preservePeriod;
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
	
}
