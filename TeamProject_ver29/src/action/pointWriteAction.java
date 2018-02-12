package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.CommandAction;
import file.JsonFile2;

public class pointWriteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String datas = request.getParameter("json");
		
		JsonFile2 jf = new JsonFile2();
		jf.writeJsonFile(request.getServletContext().getRealPath("upload")+"/point.json", datas);
		
		JSONObject json = jf.readJsonFile(request.getServletContext().getRealPath("upload")+"/point.json");
		request.setAttribute("json", json);
		
		return "admin.jsp";
	}

}
