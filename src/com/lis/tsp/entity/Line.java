package com.lis.tsp.entity;

public class Line {
	private Long id;//线路的主键ID
	private String lineNumber;//线路编号
	private String startCity;//线路的起始城市
	private String endCity;//线路的终点城市
	private String startDescriptionPlace;//起始地点的详细信息
	private String endDescriptionPlace;//终点地点的详细信息
	private String remark;//备注
	private String telPhone;//联系电话
	private int del_status;//判断逻辑删除  0：未删除，1：已删除
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
	 * @return the lineNumber
	 */
	public String getLineNumber() {
		return lineNumber;
	}
	/**
	 * @param lineNumber the lineNumber to set
	 */
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}
	/**
	 * @return the startCity
	 */
	public String getStartCity() {
		return startCity;
	}
	/**
	 * @param startCity the startCity to set
	 */
	public void setStartCity(String startCity) {
		this.startCity = startCity;
	}
	/**
	 * @return the endCity
	 */
	public String getEndCity() {
		return endCity;
	}
	/**
	 * @param endCity the endCity to set
	 */
	public void setEndCity(String endCity) {
		this.endCity = endCity;
	}
	/**
	 * @return the startDescriptionPlace
	 */
	public String getStartDescriptionPlace() {
		return startDescriptionPlace;
	}
	/**
	 * @param startDescriptionPlace the startDescriptionPlace to set
	 */
	public void setStartDescriptionPlace(String startDescriptionPlace) {
		this.startDescriptionPlace = startDescriptionPlace;
	}
	/**
	 * @return the endDescriptionPlace
	 */
	public String getEndDescriptionPlace() {
		return endDescriptionPlace;
	}
	/**
	 * @param endDescriptionPlace the endDescriptionPlace to set
	 */
	public void setEndDescriptionPlace(String endDescriptionPlace) {
		this.endDescriptionPlace = endDescriptionPlace;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return the telPhone
	 */
	public String getTelPhone() {
		return telPhone;
	}
	/**
	 * @param telPhone the telPhone to set
	 */
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
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
