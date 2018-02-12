package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.User;
import controller.CommandAction;
import dao.ChatDao;
import dao.DietDao;
import dao.Ex_Dao;
import dao.Jagi_ganli_Dao;
import dao.UserDao;
import dao.eventEnterDao;

public class DefaultAction implements CommandAction{

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
	//login 안되어있을때  default page 로그인 되었다면 session받은거 이용하기
		//login .jsp 나 loginAction으로 그냥 들어갈시 requet.getparameter("id") 값 반영 안됫으므로 
		//반영된 상태에서 action으로 한번더 index로 호출하기
	HttpSession session=	request.getSession();
	String val= (String)session.getAttribute("Id");
	 User user = new UserDao().getUser(val);
	   
	if(val!=null){
		 // lsh category
		 List<HashMap<String, String>> list2=new Ex_Dao().user_excercise_plan_id_exercise_cate_menu(user.getID());
         List<HashMap<String, String>> listWeek=new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(val);
    	   session.setAttribute("abc", listWeek);
	    session.setAttribute("list2", list2);
	    
	    
	    boolean gender = user.getJumin().charAt(7) % 2 == 1 ? true : false;
	    
 	    JSONArray calList = new JSONArray();
 	    double sWeight = Math.round(user.getHeight() * 0.01 * user.getHeight() * 0.01 * (gender ? 22 : 21) * 10.0) / 10.0;
 	    DietDao ddao = new DietDao();
        if(ddao.getDietAnalysis(user.getID()).size() != 0) {
        	calList.addAll(ddao.calculateCalorieMyDiet(user.getID()));
        	
        	String[] diet_time = ddao.getDietTime(user.getID()).split(":");
        			System.out.println(ddao.getDietTime(user.getID()));
        	String diet_time2 = "";
        	if(Integer.parseInt(diet_time[0]) != 0) diet_time2 += diet_time[0] + "일 " + diet_time[1] + "시간 " + diet_time[2] + "분 ";
        	else {
        		if(Integer.parseInt(diet_time[1]) != 0) diet_time2 += diet_time[1] + "시간 " + diet_time[2] + "분 ";
        		else {
        			if(Integer.parseInt(diet_time[2]) != 0) diet_time2 += diet_time[2] + "분 ";
        		}
        	}
            session.setAttribute("diet_time", diet_time2 + diet_time[2] + "초 ");
        }
        else {
        	for(int i = 0; i < 5; i++) {
        		JSONObject j = new JSONObject();
        		if(i == 0) j.put("calorie", (int)Math.round(sWeight * 30));
        		else if(i == 1) j.put("calorie", (int)Math.round(sWeight * 40));
        		else j.put("calorie", 0);
        		calList.add(i, j);
        	}
        }
        session.setAttribute("sWeight", sWeight);
        session.setAttribute("calList", calList);
	}
	List<Integer> checkMsg_list = new ChatDao().readCheckMsg(val);
	int chatSum = 0;
	for(int i : checkMsg_list) {
		chatSum += i;
	}
	System.out.println(checkMsg_list.toString());
	session.setAttribute("chatSum", chatSum);
	
 	String img = new eventEnterDao().imgMain();
    session.setAttribute("imgMain", img);
	
	System.out.println("de:"+val);
		return "index.jsp";
	

	
	}
}
