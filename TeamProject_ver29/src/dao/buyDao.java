package dao;




import java.util.List;

import bean.buyDto;
import manager.SQLmanager;

public class buyDao extends SQLmanager{
	
	@SuppressWarnings("unchecked")
	public List<buyDto> get(){
		
		try{
			
			return getSqlMap().queryForList("IbatisEx_buy.getall");
		}catch(Exception e){
			System.out.println("get()에러: "+e);
		}
		
		return null;
	}
	
	
	public buyDto readArticle(String name){
	
		
		try{
			return (buyDto)getSqlMap().queryForObject("IbatisEx_buy.articleRead",name);
		}catch(Exception e){
			System.out.println("readArticle()에러: "+e);
		}
		
		return null;
	}
	
public void delArticle(String name){
	
		
		try{
			getSqlMap().delete("IbatisEx_buy.articleDel",name);
		}catch(Exception e){
			System.out.println("DelArticle()에러: "+e);
		}
		
		
	}
	
}


