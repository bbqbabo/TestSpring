package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import controller.CommandAction;
import dao.Jagi_ganli_Dao;

public class MyPage_Jagi_Ganli implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		 response.setCharacterEncoding("UTF-8");
		System.out.println("ad");
		String id=request.getParameter("userId");
		Gson son=new Gson();
		
		List<HashMap<String, String>> result=new Jagi_ganli_Dao().user_excercise_plan_id_exercise_name_count_cte_reg(id);
		HashMap<String, String> result2=new Jagi_ganli_Dao().user_excercise_plan_id_avgcal_avgcount(id);
		//System.out.println(result2);
		
		//System.out.println(result);
		return son.toJson(result)+"&"+son.toJson(result2);
	}

}
