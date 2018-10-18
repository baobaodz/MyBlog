package com.blog.article.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.article.dao.Article;
import com.blog.article.dao.Category;
import com.blog.article.dao.Message;
import com.blog.article.dao.Visitor;
import com.blog.article.model.ArticleMapper;

@Service("ArticleService")
public class ArticleServiceImpl implements ArticleService{

	
	@Autowired
	private ArticleMapper articleMapper;
	
	/*
	 * (non-Javadoc)
	 * @see com.blog.article.service.ArticleService#saveToDraft(java.util.Map)
	 * 将文章保存为草稿
	 */
	@Override
	public void saveToDraft(Map<String,Object> map) {

		articleMapper.saveToDraft(map);
	}

	@Override
	public List<Category> getAllCategory() {

		List<Category> list =  articleMapper.getAllCategory();
		return list;
	}

	@Override
	public List<Article> queryAllArticle(int pageNumber,int categoryID) {
		
		List<Article> list = articleMapper.queryAllArticle(pageNumber,categoryID);
		return list;
	}

	@Override
	public Article getSpecificArticle(int aid) {
		Article article = articleMapper.getSpecificArticle(aid);
		return article;
	}

	@Override
	public void updateToDraft(Map<String, Object> map) {
		articleMapper.updateToDraft(map);
		
	}

	@Override
	public void deleteSpecificArticle(int aid) {
		articleMapper.deleteSpecificArticle(aid);
	}

	@Override
	public void publishOrAbolish(Map<String, Object> map) {
		
		articleMapper.publishOrAbolish(map);
	}

	@Override
	public List<Article> previousAndNext(int aid) {
		
		List<Article> list = articleMapper.previousAndNext(aid);
		return list;
	}

	@Override
	public void increaseViewCount(Article article) {
		articleMapper.increaseViewCount(article);
	}

	@Override
	public void increaseLikeCount(Article article) {
		articleMapper.increaseLikeCount(article);
	}

	@Override
	public List<Article> orderByViewCount() {
		List<Article> list = articleMapper.orderByViewCount();
		return list;
	}

	@Override
	public List<Map<String, String>> queryArchivesGroupByMonth() {
		List<Map<String, String>> list= articleMapper.queryArchivesGroupByMonth();
		return list;
		
	}

	@Override
	public List<Map<String,String>> queryArchives(String date) {
		List<Map<String,String>> list = articleMapper.queryArchives(date);
		return list;
	}

	@Override
	public int getVisitorByIP(String visitorIP) {
		int i = articleMapper.getVisitorByIP(visitorIP);
		if(i==0){
			
			//分配名字
			String letter = "abcdefghijklmnopqrstuvwxyz"+"ABCDEFGHIJKLMBOPQRSTUVWXYZ";
			StringBuilder sb = new StringBuilder();
			Random random = new Random();
			
			for(int j=0;j<5;j++){
				int ranIndex = random.nextInt(52);//产生指定范围随机整数
				sb.append(letter.charAt(ranIndex));
			}
			long currentTime = System.currentTimeMillis();//获取当前时间毫秒数
			String timeStr= ""+currentTime;
			String subTime = timeStr.substring(8);
			String visitorName = sb.append(subTime).toString();
			
			Visitor visitor = new Visitor(visitorIP,visitorName);
			articleMapper.updateVisitor(visitor);
		}
		return i;
	}

	@Override
	public Map<String,String> getRankVisitor(String visitorIP) {
		
		Map<String,String> map = articleMapper.getRankVisitor(visitorIP);
		return map;
	}

	@Override
	public String getVistorName(String visitorIP) {

		String vistorName = articleMapper.getVistorName(visitorIP);
		return vistorName;
	}

	@Override
	public void saveMessage(Message message) {

		articleMapper.saveMessage(message);
	}

	@Override
	public List<Message> queryMessage() {
		List<Message> messages = articleMapper.queryMessage();
		return messages;
	}

	@Override
	public Map<String, String> querySiteInfo() {

		Map<String, String> map = articleMapper.querySiteInfo();
		return map;
	}
	
}
