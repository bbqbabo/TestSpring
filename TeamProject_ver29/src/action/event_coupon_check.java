package action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandAction;
import dao.eventEnterDao;

public class event_coupon_check implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String coupon = request.getParameter("coupon");
		System.out.println(coupon);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("coupon", coupon);
		
		eventEnterDao dao = new eventEnterDao();
		
		String ck = dao.couponCheck(map);
		
		return ck;
	}

	
	
}
