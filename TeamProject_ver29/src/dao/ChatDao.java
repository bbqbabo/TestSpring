package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Chat_request;
import bean.Chat_room;
import manager.SQLmanager;

public class ChatDao extends SQLmanager {

	// 상담 요청 리스트에 대한 dao작업
	@SuppressWarnings("unchecked")
	public List<Chat_request> readChatRequestList(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readChatRequestList",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Chat_request> readMyChatRequestList(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readMyChatRequestList",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int getAdminReqIdx(String id) {
		try {
			return (int) getSqlMap().queryForObject("IbatisChat.getAdminReqIdx",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int getChatRequestStatus(int idx) {
		try {
			return (int)getSqlMap().queryForObject("IbatisChat.getChatRequestStatus",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
		
	public void insertChatRequest(Chat_request req) {
		try {
			getSqlMap().insert("IbatisChat.insertChatRequest",req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateChatRequestStatus(Chat_request req) {
		try {
			getSqlMap().update("IbatisChat.updateChatRequestStatus",req);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void quitChatRequest(int idx) {
		try {
			getSqlMap().update("IbatisChat.quitChatRequest",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteChatRequest(int idx) {
		try {
			getSqlMap().update("IbatisChat.deleteChatRequest",idx);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 상담 요청 리스트에 대한 dao작업
	
	// 상담방에 대한 dao작업
	@SuppressWarnings("unchecked")
	public List<Chat_room> readChatRoom(Chat_room chat) {
		try {
			getSqlMap().update("IbatisChat.updateCheckMsg",chat);
			return getSqlMap().queryForList("IbatisChat.readChatRoom",chat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
		
	public void insertMessage(Chat_room chat) {
		try {
			getSqlMap().insert("IbatisChat.insertMessage",chat);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> readCheckMsg(String id) {
		try {
			return getSqlMap().queryForList("IbatisChat.readCheckMsg", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	// 상담방에 대한 dao작업
}
