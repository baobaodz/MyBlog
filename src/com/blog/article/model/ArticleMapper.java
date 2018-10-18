package com.blog.article.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.blog.article.dao.Article;
import com.blog.article.dao.Category;
import com.blog.article.dao.Message;
import com.blog.article.dao.Visitor;

public interface ArticleMapper {

	public void saveToDraft(Map<String,Object> map);
	
	public List<Category> getAllCategory();
	
	public List<Article> queryAllArticle(@Param("pageNumber") int pageNumber,@Param("categoryID") int categoryID);
	
	public Article getSpecificArticle(int aid);
	
	public void increaseViewCount(Article article);
	
	public void increaseLikeCount(Article article);
	
	public void updateToDraft(Map<String,Object> map);
	
	public void deleteSpecificArticle(int aid);
	
	public void publishOrAbolish(Map<String,Object> map);
	
	public List<Article> previousAndNext(int aid);
	
	public List<Article> orderByViewCount();
	
	public List<Map<String,String>> queryArchivesGroupByMonth();
	
	public List<Map<String,String>> queryArchives(@Param("date") String date);
	
	public int getVisitorByIP(String visitorIP);
	
	public String getVistorName(String visitorIP);
	
	public void updateVisitor(Visitor visitor);
	
	public Map<String,String> getRankVisitor(String visitorIP);
	
	public void saveMessage(Message message);
	
	public List<Message> queryMessage();
	
	public Map<String,String> querySiteInfo();
}
