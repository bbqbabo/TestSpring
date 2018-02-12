package action;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.buyDao;

public class buy_ex2_delAction implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String name=(String)request.getParameter("name");
		System.out.println("delete page/ name="+name);
	
		buyDao bdao=new buyDao();
		bdao.delArticle(name);
		
		
		return "buy/buy_ex2_delete.jsp";
	}

}
