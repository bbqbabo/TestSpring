package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_main_check implements CommandAction{

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

        
        List arry = new eventEnterDao().mainEvent();
        
        String a = null;
        
        if(arry==null)
            a = "no";
        
        return a;
    }

    
    
}
