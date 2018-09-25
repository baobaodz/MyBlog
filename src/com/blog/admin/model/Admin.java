package com.blog.admin.model;

public class Admin {

	public Admin() {
		// TODO Auto-generated constructor stub
	}
	private String aname;
	private String apassword;
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	public Admin(String aname, String apassword) {
		super();
		this.aname = aname;
		this.apassword = apassword;
	}
	@Override
	public String toString() {
		return "Admin [aname=" + aname + ", apassword=" + apassword + "]";
	}
	
	
}
