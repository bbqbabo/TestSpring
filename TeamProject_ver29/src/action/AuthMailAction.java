package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import mail.MailAction;

public class AuthMailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String email = request.getParameter("email");
		MailAction mail = new MailAction();
		String authNum = mail.RandomNum();
		int result = mail.sendEmail(email, authNum);
		if(result == 0) {
			return "";
		}
		return String.valueOf(authNum);
	}

}
