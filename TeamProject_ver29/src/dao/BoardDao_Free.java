package dao;

import java.sql.SQLException;
import java.util.List;

import bean.BoardDto_Free;
import bean.BoardDto_Tip;
import manager.SQLmanager;

public class BoardDao_Free extends SQLmanager{

	public List getList() {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("Free_Dao가 실행됨");
			
			return getSqlMap().queryForList("IbatisBoard.getList_Free");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
		
		
	}

	public BoardDto_Free getRead(int num) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("글번호는 "+num);
			return (BoardDto_Free) getSqlMap().queryForObject("IbatisBoard.getRead_Free",num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;

      }

	public void Free_update(BoardDto_Free dto) {
		try {
			//     리턴값 : queryForObject()메소드는 Object타입으로 리턴하기 떄문에 캐스팅해줘야함!!
			//     전달인자 1 : 자기가 사용할 SqlMap파일에 설정한 namespace명.사용할 sql쿼리id
			//     전달인자 2 : where절에 넘길 데이터!!
			
			System.out.println("update dao_Free에 들어왔습니다");
			getSqlMap().update("IbatisBoard.update_Free",dto);
			System.out.println("수정이 완료되었습니다");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
		
	}
