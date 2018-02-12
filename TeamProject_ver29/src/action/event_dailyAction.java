package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import bean.User;
import bean.eventEnter;
import controller.CommandAction;
import dao.UserDao;
import dao.eventEnterDao;
import file.JsonFile2;

public class event_dailyAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        eventEnter dto = new eventEnter();
        
        System.out.println("a값"+request.getParameter("point"));
        dto.setId(request.getParameter("id"));
        dto.setSubject(request.getParameter("subject"));
        
        new eventEnterDao().daily(dto);
        
//        HashMap<String, Object> point = new HashMap<String, Object>();
        int poin = Integer.parseInt(request.getParameter("point").equals("") ? "0": request.getParameter("point"));
        String id = request.getParameter("id");
//        point.put("ID", id);
//        point.put("Point", poin);
        
//        new eventEnterDao().plusPoint(point);
        JsonFile2 jf = new JsonFile2();
 		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
         User user = new UserDao().updatePointAndLevel(true,id,poin,json);
         request.getSession().setAttribute("Level", user.getLevel());
         request.getSession().setAttribute("Point", user.getPoint());
         request.getSession().setAttribute("Exp", user.getExp());
         
        
        return "event/event_daily.jsp";
    }

}
