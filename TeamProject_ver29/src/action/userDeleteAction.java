package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandAction;
import dao.UserDao;

public class userDeleteAction implements CommandAction {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      
      String user_id=(String)request.getParameter("user_id");
      HttpSession session=request.getSession();
      
      System.out.println("바로 받은 user_id  "+request.getParameter("user_id"));
      System.out.println("바꾼 user_id  "+user_id);
      UserDao dao = new UserDao();
      session.invalidate();
      System.out.println("리무브되었다아");
      String result=dao.deleteUser(user_id);
      
      
      
      return result;
   }
   
   

}