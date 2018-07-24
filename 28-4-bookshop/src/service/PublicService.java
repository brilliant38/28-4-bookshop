//김호순, 김준영 2018.7.23.
package service;
import java.sql.*;
import java.util.*;

public class PublicService {
	Connection connection = DriverUtil.driverDBcon();
	
	// 도서 리스트 서비스
	public ArrayList<BookInfo> bookList(int currentPage, int pagePerRow, BookInfo bookinfo, String sel){
		ArrayList<BookInfo> bookList = null;
		
		try {
			connection.setAutoCommit(false);
			PublicDao publicdao = new PublicDao();
			bookList = publicdao.bookList(currentPage, pagePerRow, bookinfo.getBook().getSearchWord(), sel);
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
		return bookList;
	}
	//	주문 리스트 서비스
	public ArrayList<Orders> ordersList(){
		ArrayList<Orders> ordersList = null;
		try {
			connection.setAutoCommit(false);
			PublicDao publicdao = new PublicDao();
			ordersList = publicdao.ordersList();
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
		return ordersList;
	}
}
