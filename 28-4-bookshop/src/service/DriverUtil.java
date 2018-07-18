package service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverUtil {
	public Connection driverDBcon() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		
		String dbUrl = "jdbc:mysql://localhost:3306/bookshop?" + "useUnicode=true&characterEncoding=euckr";
		String dbId = "root";
		String dbPw = "java0000";
		
		Connection reconn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		return reconn;
	}
}
