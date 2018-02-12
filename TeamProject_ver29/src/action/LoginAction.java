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
import file.JsonFile2;

public class LoginAction implements CommandAction{

   @SuppressWarnings("unchecked")
@Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // TODO Auto-generated method stub
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      
      String Id = request.getParameter("Id");
      String Password = request.getParameter("Password");
      
      int result = new UserDao().login(Id, Password);
      if(result == 1) {
         HttpSession session = request.getSession();
         session.setAttribute("Id", Id);   
         
         User user = new UserDao().getUser(Id);
         
         List<HashMap<String, String>> list2=new Ex_Dao().user_excercise_plan_id_exercise_cate_menu(user.getID());
         List<HashMap<String, String>> listWeek=new Jagi_ganli_Dao().user_excercise_plan_allcount_regdate(Id);
         System.out.print("list2 size:"+list2.size());
         if(list2.size() != 0) System.out.println(","+list2.get(0));
         	
      
         boolean gender = user.getJumin().charAt(7) % 2 == 1 ? true : false;
         
 	    JSONArray calList = new JSONArray();
 	   double sWeight = Math.round(user.getHeight() * 0.01 * user.getHeight() * 0.01 * (gender ? 22 : 21) * 10.0) / 10.0;
 	   DietDao ddao = new DietDao();
        if(ddao.getDietAnalysis(user.getID()).size() != 0) {
        	calList.addAll(ddao.calculateCalorieMyDiet(user.getID()));
            
        	String[] diet_time = ddao.getDietTime(user.getID()).split(":");
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

        session.setAttribute("list2", list2);
 	   
         session.setAttribute("Level", user.getLevel());
         session.setAttribute("Point", user.getPoint());
         session.setAttribute("Member_pic", user.getMember_pic());
         session.setAttribute("Nickname", user.getNickname());
         session.setAttribute("Height", user.getHeight());
         session.setAttribute("Weight", user.getWeight());
         session.setAttribute("abc", listWeek);
         session.setAttribute("Exp", user.getExp());
     	String img = new eventEnterDao().imgMain();
         session.setAttribute("imgMain", img);
         
         
         String Jumin=user.getJumin();
         String gender1;
         if(Jumin.charAt(8) == '1'){
            gender1="남성";
         }else{
            gender1="여성";
         }
         session.setAttribute("gender", gender1);
         
       int Gender__value;
       
       if(gender1 == "남성"){
          Gender__value=22;
       }else{
          Gender__value=21;
       }
       
       double Weight__Value_vision;
       double Weight__Value=user.getWeight() / user.getHeight() / 0.01 / user.getHeight() / 0.01 ;
       Weight__Value=(int)(Weight__Value*10);
       Weight__Value/=10;
       
       if(Weight__Value>40){
          Weight__Value_vision=40;
       }else{
          Weight__Value_vision=Weight__Value;
       }
       session.setAttribute("BMI_Value",Weight__Value);
       session.setAttribute("BMI_Value_vision",Weight__Value_vision);
       
       double Default__Weight=user.getHeight() * user.getHeight() * 0.0001 * Gender__value;
       Default__Weight=(int)(Default__Weight*10);
       Default__Weight/=10;
       session.setAttribute("Default__Weight", Default__Weight);
         
         
         JsonFile2 jf = new JsonFile2();
 		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
 		if(user.getLevel() < 4)	session.setAttribute("nextLevel", json.get("level"+(user.getLevel()+1)));
 		else if( 4 <= user.getLevel() && user.getLevel() <= 5) session.setAttribute("nextLevel", "상위 " + json.get("level5") + "명은 5레벨");
 		else if(user.getLevel() == 6) session.setAttribute("nextLevel", "∞");
 		
 		List<Integer> checkMsg_list = new ChatDao().readCheckMsg(Id);
     	int chatSum = 0;
     	for(int i : checkMsg_list) {
     		chatSum += i;
     	}
     	System.out.println(checkMsg_list.toString());
     	session.setAttribute("chatSum", chatSum);
         
         return "index.jsp"; // 寃곌낵 由ы꽩
      }
      else return String.valueOf(result); // 寃곌낵 由ы꽩
   }
}