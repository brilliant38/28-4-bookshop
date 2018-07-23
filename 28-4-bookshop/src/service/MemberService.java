package service;

import java.sql.Connection;

public class MemberService {
	DriverUtil driverUtil = new DriverUtil();
	Connection connection = driverUtil.driverDBcon();
	
/*	public void deleteShoppingCart(int shoppingCartNo) {
		
	}
	public void updateShoppingCart(int shoppingCartNo) {
		
	}								
	public void deleteMember(int no) {				
		
	}								
	public BookInfo insertShoppingCart(Bookinfo bookinfo) {				
		
	}				
	public ArrayList<BookInfo> insertOrders(Bookinfo bookinfo){				
		
	}
	public ArrayList<BookInfo>insertOrdersList(Bookinfo bookinfo){				
		
	}				
	public void insertQna(Qna qna) {				
		
	}
	public void insertReview(Review review) {				
		
	}				
	public ArrayList<Member> memberList(String id){			
		
	}*/								
	public void insertMember(Member member) {
		try {
			MemberDao memberdao = new MemberDao();
			memberdao.insertMember(member, connection);
	
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
	}
/*	public void updateMember(Member member) {
		
	}*/
}
