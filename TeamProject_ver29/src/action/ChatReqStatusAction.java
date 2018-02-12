package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.CommandAction;
import dao.ChatDao;

public class ChatReqStatusAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		return String.valueOf(new ChatDao().getChatRequestStatus(idx));
	}

}
