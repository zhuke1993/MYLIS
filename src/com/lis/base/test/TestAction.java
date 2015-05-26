package com.lis.base.test;

import com.opensymphony.xwork2.ActionSupport;


public class TestAction extends ActionSupport{
	
	public String test(){
		System.out.println("struts2 String test");
		return SUCCESS;
	}
}
