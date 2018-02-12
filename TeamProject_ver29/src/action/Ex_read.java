package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ex_postDto;
import controller.CommandAction;
import dao.Ex_Dao;

public class Ex_read implements CommandAction {

	
	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 	
		 	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Ex_Dao dao = new Ex_Dao();
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Ex_postDto dto = dao.readEx_read(num);
			
			request.setAttribute("dto", dto);
			
			
			
			return "ex_rkh/ex_read.jsp";
	 
	 }   
	
}
