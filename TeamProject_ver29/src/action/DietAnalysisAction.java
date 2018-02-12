package action;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.Diet_analysis;
import bean.Food;
import bean.User;
import bean.User_diet;
import controller.CommandAction;
import dao.DietDao;
import dao.UserDao;
import file.JsonFile2;

public class DietAnalysisAction implements CommandAction {

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String[] breakFast = request.getParameterValues("breakFast");
        String[] breakFastCount = request.getParameterValues("breakFastCount");
        String[] lunch = request.getParameterValues("lunch");
        String[] lunchCount = request.getParameterValues("lunchCount");
        String[] dinner = request.getParameterValues("dinner");
        String[] dinnerCount = request.getParameterValues("dinnerCount");

        int totalBreakCal = Integer.parseInt(request.getParameter("totalBreakCal"));
        int totalLunchCal = Integer.parseInt(request.getParameter("totalLunchCal"));
        int totalDinnerCal = Integer.parseInt(request.getParameter("totalDinnerCal"));
        
        // 유저가 선택한 음식들에 대한 영양소를 합산
        List<Double> breakFastValues = sumFoodValues(breakFast, breakFastCount);
        List<Double> lunchValues = sumFoodValues(lunch, lunchCount);
        List<Double> dinnerValues = sumFoodValues(dinner, dinnerCount);
          
        // 유저 주민번호로 나이와 성별 확인
        String id = (String) request.getSession().getAttribute("Id");
        String jumin = new UserDao().getUser(id).getJumin();
        
        Date date = new Date(System.currentTimeMillis());
        @SuppressWarnings("deprecation")
		int age = (date.getYear() % 100 + 100) - Integer.parseInt(jumin.substring(0, 2));
        boolean gender = jumin.charAt(7) % 2 == 1 ? true : false;
        double height = (double) request.getSession().getAttribute("Height");
        double standardweight = height * 0.01 * height * 0.01 * (gender ? 22 : 21);
        
        // 유저 정보를 기준으로 표준 영양소 계산
        List<Double> standardValues = calculateStandardValues(age, gender, standardweight);

		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
        User user = null;
        // 처음 식단을 만드는지 여부 판단하여 포인트 다르게 부여
        if(new DietDao().getUserDiet(id).size() == 0) {
        	user = new UserDao().updatePointAndLevel(true,id,"diet_point_first",json);
        }else {
        	user = new UserDao().updatePointAndLevel(true,id,"diet_point",json);
        	new DietDao().deleteUserDiet(id);
        }
        request.getSession().setAttribute("Level", user.getLevel());
        request.getSession().setAttribute("Point", user.getPoint());
        request.getSession().setAttribute("Exp", user.getExp());
        
  		if(user.getLevel() < 4)	request.getSession().setAttribute("nextLevel", json.get("level"+(user.getLevel()+1)));
  		else if(user.getLevel() < 6) request.getSession().setAttribute("nextLevel", "상위 " + json.get("level5") + "명");
  		else request.getSession().setAttribute("nextLevel", "∞");
        
        // DB에 유저 식단 저장
        insertUserDietDB(id, "아침", breakFast, breakFastCount);
        insertUserDietDB(id, "점심", lunch, lunchCount);
        insertUserDietDB(id, "저녁", dinner, dinnerCount);
              
         // DB에 분석결과 저장
        insertAnalysisDB(id, "필요", (int)standardweight, standardValues);
        insertAnalysisDB(id, "아침", totalBreakCal, breakFastValues);
        insertAnalysisDB(id, "점심", totalLunchCal, lunchValues);
        insertAnalysisDB(id, "저녁", totalDinnerCal, dinnerValues);
        
        // 분석결과 정리해서 가져옴
        JSONArray jsonArr = new JSONArray(); 
        jsonArr.addAll(new DietDao().calculateCalorieMyDiet(id));
        // 분석
        String results = analysisValues(jsonArr);
        request.setAttribute("datas", jsonArr);
        request.setAttribute("results", results);
        
