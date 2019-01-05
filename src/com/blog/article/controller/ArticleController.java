package com.blog.article.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.blog.article.dao.Article;
import com.blog.article.dao.Category;
import com.blog.article.dao.Message;
import com.blog.article.service.ArticleService;



@Controller
public class ArticleController {

	@Autowired
	@Qualifier("ArticleService")
	private ArticleService articleService;
	
	/*
	 * 保存为草稿或者直接发布，取决于data中的draft
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
		outputMD(map);
		return map;

	}
	/*
	 * 获取分类
	 */
	@RequestMapping(value="getAllCategory",method = RequestMethod.POST)
	@ResponseBody
	public String getAllCategory(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		
		List<Category> categories = articleService.getAllCategory();
		//JSONArray jsonArray = (JSONArray)JSON.toJSON(categories);
		return JSON.toJSON(categories).toString();
	}
	/*
	 * 获取文章列表
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
	 * 获取最多浏览文章列表
	 */
	@RequestMapping(value="/orderByViewCount",method = RequestMethod.POST)
	@ResponseBody
	public String orderByViewCount(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		List<Article> articles = articleService.orderByViewCount();
		return JSON.toJSON(articles).toString();
	}
	/*
	 * 按月获取文章各篇数
	 */
	@RequestMapping(value="queryArchivesGroupByMonth",method = RequestMethod.POST)
	@ResponseBody
	public String queryArchivesGroupByMonth(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		List<Map<String,String>> list = articleService.queryArchivesGroupByMonth();
		return JSON.toJSON(list).toString();
	}
	/*
	 * 获取文章归档
	 */
	@RequestMapping(value="queryArchives",method = RequestMethod.POST)
	@ResponseBody
	public String queryArchives(@RequestBody Map<String,Object> map,HttpServletRequest request){
		
		String date = String.valueOf(map.get("date"));
		List<Map<String,String>> archives = articleService.queryArchives(date);
		return JSON.toJSON(archives).toString();
	}
	/*
	 * 增加浏览量
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
	 * 点击时增加赞数
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
	 * 获取上一篇下一篇
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
	 * 根据aid获取特定文章用来进行编辑
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
	 * 删除指定文章
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
	 * 一键发布或取消发布指定文章
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
	 * 验证当前访客是否为第一次访问，并获取次序
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
	 * 获取访客名称
	 */
	@RequestMapping(value="getVistorName",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getVistorName(@RequestBody Map<String,Object> map){
		
		String visitorIP = String.valueOf(map.get("visitorIP"));
		String visitorName = articleService.getVistorName(visitorIP);
		map.put("visitorName", visitorName);
		return map;
	}
	/*
	 * 保存留言
	 */
	@RequestMapping(value="saveMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> saveMessage(@RequestBody Map<String,Object> map){
		
		String mess = String.valueOf(map.get("message"));
		String mname = String.valueOf(map.get("visitorName"));
		Date date = new Date();
		Message message = new Message(mname,mess,date);
		articleService.saveMessage(message);
		return map;
	}	
	/*
	 * 查询留言
	 */
	@RequestMapping(value="queryMessage",method=RequestMethod.POST)
	@ResponseBody
	public String queryMessage(@RequestBody Map<String,Object> map){
		
		List<Message> messages = articleService.queryMessage();
		return JSON.toJSON(messages).toString();
	}
	
	
	/*
	 * 查询站点信息
	 */
	@RequestMapping(value="querySiteInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> querySiteInfo(@RequestBody Map<String,String> map){
		
		Map<String,String> siteInfo = articleService.querySiteInfo();
		return siteInfo;
	}
	/*
	 * 生成md文件
	 * @map
	 */
	public void outputMD(Map<String,Object> map) {
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String title =String.valueOf(map.get("title"));
		
		String strTtitle = "title: "+ title+"\r\n";
		String strDate = "date: "+sdf.format(date)+"\r\n";
		String strArticleid = "articleID: "+String.valueOf(map.get("aid"))+"\r\n";
		String strCategory = "categories: "+String.valueOf(map.get("category_id"))+"\r\n";
		
		String strSummary = String.valueOf(map.get("summary"))+"\r\n<!--more-->\r\n";
		String strContent = String.valueOf(map.get("content"));
		String strInfo = "---\r\n";
		String str = strInfo
				+ strTtitle
				+ strArticleid
				+ strDate
				+ strCategory
			    + strInfo
			    + strSummary
			    + strContent;
		File file = new File("/root/blogs/"+sdf.format(date).substring(0, 11)+title+".md");
		try (FileOutputStream fop = new FileOutputStream(file)) {

            if (!file.exists()) {
                file.createNewFile();
              
            }
            byte[] contentInBytes = str.getBytes();

            fop.write(contentInBytes);
            fop.flush();
            fop.close();

            System.out.println("生成文件成功");

        } catch (IOException e) {
            e.printStackTrace();
            
        }


	}	
}
