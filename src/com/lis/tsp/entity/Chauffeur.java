package com.lis.tsp.entity;

import java.sql.Date;

public class Chauffeur {
	private Long id;//司机编号
	private String name;//司机名称
	private String telPhone;//司机电话
	private String address;//司机地点
	private String state;//司机出车状态
	private Date brithday;//出生日期
	private String Email;//司机的邮箱
	private char sex;//司机性别
	
	/**
	 * @return the sex
	 */
	public char getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(char sex) {
		this.sex = sex;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}
	/**
	 * @return the brithday
	 */
	public Date getBrithday() {
		return brithday;
	}
	/**
	 * @param brithday the brithday to set
	 */
	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}
	
}
