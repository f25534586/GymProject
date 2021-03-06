package com.gym.course.service;

import java.util.List;

import com.gym.course.model.CourseBean;
import com.gym.course.model.CourseCategoryBean;

public interface CoursesPerFormanceService {
	public int totalCategoryRevenue(String category);
	public int monthCategoryRevenue(String category);
	public int totalAllCategoriesRevenue();
	public int monthAllCategoriesRevenue();
	public List<CourseCategoryBean> getAllCategories();
	public List<CourseBean> getCoursesCountsByCategory(String category);
	public List<CourseBean> getMonthCoursesCountsByCategory(String category);
}
