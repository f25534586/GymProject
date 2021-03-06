package com.gym.news.service;

import java.util.List;

import com.gym.coach.model.CoachBean;

import com.gym.news.model.NewsBean;
import com.gym.news.model.NewsPlaylistBean;


public interface NewsService {
	List<NewsBean>  getAllNews(); 
	List<String>  getAllNewsCategories();
	List<NewsBean>  getNewsByCategory(String category);
	public NewsBean getNewsById(int newsId);
	void  addNewsone(NewsBean newsone);
	CoachBean  getAuthorById(int coachId);
	List<CoachBean>  getAuthorList();
	void deleteNewsById(int newsId);
	List<NewsBean> getNewsByViews();
	
	public void update(NewsBean newsbean);

	
	public List<NewsBean> getSearchNews(String newskw);
	
	public List<NewsBean> getplaylistNews(String memberid);
	
	void saveintoplaylist(NewsPlaylistBean nb);
}
