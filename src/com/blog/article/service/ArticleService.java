package com.blog.article.service;

import java.util.List;
import java.util.Map;

import com.blog.article.dao.Article;
import com.blog.article.dao.Category;

public interface ArticleService {

	public void saveToDraft(Map<String,Object> map);
	
	public List<Category> getAllCategory();
	
	public List<Article> queryAllArticle(int pageNumber,int categoryID);
	
	public Article getSpecificArticle(int aid);
	
	public void increaseViewCount(Article article);
	
	public void increaseLikeCount(Article article);
	
	public void updateToDraft(Map<String,Object> map);
	
	public void deleteSpecificArticle(int aid);
	
	public void publishOrAbolish(Map<String,Object> map);
	
	public List<Article> previousAndNext(int aid);
	
	public List<Article> orderByViewCount();
	
	public List<Map<String,String>> queryArchivesGroupByMonth();
	
	public List<Map<String,String>> queryArchives(String date);
	
	public int getVisitorByIP(String visitorIP);
	
	public String getVistorName(String visitorIP);
	
	public Map<String,String> getRankVisitor(String visitorIP);
}
