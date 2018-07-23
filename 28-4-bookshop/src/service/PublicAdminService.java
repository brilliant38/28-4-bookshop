package service;
import java.sql.*;

public class PublicAdminService {
	Connection connection = DriverUtil.driverDBcon();
	
	public String loginAdmin(Admin admin) {
		String result = null;
		try {
			connection.setAutoCommit(false);
			PublicDao publicdao = new PublicDao();
			result = publicdao.loginAdmin(connection, admin);
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
