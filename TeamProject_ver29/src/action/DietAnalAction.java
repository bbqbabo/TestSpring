package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.User_diet;
import controller.CommandAction;
import dao.DietDao;

public class DietAnalAction implements CommandAction {

	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("Id");
        
        JSONObject json = new JSONObject();
        
        JSONArray jsonArr = new JSONArray();
        jsonArr.addAll(new DietDao().calculateCalorieMyDiet(id));
        if(jsonArr.size() == 0) {
        	return "no";
        }
        json.put("analList",jsonArr);
        
        List<User_diet> dietList = new DietDao().getUserDiet(id);
        JSONArray breakList = new JSONArray();
        JSONArray lunchList = new JSONArray();
        JSONArray dinnerList = new JSONArray();
        for(User_diet diet : dietList) {
        	Map<String , Object> map = new HashedMap<String,Object>();
    		map.put("Menu",diet.getMenu());
    		map.put("Count",diet.getCount());
    		
        	if(diet.getCategory().equals("아침")) {
        		breakList.add(map);
        	}
        	else if(diet.getCategory().equals("점심")) {
        		lunchList.add(map);
        	}
        	else if(diet.getCategory().equals("저녁")) {
        		dinnerList.add(map);
        	}
        }
        json.put("breakList",breakList);
        json.put("lunchList",lunchList);
        json.put("dinnerList",dinnerList);
        
        String results = DietAnalysisAction.analysisValues(jsonArr);
        json.put("results", results);
        
        return json.toJSONString();
	}
}
