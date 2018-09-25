package com.blog.article.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.blog.article.dao.Article;
import com.blog.article.dao.Category;

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
}
