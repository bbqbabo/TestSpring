package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Free;

import controller.CommandAction;
import dao.BoardDao_Free;


public class Free_Board_list implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("Free_Board_list");
		
		BoardDao_Free Dao=new BoardDao_Free();
		
		List<BoardDto_Free> dto=Dao.getList();
		
		request.setAttribute("dto", dto);
		
		return "board/Free_Board_list.jsp";
	}
}