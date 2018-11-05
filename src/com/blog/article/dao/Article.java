package com.blog.article.dao;

import java.util.Date;

public class Article {

	private int aid;
	private String title;
	private String summary;
	private Date ptime;
	private Date utime;
	private String content;
	private int category_id;
	private short draft;
	private int likecount;
	private int viewcount;

	
	

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public short getDraft() {
		return draft;
	}

	public void setDraft(short draft) {
		this.draft = draft;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Date getPtime() {
		return ptime;
	}

	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}

	public Date getUtime() {
		return utime;
	}

	public void setUtime(Date utime) {
		this.utime = utime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public Article() {
		// TODO Auto-generated constructor stub
	}

	
	public Article(int aid, String title, String summary, Date ptime,
			Date utime, String content, int category_id, short draft) {
		super();
		this.aid = aid;
		this.title = title;
		this.summary = summary;
		this.ptime = ptime;
		this.utime = utime;
		this.content = content;
		this.category_id = category_id;
		this.draft = draft;
	}

	public Article(String title, String summary, Date ptime, Date utime,
			String content, int category_id, short draft) {
		super();
		this.title = title;
		this.summary = summary;
		this.ptime = ptime;
		this.utime = utime;
		this.content = content;
		this.category_id = category_id;
		this.draft = draft;
	}

	public Article(String title, String content, int category_id) {
		super();
		this.title = title;
		this.content = content;
		this.category_id = category_id;
	}
	
	public Article(int aid, String title, Date ptime) {
		super();
		this.aid = aid;
		this.title = title;
		this.ptime = ptime;
	}
	public Article(String title, String summary, Date ptime, Date utime,
			String content, int category_id, short draft, 
			int viewcount,int likecount) {
		super();
		this.title = title;
		this.summary = summary;
		this.ptime = ptime;
		this.utime = utime;
		this.content = content;
		this.category_id = category_id;
		this.draft = draft;
		this.likecount = likecount;
		this.viewcount = viewcount;
	}
	
	public Article(int aid, String title, String summary, Date ptime,
			Date utime, String content, int category_id, short draft,
			int likecount, int viewcount) {
		super();
		this.aid = aid;
		this.title = title;
		this.summary = summary;
		this.ptime = ptime;
		this.utime = utime;
		this.content = content;
		this.category_id = category_id;
		this.draft = draft;
		this.likecount = likecount;
		this.viewcount = viewcount;
	}

	@Override
	public String toString() {
		return "Article [aid=" + aid + ", title=" + title + ", summary="
				+ summary + ", ptime=" + ptime + ", utime=" + utime
				+ ", content=" + content + ", category_id=" + category_id
				+ ", draft=" + draft + "]";
	}
	
}
