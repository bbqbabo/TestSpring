package chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import bean.Chat_room;
import dao.ChatDao;

@ServerEndpoint(value="/broadcasting",configurator = GetHttpSessionConfigurator.class)
public class Chat {

	private HttpSession hSession;
	private static Map<String,Session> clients = Collections.synchronizedMap(new HashMap<String,Session>());
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		synchronized (clients) {
			String from_id = (String)hSession.getAttribute("Id");
			String to_id = (String)hSession.getAttribute("to_id");
			int req_idx = (int)hSession.getAttribute("req_idx");
			int from_level = (int)hSession.getAttribute("from_level");
			
			Chat_room chat = new Chat_room();
			chat.setReq_idx(req_idx);
			chat.setFrom_id(from_id);
			chat.setFrom_level(from_level);
			chat.setTo_id(to_id);
			chat.setMessage(message);
			new ChatDao().insertMessage(chat);

			Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat f = new SimpleDateFormat("yyyy. M. dd a hh:mm:ss");
			if(clients.get(String.valueOf(req_idx) + "%" + to_id) != null) {
				clients.get(String.valueOf(req_idx) + "%" + to_id).getBasicRemote()
				.sendText("<div class='receiMessage'><img src='images/level/${sessionScope.Level }.jpg' style='width:22px; height:22px;'><span><b>" + from_id + "</b></span><p>" + message + "</p><span class='date'>" + f.format(date) + "</span></div>");
			}
		}
	}

	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		// Add session to the connected sessions set
		hSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		clients.put(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"), session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(String.valueOf((int)hSession.getAttribute("req_idx")) + "%" + (String)hSession.getAttribute("Id"));
	}
}