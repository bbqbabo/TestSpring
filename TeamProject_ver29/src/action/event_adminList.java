package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.eventEnter;
import controller.CommandAction;
import dao.eventEnterDao;

public class event_adminList implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String subject = request.getParameter("subject");
		
		List<eventEnter> array = new ArrayList<eventEnter>();
		
		array = new eventEnterDao().adminList(subject);
		
		request.setAttribute("adminJoin",array);
		request.setAttribute("subject",subject);
		
		
		return "event/event_admin_list.jsp";
	}

	
	
}
