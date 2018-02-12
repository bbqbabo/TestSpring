package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDto_Tip;
import controller.CommandAction;
import dao.BoardDao_Tip;

public class Tip_Board_list implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("Tip_Board_list");
		
		BoardDao_Tip Dao=new BoardDao_Tip();
		
		List<BoardDto_Tip> dto=Dao.getList();
		
		request.setAttribute("dto", dto);
		
		return "board/Tip_Board_list.jsp";
	}
}