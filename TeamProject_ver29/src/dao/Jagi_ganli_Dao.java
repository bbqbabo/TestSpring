package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import bean.Excercise_plan_menu;
import bean.User_Exercise_plan_mean_calorie_count;
import bean.User_dayCalorie;
import bean.User_excercise_exercise_name_count;
import bean.User_excercise_plan;
import manager.SQLmanager;

public class Jagi_ganli_Dao extends SQLmanager{
	
	
	
	
	@SuppressWarnings("unchecked")
	public List<Excercise_plan_menu> getExcercise_plan_menu(int category_num){
		
		try {
			return getSqlMap().queryForList("IbatisUser.getExcercise_plan_menu", category_num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//id 媛믪쑝濡� �븯�굹�쓽 寃곌낵留� 異쒕젰
	@SuppressWarnings("unchecked")
	public List<Excercise_plan_menu> getExcercise_plan_menu_by_id(int id){
		
		try {
			return getSqlMap().queryForList("IbatisUser.getExcercise_plan_menu_by_id",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public Object updateCount(int id){
		try {
			return getSqlMap().update("IbatisUser.updateCount",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Object insertUser_Excercise_Plan(User_excercise_plan uep){
		try{
			return getSqlMap().insert("IbatisUser.insertUser1_Excercise_Plan",uep);
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	//以묐났�맂 �궇吏쒕쭔 諛쏄린
	
	@SuppressWarnings("unchecked")
	public List<User_dayCalorie> user_excercise_plan_distinct_reg(String userId){
		
		try{
			
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_distinct_reg", userId);
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	}
	
	//�쑀��媛� �슫�룞�븳寃껋쨷 媛��옣 留롮��닚�쑝濡� 戮묎린
	@SuppressWarnings("unchecked")
	public List<User_excercise_exercise_name_count> user_excercise_plan_excercise_name_count(String userId){
	try{
			
			return getSqlMap().queryForList("IbatisUser.user_excercise_plan_excercise_name_count", userId);
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return null;
	
	}
	//�쑀���쓽 珥앹슫�룞�븳 �궇吏쒖뿉 ���븳 �룊洹� 移쇰줈由� ,�룊洹� count (�떆媛�)
	public User_Exercise_plan_mean_calorie_count user_excercise_plan_mean_calorie_count(String userId){
			try{
			
			return
					(User_Exercise_plan_mean_calorie_count)getSqlMap().
					queryForObject("IbatisUser.user_excercise_plan_mean_calorie_count", userId);
			}catch(Exception e){
			e.printStackTrace();
			}
	
		return null;
	
		
	}
	
	
	//�궇吏� �닚�쑝濡� 7媛� 戮묎린 
	@SuppressWarnings("unchecked")
	public List<User_excercise_plan> user_excercise_plan_id_regdate_desc(String userId){
		try{
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_regdate_desc", userId,0,7);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	
	
	//�궇吏쒖닚 珥� 移댁슫�듃
	@SuppressWarnings("unchecked")
	public HashMap<String, String> user_excercise_plan_id_regdate(HashMap<String, String> input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_regdate", input).size());
				return (HashMap<String, String>)getSqlMap().queryForObject("IbatisUser.user_excercise_plan_id_regdate", input);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	
	
	//MyPage tab jagi ganli
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_id_exercise_name_count_cte_reg(String input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_name_count_cte_reg", input).size());
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_exercise_name_count_cte_reg", input);
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	
	

	//user_excercise_plan_id_avgcal_avgcount �룊洹� 移댁슫�듃 , �룊洹� 移쇰줈由�
	@SuppressWarnings("unchecked")
	public HashMap<String, String> user_excercise_plan_id_avgcal_avgcount(String input){
		try{
			System.out.println("ads:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_id_avgcal_avgcount", input).size());
				return (HashMap<String, String>)getSqlMap().queryForObject("IbatisUser.user_excercise_plan_id_avgcal_avgcount", input);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			return null;
		
		}
	//centerMain2  user_excercise_plan_allcount_regdate
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> user_excercise_plan_allcount_regdate(String input){
		try{
			System.out.println("user_excercise_plan_allcount_regdate:"+getSqlMap().queryForList("IbatisUser.user_excercise_plan_allcount_regdate", input).size());
				return getSqlMap().queryForList("IbatisUser.user_excercise_plan_allcount_regdate", input,0,7);
			}catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	
	
	
	
}
