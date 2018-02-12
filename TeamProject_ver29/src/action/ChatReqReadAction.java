package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Chat_request;
import controller.CommandAction;
import dao.ChatDao;

public class ChatReqReadAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		
		int level = (int) request.getSession().getAttribute("Level");
		
		List<Chat_request> chatReq_list = null;
		String id = (String)request.getSession().getAttribute("Id");
		if(level >= 4) {
			chatReq_list = new ChatDao().readChatRequestList(id);	
		}
		else {
			chatReq_list = new ChatDao().readMyChatRequestList(id);	
		}
		request.setAttribute("chatReq_list", chatReq_list);
		System.out.println("사이즈 : " + chatReq_list.size());
		List<Integer> checkMsg_list = new ChatDao().readCheckMsg(id);
		request.setAttribute("checkMsg_list", checkMsg_list);
		
		return "chat/chat_request.jsp";
	}

}
