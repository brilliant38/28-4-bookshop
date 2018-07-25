/*2018-07-23 이응빈*/
package service;

import java.sql.Connection;
import java.util.ArrayList;

public class MemberService {
	Connection connection = DriverUtil.driverDBcon();
	
/*	
	public void updateShoppingCart(int shoppingCartNo) {
		
	}								
	
	public ArrayList<BookInfo>insertOrdersList(Bookinfo bookinfo){				
		
	}				
	public void insertQna(Qna qna) {				
		
	}
	public void insertReview(Review review) {				
		
	}*/			
	public Member memberMypage(String id){
		Member member = null;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			member = memberdao.memberMypage(id, connection);
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
	public int insertMember(Member member, ArrayList<MemberInter> memberinter) {
		int checkId = 0;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			checkId = memberdao.insertMember(member, connection);
			memberdao.insertMemberInter(member, memberinter, connection);
			
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
	//회원탈퇴
	public void deleteMember(String sessionId) {				
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.deleteMember(sessionId, connection);
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
	//쇼핑카트 담기
	public int insertShoppingCart(int bookNo, String sessionId) {
		int login = 0;
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			login = memberdao.insertShoppingCart(bookNo, sessionId, connection);
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
		return login;
	}
	//쇼핑카트 리스트
	public ArrayList<ShoppingCart> selectShoppingCart(String sessionId) {
		ArrayList<ShoppingCart> list = new ArrayList<ShoppingCart>();
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			list = memberdao.selectShoppingCart(sessionId, connection);
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
		return list;
	}
	//쇼핑카트 수량 수정
	public void updateShoppingCartAmount(int shoppingcartNo, int shoppingcartAmount, int bookNo) {				
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.updateShoppingCartAmount(shoppingcartNo, shoppingcartAmount, bookNo, connection);
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
	//쇼핑카트 목록 삭제
	public void deleteShoppingCart(int shoppingcartNo) {
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.deleteShoppingCart(shoppingcartNo, connection);
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
	//회원주문
	public void insertOrders(int memberNo){
		try {
			connection.setAutoCommit(false);
			MemberDao memberdao = new MemberDao();
			memberdao.insertOrders(memberNo, connection);
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
}