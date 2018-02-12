package action;




import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.buyDto;
import controller.CommandAction;
import dao.buyDao;

public class buy_ex2Action implements CommandAction{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
//		buyDto bdto=new buyDto();
		buyDao bdao=new buyDao();
		List<buyDto> v=bdao.get();
		request.setAttribute("name", v);
		return "buy/buy_ex2.jsp";
	}

}