        return "diet/diet_analysis.jsp";
	}

	public List<Double> sumFoodValues(String[] menu, String[] count) {
		
		List<Double> values = new ArrayList<Double>();
		// 탄수화물, 단백질, 지방
		
		double tan = 0, dan = 0, ji = 0;
        for(int i = 0; i < menu.length; i++) {
        	String name = menu[i].split("  ")[0];
        	Food food = new DietDao().getFoodByName(name);
        	tan += food.getTan() * Double.parseDouble(count[i]);
        	dan += food.getDan() * Double.parseDouble(count[i]);
        	ji += food.getJi() * Double.parseDouble(count[i]);
        }
        
        values.add((double)Math.round(tan*10.0)/10.0);
        values.add((double)Math.round(dan*10.0)/10.0);
        values.add((double)Math.round(ji*10.0)/10.0);
        
        return values;
	}
	
	public List<Double> calculateStandardValues(int age, boolean gender, double standardweight) {
		
		List<Double> values = new ArrayList<Double>(); 
		// 탄수화물(보통), 탄수화물(격함), 단백질(보통), 단백질(격함), 지방(보통), 지방(격함)
		
		int normal = 30;
		int hard = 40;
		
		double[] cal = {standardweight * normal, standardweight * hard};
		
		for(int i = 0; i < 2; i++) {
			
			// 탄수화물
			values.add((double) Math.round(cal[i] * 0.6 / 4));
		}
		for(int i = 0; i < 2; i++) {
			
			// 단백질
			switch (Math.floorDiv(age,10)) {
				case 1:
				case 2:
					values.add(gender ? 65.0 : 55.0);
					break;
				case 3:
				case 4:
				case 5:
					values.add(gender ? 60.0 : 50.0);
					break;
				case 6:
				case 7:
					values.add(gender ? 55.0 : 45.0);
					break;
			}
		}
		
		for(int i = 0; i < 2; i++) {
			// 지방
			values.add((double) Math.round(cal[i] * 0.2 / 9));
		}
		
		return values;
	}
	
	@SuppressWarnings("unchecked")
	public static String analysisValues(JSONArray list) {

		String results = "";

		Map<String,Object> normal = (Map<String, Object>) list.get(0);
		Map<String,Object> hard = (Map<String, Object>) list.get(1);
		Map<String,Object> breakfast = (Map<String, Object>) list.get(2);
		Map<String,Object> lunch = (Map<String, Object>) list.get(3);
		Map<String,Object> dinner = (Map<String, Object>) list.get(4);
		
		String[] key = {"calorie","tan", "dan", "ji"};
		String[] element = {"탄수화물", "단백질", "지방"};
		
		for(int i = 0; i < key.length; i++) {
			double normalValue, hardValue, myValue;
			if(i == 0) {
				normalValue = (int) normal.get(key[i]);
				hardValue = (int) hard.get(key[i]);
				myValue = (int) breakfast.get(key[i]) + (int) lunch.get(key[i]) + (int) dinner.get(key[i]);
			}
			else {
				normalValue = (double) normal.get(key[i]);
				hardValue = (double) hard.get(key[i]);
				myValue = (double) breakfast.get(key[i]) + (double) lunch.get(key[i]) + (double) dinner.get(key[i]);
			}
			if(hardValue < myValue) {
				if(i == 0) results += "내 식단이 <b><font color='red'>표준체중 필요 칼로리보다 높습니다.</font></b> 식단의 칼로리를 좀 더 줄일 필요가 있습니다.<br>";
				else results += "<b>" + element[i-1] + "</b> 이 <b><font color='red'>과다한 식단</font></b>입니다.  ";
			}
			else if(normalValue <= myValue && myValue <= hardValue) {
				if(i == 0) results += "내 식단이 <b><font color='green'>표준체중 필요 칼로리에 해당합니다.</font></b> 운동 강도에 따라 칼로리를 조절하세요.<br>";
				else results += "<b>" + element[i-1] + "</b> 이 <b><font color='green'>적절한 식단</font></b>입니다.  ";
			}
			else if(myValue < normalValue) {
				if(i == 0) results += "내 식단이 <b><font color='blue'>표준체중 필요 칼로리보다 부족합니다.</font></b> 식단의 칼로리를 좀 더 늘릴 필요가 있습니다.<br>";
				else results += "<b>" + element[i-1] + "</b> 이 <b><font color='blue'>부족한 식단</font></b>입니다.  ";
			}
		}
				
		return results;
	}
	
	public void insertUserDietDB(String id, String category, String[] menu, String[] count) {
		for(int i = 0; i < menu.length; i++) {
			User_diet data = new User_diet();
			data.setId(id);
			data.setCategory(category);
			data.setMenu(menu[i]);
			data.setCount(Double.parseDouble(count[i]));
			
			new DietDao().insertUserDiet(data);
		}
	}
	
	public void insertAnalysisDB(String id, String category, int cal, List<Double> datas) {
 
		// 아이디, 카테고리, 칼로리, 탄수화물, 단백질, 지방
        Diet_analysis data = new Diet_analysis();
    	data.setId(id);
    	if(category.equals("필요")) {
    		for(int i = 0; i < 2; i++) {
    	    	if(i == 0) {
    	    		data.setCategory("필요(보통)");
    	    		data.setCalorie(cal*30);
    	    	}
    	    	else {
    	    		data.setCategory("필요(강함)");
    	    		data.setCalorie(cal*40);
    	    	}
    	    	
    	    	data.setTan(datas.get(i));
    	    	data.setDan(datas.get(i+2));
    	    	data.setJi(datas.get(i+4));
    	    	new DietDao().insertDietAnalysis(data);
    		}
    	}
    	else {
	    	data.setCategory(category);
	    	data.setCalorie(cal);
	    	data.setTan(datas.get(0));
	    	data.setDan(datas.get(1));
	    	data.setJi(datas.get(2));
	    	new DietDao().insertDietAnalysis(data);
    	}
	}
}
