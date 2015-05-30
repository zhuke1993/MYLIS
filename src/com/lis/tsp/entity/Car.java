package com.lis.tsp.entity;

import java.sql.Date;
import java.util.Set;

public class Car {
	/**
	 * limao
	 */
	//这是个车辆管理的实体
	private Long id;
	private String carNumber;//车辆编号
	private String carChePai;//车的车牌
	private String carState;//车的状态
	private String carLoad;//载重
	private String carType;//车的类型
	private Date carBuyingTime;//车的购买时间
	private String carPlace;//车的地方
	private String carBuyingMoney;//车买的金额
	private Date carCreatTime;//车创建时间
	private String carDescription;//车辆的备注
	private Set<CarPreserve> carPreserves;//一个车辆可能有多个保修单
	private Set<CarRepair> carRepairs;
	
	/**
	 * @return the carRepairs
	 */
	public Set<CarRepair> getCarRepairs() {
		return carRepairs;
	}
	/**
	 * @param carRepairs the carRepairs to set
	 */
	public void setCarRepairs(Set<CarRepair> carRepairs) {
		this.carRepairs = carRepairs;
	}
	/**
	 * @return the carPreserves
	 */
	public Set<CarPreserve> getCarPreserves() {
		return carPreserves;
	}
	/**
	 * @param carPreserves the carPreserves to set
	 */
	public void setCarPreserves(Set<CarPreserve> carPreserves) {
		this.carPreserves = carPreserves;
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
	 * @return the carNumber
	 */
	public String getCarNumber() {
		return carNumber;
	}
	/**
	 * @param carNumber the carNumber to set
	 */
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	/**
	 * @return the carChePai
	 */
	public String getCarChePai() {
		return carChePai;
	}
	/**
	 * @param carChePai the carChePai to set
	 */
	public void setCarChePai(String carChePai) {
		this.carChePai = carChePai;
	}
	/**
	 * @return the carState
	 */
	public String getCarState() {
		return carState;
	}
	/**
	 * @param carState the carState to set
	 */
	public void setCarState(String carState) {
		this.carState = carState;
	}
	/**
	 * @return the carLoad
	 */
	public String getCarLoad() {
		return carLoad;
	}
	/**
	 * @param carLoad the carLoad to set
	 */
	public void setCarLoad(String carLoad) {
		this.carLoad = carLoad;
	}
	/**
	 * @return the carType
	 */
	public String getCarType() {
		return carType;
	}
	/**
	 * @param carType the carType to set
	 */
	public void setCarType(String carType) {
		this.carType = carType;
	}
	/**
	 * @return the carBuyingTime
	 */
	public Date getCarBuyingTime() {
		return carBuyingTime;
	}
	/**
	 * @param carBuyingTime the carBuyingTime to set
	 */
	public void setCarBuyingTime(Date carBuyingTime) {
		this.carBuyingTime = carBuyingTime;
	}
	/**
	 * @return the carPlace
	 */
	public String getCarPlace() {
		return carPlace;
	}
	/**
	 * @param carPlace the carPlace to set
	 */
	public void setCarPlace(String carPlace) {
		this.carPlace = carPlace;
	}
	/**
	 * @return the carBuyingMoney
	 */
	public String getCarBuyingMoney() {
		return carBuyingMoney;
	}
	/**
	 * @param carBuyingMoney the carBuyingMoney to set
	 */
	public void setCarBuyingMoney(String carBuyingMoney) {
		this.carBuyingMoney = carBuyingMoney;
	}
	/**
	 * @return the carCreatTime
	 */
	public Date getCarCreatTime() {
		return carCreatTime;
	}
	/**
	 * @param carCreatTime the carCreatTime to set
	 */
	public void setCarCreatTime(Date carCreatTime) {
		this.carCreatTime = carCreatTime;
	}
	/**
	 * @return the carDescription
	 */
	public String getCarDescription() {
		return carDescription;
	}
	/**
	 * @param carDescription the carDescription to set
	 */
	public void setCarDescription(String carDescription) {
		this.carDescription = carDescription;
	}
	
}
