package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.Chat_request;
import bean.User;
import controller.CommandAction;
import dao.ChatDao;
import dao.UserDao;
import file.JsonFile2;

public class ChatReqInsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("Id");
		int level = (int) request.getSession().getAttribute("Level");
		String subject = request.getParameter("req_subject");
		
		Chat_request req = new Chat_request();
		req.setReq_id(id);
		req.setReq_level(level);
		req.setResp_id("");
		req.setResp_level(0);
		req.setSubject(subject);
		req.setStatus(2);
		
		new ChatDao().insertChatRequest(req);
		
		List<Chat_request> chatReq_list = new ChatDao().readMyChatRequestList(id);	
		request.setAttribute("chatReq_list", chatReq_list);		
		
		JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		User user = new UserDao().updatePointAndLevel(false,id,"chat_point",json);
		request.getSession().setAttribute("Level", user.getLevel());
		request.getSession().setAttribute("Point", user.getPoint());
		
		return "chat/chat_request.jsp";
	}

}
