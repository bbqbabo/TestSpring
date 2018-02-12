package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_change implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        
        String img = request.getParameter("img");
        
        new eventEnterDao().mainChange(img);
        
        return null;
    }

    
    
}
