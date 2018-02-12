package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import bean.Food;
import bean.User_diet;
import bean.Diet_analysis;
import manager.SQLmanager;

public class DietDao extends SQLmanager{
	public Food getFoodByName(String name) {
		try {
			return (Food) getSqlMap().queryForObject("IbatisDiet.getFoodByName",name);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Food> searchFoodList(String keyWord) {
		try {
			return getSqlMap().queryForList("IbatisDiet.searchFoodList",keyWord);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
		
	public void deleteUserDiet(String id) {
		try {
			getSqlMap().delete("IbatisDiet.deleteUserDiet",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
		
	public void insertUserDiet(User_diet data) {
		try {
			getSqlMap().insert("IbatisDiet.insertUserDiet",data);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<User_diet> getUserDiet(String Id) {
		try {
			return getSqlMap().queryForList("IbatisDiet.getUserDiet",Id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public void insertDietAnalysis(Diet_analysis data) {
		try {
			if(getDietAnalysis(data.getId()).size() < 5) 
				getSqlMap().insert("IbatisDiet.insertDietAnalysis",data);
			else
				getSqlMap().update("IbatisDiet.updateDietAnalysis",data);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Diet_analysis> getDietAnalysis(String Id) {
		try {
			return getSqlMap().queryForList("IbatisDiet.getDietAnalysis",Id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Map<String,Object>> calculateCalorieMyDiet(String id) {
		try {
			return (ArrayList<Map<String, Object>>) getSqlMap().queryForList("IbatisDiet.calculateCalorieMyDiet",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public String getDietTime(String id) {
		try {
			return (String) getSqlMap().queryForObject("IbatisDiet.getDietTime",id);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
