package action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatDeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		new ChatDao().deleteChatRequest(idx);
		
		String id = (String) request.getSession().getAttribute("Id");
		List<Chat_request>chatReq_list = new ChatDao().readMyChatRequestList(id);	
		request.setAttribute("chatReq_list", chatReq_list);
		
		return "chat/chat_request.jsp";
	}

}
