package action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import bean.User;
import bean.eventEnter;
import controller.CommandAction;
import dao.UserDao;
import dao.eventEnterDao;
import file.JsonFile2;

public class event_gambleAction implements CommandAction {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("Id");
        String subject = request.getParameter("subject");
        String today = request.getParameter("today");
        int getPoint = Integer.parseInt(request.getParameter("getPoint"));
       String me=request.getParameter("me");
       String result=request.getParameter("result");
        Boolean bn = true;
        System.out.println(id+" "+subject+" "+today+" "+getPoint+" "+me+" "+result);
        eventEnter dto = new eventEnter();
        
        dto.setId(id);
        dto.setSubject(subject);
        
        new eventEnterDao().daily(dto);
        
        
//        HashMap<String, Object> getPoin = new HashMap<String, Object>();
//        getPoin.put("ID", id);
//        getPoin.put("Point", getPoint);
//        
//        new eventEnterDao().plusPoint(getPoin);
        
        if(getPoint<0){
        	bn = false;
        	getPoint= -getPoint;
        };
        
        
        //id me result
        	System.out.println("asdfsda"+getPoint + bn);
        JsonFile2 jf = new JsonFile2();
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
        User user = new UserDao().updatePointAndLevel(bn,id,getPoint,json);
        request.getSession().setAttribute("Level", user.getLevel());
        request.getSession().setAttribute("Point", user.getPoint());
        request.getSession().setAttribute("Exp", user.getExp());
       
        HashMap<String, String> gck = new HashMap<String, String>();
       
        
        gck.put("id", id);
        gck.put("dateEnter",today);
        gck.put("subject", subject);
        Gson g=new Gson();
        
        String point = new eventEnterDao().pointCheck(id);
        int poin = Integer.parseInt(point);
        int ck = new eventEnterDao().gambleCheck(gck);
        
        gck.clear();
        gck.put("id", id);
        gck.put("me", me);
        gck.put("result", result);
        
        new eventEnterDao().gambleResult(gck);
        List<HashMap<String, String>>	result1=new eventEnterDao().gambleResult1(id);
        
        
        
        
        
        
        String x3=g.toJson(result1);
        request.setAttribute("point", poin);
        request.setAttribute("ck", ck);
        
        System.out.println("값 반영:"+x3);
        
        
        
        return x3+"|"+point+"|"+ck;
    }

    
    
}
