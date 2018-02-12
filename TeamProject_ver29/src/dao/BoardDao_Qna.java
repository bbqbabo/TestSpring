package dao;

import java.sql.SQLException;
import java.util.List;

import bean.BoardDto_Qna;

import manager.SQLmanager;

public class BoardDao_Qna extends SQLmanager{

	public List getList() {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.getList_Qna");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public BoardDto_Qna getRead(int num) {
		try {
			
			System.out.println("글번호는 "+num);
			
			return (BoardDto_Qna) getSqlMap().queryForObject("IbatisBoard.getRead_Qna",num);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return null;
	}

	public void Qna_update(BoardDto_Qna dto) {
		try {
			
			
			System.out.println("Qna_update dao에 들어왔습니다");
			getSqlMap().update("IbatisBoard.update_Qna",dto);
			System.out.println("수정이 완료되었습니다");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
}
