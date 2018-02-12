package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Ex_postDto;
import bean.User;
import bean.User_excercise_plan;
import controller.CommandAction;
import dao.Ex_Dao;
import dao.UserDao;

public class Ex_update implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		Ex_postDto dto = new Ex_postDto();
		
		Ex_Dao dao = new Ex_Dao();
		
		System.out.println(request.getParameter("num"));
		
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		
		System.out.println(num);
		System.out.println(subject);
		System.out.println(content);
		
		
		
		dao.UpdateEx_post(dto);
		
		
		
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("Id");
		
		UserDao userdao = new UserDao();
		
		User user = userdao.getUser(id);
		
		String pic = user.getMember_pic();
		
		Ex_Dao ex_dao = new Ex_Dao();
		
		
		List<Ex_postDto> list = ex_dao.getBoardList(id);
		List<User_excercise_plan> list1 = ex_dao.getSelfCheck(id);
		
		request.setAttribute("exercise_board_list", list);
		request.setAttribute("ex_selfcheck_list", list1);
		
		request.setAttribute("pic", pic);
		
		System.out.println("!!!!!! _ex_update");
		
		
		
		
		
		
		
		return "exercise_board.do";
	
	}

}
