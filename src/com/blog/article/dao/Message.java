package com.blog.article.dao;

import java.sql.Date;


public class Message {

	private int mid;
	private String mess;
	private String mname;
	private Date mtime;
	
	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMess() {
		return mess;
	}

	public void setMess(String mess) {
		this.mess = mess;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Date getMtime() {
		return mtime;
	}

	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}

	
	public Message(String mname, String mess, Date mtime) {
		super();
		this.mess = mess;
		this.mname = mname;
		this.mtime = mtime;
	}

	
	public Message(String mname, String mess) {
		super();
		this.mname = mname;
		this.mess = mess;
	}

	public Message() {
		// TODO Auto-generated constructor stub
	}

}
