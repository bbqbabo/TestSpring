package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import controller.CommandAction;
import dao.UserDao;
import dao.eventEnterDao;

public class usermodify implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("Id");
		UserDao dao=new UserDao();
		User dto= dao.getUser(id);
		
		request.setAttribute("dto", dto);
				
		List<HashMap<String, String>> arry = new ArrayList<HashMap<String, String>>();
		arry = new eventEnterDao().eventMypage(id);
		
		request.setAttribute("eventMypage", arry);
		
		return "user/modify_1.jsp";
	}
}
