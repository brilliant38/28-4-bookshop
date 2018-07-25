package service;


import java.util.*;
import java.sql.*;
import service.*;

public class BookDetailService {
	 Connection conn = DriverUtil.driverDBcon();
	 
	public BookInfo selectBookDetail(int bookno) {
		 
		  BookInfo bookinfo = new BookInfo();
		  PublicDao publicDao = new PublicDao();
		  
		  Publisher publisher = new Publisher();
		  BookCode bookCode = new BookCode(); 
		  BookIntro bookintro = new BookIntro();
		  
		  
		  Book book = new Book();
		 
		  
		
		  
		  try {
			  conn.setAutoCommit(false);
			  
			  book = publicDao.selectbookDetail(bookno, conn); 
			  publisher = publicDao.selectpublisher(bookno,conn);
			  bookCode = publicDao.selectbookCode(bookno, conn);
			  bookintro = publicDao.selectbookintro(bookno,conn);
			  
			  bookinfo.setBook(book);
			  bookinfo.setPublisher(publisher);
			  bookinfo.setBookCode(bookCode);
			  bookinfo.setBookIntro(bookintro);
			  
			  conn.commit();
		  }catch(Exception e) {
			  try { 
				  conn.rollback();
			  } catch (SQLException el) {
				  el.printStackTrace();
			  }
			  e.printStackTrace();
			  
		  }finally {
			  if(conn != null)try {conn.close();}
			  catch(SQLException ex){ex.printStackTrace();}
			  
			  
		  }
		  return bookinfo;
	}
	
}
