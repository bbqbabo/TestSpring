package action;




import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.buyDto;
import controller.CommandAction;
import dao.buyDao;

public class buy_ex2_readAction implements CommandAction{
	
	@SuppressWarnings("unchecked")
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		String name=(String)request.getParameter("name");
		System.out.println("name="+name);
		buyDto bdto=new buyDto();
		buyDao bdao=new buyDao();
		bdto=bdao.readArticle(name);
		request.setAttribute("bdto", bdto);
		
		Vector<buyDto> v=new Vector<buyDto>();
		if(request.getSession().getAttribute("vlist")==null){//세션값이 있고없고
			v.add(bdto);
				
			
		}else{//세션값이 있고없고
			v=(Vector<buyDto>)request.getSession().getAttribute("vlist");
			System.out.println("v 사이즈: "+v.size());
			if(v.size()>=5){//벡터가 5이상일때
				for(int i=0;i<=3;i++){
					/*buyDto temp = v.get(i+1);
					v.remove(i+1);
					v.add(i, temp);*/
					v.set(i,v.get(i+1));
				}
				
				v.set(4, bdto);
				
			}else{//벡터가 5이상이아닐때
				v.add(bdto);
			}
			
		}
		
		for(buyDto bdto3:v){
			System.out.println("현재 리스트에 있는 목록(현재 readAction):"+bdto3.getName());
		}
		request.getSession().setAttribute("vlist",v);
		
		return "buy/buy_ex2_read.jsp";
	}

}
