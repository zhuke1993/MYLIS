package com.lis.fas.entity;

// Generated 2015-5-16 11:45:34 by Hibernate Tools 3.4.0.CR1

import java.math.BigDecimal;
import java.util.Date;

/**
 * FasTravelinfo generated by hbm2java
 */
public class FasTravelinfo implements java.io.Serializable {

	private int id;
	private int departmentId;
	private Date trivalTime;
	private BigDecimal trivalEm;
	private int empId;
	private Date updateDate;
	private Date createDate;
	private char delStatus;

	public FasTravelinfo() {
	}

	public FasTravelinfo(int id, int departmentId, Date trivalTime, int empId,
			char delStatus) {
		this.id = id;
		this.departmentId = departmentId;
		this.trivalTime = trivalTime;
		this.empId = empId;
		this.delStatus = delStatus;
	}

	public FasTravelinfo(int id, int departmentId, Date trivalTime,
			BigDecimal trivalEm, int empId, Date updateDate, Date createDate,
			char delStatus) {
		this.id = id;
		this.departmentId = departmentId;
		this.trivalTime = trivalTime;
		this.trivalEm = trivalEm;
		this.empId = empId;
		this.updateDate = updateDate;
		this.createDate = createDate;
		this.delStatus = delStatus;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public Date getTrivalTime() {
		return this.trivalTime;
	}

	public void setTrivalTime(Date trivalTime) {
		this.trivalTime = trivalTime;
	}

	public BigDecimal getTrivalEm() {
		return this.trivalEm;
	}

	public void setTrivalEm(BigDecimal trivalEm) {
		this.trivalEm = trivalEm;
	}

	public int getEmpId() {
		return this.empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public char getDelStatus() {
		return this.delStatus;
	}

	public void setDelStatus(char delStatus) {
		this.delStatus = delStatus;
	}

}
