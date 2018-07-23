package service;

import java.sql.Connection;

public class MemberService {
	Connection connection = DriverUtil.driverDBcon();
	
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
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.insertMember(member, connection);
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
	}
	public void updateMember(Member member) {
		
	}
	public Member updateFormMember(int no) {
		Member member = null;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			member = memberdao.updateFormMember(no, connection);
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
		return member;
	}
}
