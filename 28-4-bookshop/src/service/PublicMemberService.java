package service;
import java.sql.*;

public class PublicMemberService {
	Connection connection = DriverUtil.driverDBcon();
	
	public String loginMember(Member member) {
		String result = null;
		try {
			connection.setAutoCommit(false);
			PublicDao publicdao = new PublicDao();
			result = publicdao.loginMember(connection, member);
			connection.commit();
		} catch (Exception e) { 
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		} finally {
			if (connection != null) try { connection.close(); } catch(Exception e) {}	
		}
		return result;		
	}
}
