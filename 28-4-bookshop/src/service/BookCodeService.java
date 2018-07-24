package service;

import java.sql.Connection;
import java.util.ArrayList;

public class BookCodeService {
	Connection connection = DriverUtil.driverDBcon();
	
	public ArrayList<BookCode> bookCode(){
		ArrayList<BookCode> bookCodeList = null;
		try {
			connection.setAutoCommit(false);
			BookCodeDao bookcodedao = new BookCodeDao();
			bookCodeList = bookcodedao.bookCode(connection);
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
		
		return bookCodeList;
	}
}
