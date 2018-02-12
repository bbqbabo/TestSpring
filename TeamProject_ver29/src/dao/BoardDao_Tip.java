package dao;

import java.util.List;
import java.sql.SQLException;

import bean.BoardDto_Tip;
import bean.User;
import manager.SQLmanager;

public class BoardDao_Tip extends SQLmanager{
	
	public List getList(){
		
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.getList_Tip");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public BoardDto_Tip getRead(int num){
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("글번호는 "+num);
			return (BoardDto_Tip) getSqlMap().queryForObject("IbatisBoard.getRead_Tip",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void Tip_update(BoardDto_Tip dto){
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("update dao에 들어왔습니다");
			getSqlMap().update("IbatisBoard.update_Tip",dto);
			System.out.println("수정이 완료되었습니다");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
