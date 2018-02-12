package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Ex_Dao;

public class Ex_user_exercise_goalAction  implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		Gson gson=new Gson();
		System.out.println("들어옴");
		String carousel_index=request.getParameter("carousel_index");  //캐러셀로 구해진 idx 값
		User_excercise_plan uep=new Ex_Dao().ex_getUser_excercise_plan_idx(carousel_index);
		System.out.println(uep.getCalorie());
		String json=gson.toJson(uep);
		return json;
	}

	
	
}
