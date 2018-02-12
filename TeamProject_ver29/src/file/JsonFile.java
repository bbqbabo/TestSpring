package file;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibatis.sqlmap.engine.type.SimpleDateFormatter;

import bean.User_excercise_plan;
import dao.Ex_Dao;

public class JsonFile {
	private String id;
	public JsonFile() {
		// TODO Auto-generated constructor stub
	}

	public JsonFile(String id) {
		// TODO Auto-generated constructor stub
	this.id=id;
	}
	
	
	@SuppressWarnings("unchecked")
	public void getJsonFile(String url) throws IOException,ParseException {
		List<User_excercise_plan> result=new Ex_Dao().ex_getUser_excercise_plan_userId_month(id);
		String filePath=url+"ab.json";
		SimpleDateFormat dt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		//dao 받
		
		//처음 들어올때  id랑 
		
		JSONObject obj = new JSONObject();

	/*	JSONObject obj2 = new JSONObject();
			
		JSONArray obj3=new JSONArray();
		obj2.put("id", "263");
		obj2.put("title", "This is warning class event with very long title to check how it fits to evet in day view");
		obj2.put("url", "http://www.example.com/");
		obj2.put("class", "event-warning");
		obj2.put("start", "1519862400000");
		obj2.put("end", "1519862400000");

		obj3.add(obj2);
		obj.put("result", obj3);
		*/
		JSONArray obj3=new JSONArray();
		obj.put("success", 1);
		
		for(int i=0; i<result.size();i++){
			String setReg=result.get(i).getRegdate()+" 01:01:01.111";
			Date date=dt.parse(setReg);
			
			System.out.println(date.getTime()+","+setReg);
			JSONObject obj2 = new JSONObject();
			
			obj2.put("id", "263");
			if(result.get(i).getCount()==3){
				obj2.put("title", 	result.get(i).getExcercise_name() +" 운동 3회");
				obj2.put("class", "event-warning");
				
			}else if(result.get(i).getCount()==2){
				obj2.put("title", 	result.get(i).getExcercise_name() +" 운동 2회");
					obj2.put("class", "event-info");
					
				
			}else if(result.get(i).getCount()==1){
				obj2.put("title", 	result.get(i).getExcercise_name() +" 운동 1회");
					obj2.put("class", "event-inverse");
				
			}
			obj2.put("url", "http://www.example.com/");
			obj2.put("start", ""+date.getTime());
			obj2.put("end", ""+date.getTime());

			obj3.add(obj2);
			
			
			
			
		}//리스트에잇는값
		obj.put("result",obj3);
		
		
		
		
		/*"success": 1,
		"result": [
			{
				"id": "293",
				"title": "This is warning class event with very long title to check how it fits to evet in day view",
				"url": "http://www.example.com/",
				"class": "event-warning",
				"start": "1362938400000",
				"end":   "1363197686300"
			}
		*/
		System.out.println(obj.toJSONString());
		
		
		BufferedWriter out=new BufferedWriter(new FileWriter(filePath));
		out.write(obj.toJSONString());
		out.close();
		
	
	}
}
