package action;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.User;
import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Jagi_ganli_Dao;
import dao.UserDao;
import file.JsonFile2;

public class Jagi_ganli_insertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String 	userId=request.getParameter("userId");
		String excercise_name=request.getParameter("excercise_name");
		String calorie=request.getParameter("calorie");
		String height=request.getParameter("height");
		String weight=request.getParameter("weight");
		int	count=Integer.parseInt(request.getParameter("count"));
		String regdates=request.getParameter("regdates");
		String exercise_comment=request.getParameter("exercise_comment");
		String my_category_img=request.getParameter("my_category_img");
		String exercise_cate_menu=request.getParameter("exercise_cate_menu");
		
		
		String[] regary=regdates.split(",");	
	User_excercise_plan uep=new User_excercise_plan();
	uep.setIdx(0);
	uep.setUserId(userId);
	uep.setExcercise_name(excercise_name);
	uep.setCalorie(calorie);
	uep.setWeight(weight);
	uep.setHeight(height);
	uep.setCount(count);
	uep.setExercise_comment(exercise_comment);
	uep.setMy_category_img(my_category_img);
	uep.setExercise_cate_menu(exercise_cate_menu);
	
	// sum(count) >5이상이면 선택할수 없게
	// sum(count)+count>5이상이면 선택할수 없게 하기
	
	
	for(int i=0; i<regary.length;i++){
	uep.setRegdate(regary[i]);
	HashMap<String, String> input=new HashMap<>();
	input.put("userId", userId);
	input.put("regdate", regary[i]);
	//db에서 들고온 카운트 null값일떄 0으로하기
	HashMap<String, String> abcd=new Jagi_ganli_Dao().user_excercise_plan_id_regdate(input);
	if(abcd==null)abcd=new HashMap<>();

	
	
	int dbCount=(abcd.get("cte")==null)? 0:Integer.parseInt(String.valueOf(abcd.get("cte")));
	
			
			//if 해당 cte가 5보다 크면 입력되지 않게 하기
			
			if( dbCount>5){
				//그냥 cte가 5보다 클때
				return abcd.get("regdate");
			}else if( dbCount+count>5){
				//cte 5보다 작은데 추가 카운트 떄문에 숫자가 더 커질떄
				
				return abcd.get("regdate");
				
			}else{
				JsonFile2 jf = new JsonFile2();
				JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		        User user = null;
		        // 처음 운동계획을 만드는지 여부 판단하여 포인트 다르게 부여
		        if(new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(userId).size() == 0) {
		        	user = new UserDao().updatePointAndLevel(true,userId,"exer_point_first",json);
		        }else {
		        	user = new UserDao().updatePointAndLevel(true,userId,"exer_point",json);
		        }
		        request.getSession().setAttribute("Level", user.getLevel());
		        request.getSession().setAttribute("Point", user.getPoint());
		        request.getSession().setAttribute("Exp", user.getExp());
			        
		  		if(user.getLevel() < 4)	request.getSession().setAttribute("nextLevel", json.get("level"+(user.getLevel()+1)));
		  		else if(user.getLevel() < 6) request.getSession().setAttribute("nextLevel", "상위 " + json.get("level5") + "명");
		  		else request.getSession().setAttribute("nextLevel", "∞");
		        
		        new Jagi_ganli_Dao().insertUser_Excercise_Plan(uep);
			}
		//
		
	
	}
	//모든 for if 조건문이 다 충족 하지 않으면 count 가 들어가도됨
	
	
	
	
	
	
	
	System.out.println(userId+","+excercise_name+","+	calorie+","+	height+","+	weight+","+	count	+","+regdates+","+regary.length+","+exercise_cate_menu);
		
		
		return null;
	}

	
	
}
