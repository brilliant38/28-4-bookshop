package service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverUtil {
	public Connection driverDBcon() {
		Connection reconn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&characterEncoding=euckr";
			String dbId = "root";
			String dbPw = "java0000";
			
			reconn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		} catch (ClassNotFoundException |  SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reconn;
	}
}
