package service;

import java.sql.Connection;
import java.util.ArrayList;

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
		
	}*/			
	public Member memberList(String id){
		Member member = null;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			member = memberdao.memberList(id, connection);
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
	public int insertMember(Member member) {
		int checkId = 0;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			checkId = memberdao.insertMember(member, connection);
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
		return checkId;
	}
	public void updateMember(Member member) {
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.updateMember(member, connection);
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
	public Member updateFormMember(String sessionId) {
		Member member = null;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			member = memberdao.updateFormMember(sessionId, connection);
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
