package com.blog.article.dao;

import java.sql.Date;

public class Visitor {

	
	private int vid;
	private String vip;
	private String vname;
	private Date vtime;
	
	
	public int getVid() {
		return vid;
	}


	public void setVid(int vid) {
		this.vid = vid;
	}


	public String getVip() {
		return vip;
	}


	public void setVip(String vip) {
		this.vip = vip;
	}


	public String getVname() {
		return vname;
	}


	public void setVname(String vname) {
		this.vname = vname;
	}


	public Date getVtime() {
		return vtime;
	}


	public void setVtime(Date vtime) {
		this.vtime = vtime;
	}

	
	public Visitor(int vid, String vip, String vname, Date vtime) {
		super();
		this.vid = vid;
		this.vip = vip;
		this.vname = vname;
		this.vtime = vtime;
	}
	

	public Visitor(String vip, String vname) {
		super();
		this.vip = vip;
		this.vname = vname;
	}


	public Visitor(String vip, String vname, Date vtime) {
		super();
		this.vip = vip;
		this.vname = vname;
		this.vtime = vtime;
	}


	public Visitor() {
		// TODO Auto-generated constructor stub
	}

}
