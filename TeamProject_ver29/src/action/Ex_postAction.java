package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Ex_postDto;
import controller.CommandAction;
import dao.Ex_Dao;


//create table ex_post(
//num int primary key auto_increment,
//subject varchar(30) not null,
//content varchar(100) not null,
//regdate timestamp null default current_timestamp
//);


public class Ex_postAction implements CommandAction{

	 public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 	
		 	request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Ex_postDto dto = new Ex_postDto();
			
			String id = (String)request.getSession().getAttribute("Id");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
	
		
			dto.setId(id);
			dto.setSubject(subject);
			dto.setContent(content);
			

			Ex_Dao dao = new Ex_Dao();
			
			dao.insertEx_post(dto);
			
			System.out.println("출력테스트");
			System.out.println(request.getParameter("subject"));
			System.out.println(request.getParameter("content"));
						
			return "exercise_board.do";
	 
			
	 }   
	
	
	
	
	
	
	
	
}
