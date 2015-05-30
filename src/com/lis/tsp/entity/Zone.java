package com.lis.tsp.entity;

public class Zone {
	private Long id;//区域的主键ID
	private String zone_pro;//区域的省
	private String zone_city;//区域的市
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
	 * @return the zone_pro
	 */
	public String getZone_pro() {
		return zone_pro;
	}
	/**
	 * @param zone_pro the zone_pro to set
	 */
	public void setZone_pro(String zone_pro) {
		this.zone_pro = zone_pro;
	}
	/**
	 * @return the zone_city
	 */
	public String getZone_city() {
		return zone_city;
	}
	/**
	 * @param zone_city the zone_city to set
	 */
	public void setZone_city(String zone_city) {
		this.zone_city = zone_city;
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
