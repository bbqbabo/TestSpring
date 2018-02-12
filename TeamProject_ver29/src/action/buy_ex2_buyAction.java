package action;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.buyDto;
import controller.CommandAction;
import dao.buyDao;

public class buy_ex2_buyAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String name=(String)request.getParameter("name");
		System.out.println("name="+name);
		buyDto bdto=new buyDto();
		buyDao bdao=new buyDao();
		bdto=bdao.readArticle(name);
		request.setAttribute("bdto", bdto);
		
		return "buy_ex2.jsp";
	}

}
