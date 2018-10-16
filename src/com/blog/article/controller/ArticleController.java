package com.blog.article.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.blog.article.dao.Article;
import com.blog.article.dao.Category;
import com.blog.article.service.ArticleService;



@Controller
public class ArticleController {

	@Autowired
	@Qualifier("ArticleService")
	private ArticleService articleService;
	
	/*
	 * ����Ϊ�ݸ����ֱ�ӷ�����ȡ����data�е�draft
	 */
	@RequestMapping(value = "saveToDraft", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveToDraft(
			@RequestBody Map<String, Object> map, ModelAndView mv,
			HttpServletRequest request) {

		String updateStr = request.getQueryString();
		if (updateStr != null && updateStr != ""&& updateStr.contains("isUpdate")) {
			articleService.updateToDraft(map);
		} else {
			articleService.saveToDraft(map);
		}
		return map;

	}
	/*
	 * ��ȡ����
	 */
	@RequestMapping(value="getAllCategory",method = RequestMethod.POST)
	@ResponseBody
	public String getAllCategory(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		
		List<Category> categories = articleService.getAllCategory();
		//JSONArray jsonArray = (JSONArray)JSON.toJSON(categories);
		return JSON.toJSON(categories).toString();
	}
	/*
	 * ��ȡ�����б�
	 */
	@RequestMapping(value="queryAllArticle",method = RequestMethod.POST)
	@ResponseBody
	public String queryAllArticle(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String pageNum = String.valueOf(map.get("pageNumber"));
		int pageNumber = Integer.parseInt(pageNum);
		String categoryid = String.valueOf(map.get("categoryID"));
		int categoryID = 0;
		if(categoryid!="null"){
			
			categoryID = Integer.parseInt(categoryid);
		}
		
		List<Article> articles = articleService.queryAllArticle(pageNumber,categoryID);
		return JSON.toJSON(articles).toString();
	}
	/*
	 * ��ȡ�����������б�
	 */
	@RequestMapping(value="orderByViewCount",method = RequestMethod.POST)
	@ResponseBody
	public String orderByViewCount(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		List<Article> articles = articleService.orderByViewCount();
		return JSON.toJSON(articles).toString();
	}
	/*
	 * ���»�ȡ���¸�ƪ��
	 */
	@RequestMapping(value="queryArchivesGroupByMonth",method = RequestMethod.POST)
	@ResponseBody
	public String queryArchivesGroupByMonth(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		List<Map<String,String>> list = articleService.queryArchivesGroupByMonth();
		return JSON.toJSON(list).toString();
	}
	/*
	 * ��ȡ���¹鵵
	 */
	@RequestMapping(value="queryArchives",method = RequestMethod.POST)
	@ResponseBody
	public String queryArchives(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String date = String.valueOf(map.get("date"));
		List<Map<String,String>> archives = articleService.queryArchives(date);
		return JSON.toJSON(archives).toString();
	}
	/*
	 * ���������
	 */
	@RequestMapping(value="increaseViewCount",method = RequestMethod.POST)
	@ResponseBody
	public String increaseViewCount(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String articleid = String.valueOf(map.get("aid"));
		int aid = Integer.parseInt(articleid);
		Article article = articleService.getSpecificArticle(aid);
		articleService.increaseViewCount(article);
		
		return JSON.toJSON(article).toString();
	}
	/*
	 * ���ʱ��������
	 */
	@RequestMapping(value="increaseLikeCount",method = RequestMethod.POST)
	@ResponseBody
	public String increaseLikeCount(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String articleid = String.valueOf(map.get("aid"));
		int aid = Integer.parseInt(articleid);
		Article article = articleService.getSpecificArticle(aid);
		articleService.increaseLikeCount(article);
		return JSON.toJSON(article).toString();
	}
	/*
	 * ��ȡ��һƪ��һƪ
	 */
	 
	@RequestMapping(value="previousAndNext",method=RequestMethod.POST)
	@ResponseBody
	public String previousAndNext(@RequestBody Map<String,Object> map){
		
		String aidStr = String.valueOf(map.get("aid"));
		int aid = Integer.parseInt(aidStr);
		
		List<Article> pan = articleService.previousAndNext(aid);
		return JSON.toJSON(pan).toString();
		
	}
	/*
	 * ����aid��ȡ�ض������������б༭
	 */
	@RequestMapping(value="getSpecificArticle",method=RequestMethod.POST)
	@ResponseBody
	public String getSpecificArticle(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String aidStr = String.valueOf(map.get("aid"));
		int aid = Integer.parseInt(aidStr);
		Article article = articleService.getSpecificArticle(aid);
		String title = article.getTitle();
		request.setAttribute("title", title);
		return JSON.toJSON(article).toString();
		
	}
	/*
	 * ɾ��ָ������
	 */
	
	@RequestMapping(value="deleteSpecificArticle",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteSpecificArticle(@RequestBody Map<String,Object> map){
		String aidStr = String.valueOf(map.get("aid"));
		int aid = Integer.parseInt(aidStr);
		articleService.deleteSpecificArticle(aid);
		return map;
	}
	/*
	 * һ��������ȡ������ָ������
	 * aid draft
	 * 
	 */
	@RequestMapping(value="publishOrAbolish",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> publishOrAbolish(@RequestBody Map<String,Object> map){

		articleService.publishOrAbolish(map);
		return map;
	}
	/*
	 * ��֤��ǰ�ÿ��Ƿ�Ϊ��һ�η��ʣ�����ȡ����
	 */
	@RequestMapping(value="verifyip",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> verifyip(@RequestBody Map<String,String> map){
		
		String visitorIP = String.valueOf(map.get("visitorIP"));
		int i = articleService.getVisitorByIP(visitorIP);
		map = articleService.getRankVisitor(visitorIP);
		if(i!=0){
			map.put("ipIsExist", "true");
		}else{
			map.put("ipIsExist", "false");
		}
		return map;
	}
	
	/*
	 * ��ȡ�ÿ�����
	 */
	@RequestMapping(value="getVistorName",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getVistorName(@RequestBody Map<String,Object> map){
		
		String visitorIP = String.valueOf(map.get("visitorIP"));
		String visitorName = articleService.getVistorName(visitorIP);
		map.put("visitorName", visitorName);
		return map;
	}
}
