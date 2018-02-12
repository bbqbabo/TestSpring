package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;

public class Qna_Board_main implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("Q&A메인게시판으로 이동~");
		
	return "board/Qna_Board_main.jsp";
	}

}
