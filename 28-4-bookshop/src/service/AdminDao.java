package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDao {
	// 회원 정보를 삭제시키는 메소드

	//배송상황을  update 하는 메소드
	public void updateOrdersState(Orders orders,Connection connection) {
		System.out.println(" 01 updateOrdersState <- 확인");
			
		PreparedStatement preparedStatement = null;
		String updateOrdersStateSql = "UPDATE";
		
		try {
			preparedStatement = connection.prepareStatement(updateOrdersStateSql); 
			
			preparedStatement.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
