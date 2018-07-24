package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookCodeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BookCode> bookCode(Connection connection) {
		ArrayList<BookCode> bookCodeList = new ArrayList();
		BookCode bookCode = null;
		
		String sql = "select * from bookcode";
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bookCode = new BookCode();
				bookCode.setBookCodeNo(rs.getInt("bookcode_no"));
				bookCode.setBookCodeName(rs.getString("bookcode_name"));
				bookCodeList.add(bookCode);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return bookCodeList;
	}
}
