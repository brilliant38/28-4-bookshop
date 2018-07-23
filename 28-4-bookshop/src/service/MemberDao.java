/*2018-07-23 이응빈*/
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

public class MemberDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//사용자 입력 메서드
	public int insertMember(Member member, Connection connection) {
		int checkId = 0;
		String sql1 = "insert into member(member_id, member_pw, member_name, member_addr, member_point, member_date) value(?, ?, ?, ?, ?, now())";
		String sql2 = "select member_id from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql2);
			pstmt.setString(1, member.getMemberId());
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				pstmt = connection.prepareStatement(sql1);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberPw());
				pstmt.setString(3, member.getMemberName());
				pstmt.setString(4, member.getMemberAddr());
				pstmt.setInt(5, member.getMemberPoint());
				System.out.println(member.getMemberId() + "아이디 확인");
				System.out.println(member.getMemberPw() + "비번 확인");
				System.out.println(member.getMemberName() + "이름 확인");
				System.out.println(member.getMemberAddr() + "주소 확인");
				System.out.println(member.getMemberPoint() + "포인트 확인");
				
				checkId = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return checkId;
	}
	//업데이트 폼 메서드
	public Member updateFormMember(String sessionId, Connection connection) {
		Member member = null;
		String sql = "select * from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				member.setMemberName(rs.getString("member_name"));
				member.setMemberAddr(rs.getString("member_addr"));
				member.setMemberPoint(rs.getInt("member_point"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return member;
	}
	//업데이트 메서드
	public void updateMember(Member member, Connection connection) {
		String sql = "update member set member_pw=?, member_name=?, member_addr=? where member_id=? ";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, member.getMemberPw());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberAddr());
			pstmt.setString(4, member.getMemberId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	//멤버 리스트
	public Member memberList(String sessionId, Connection connection){
		Member member = null;
		String sql = "select * from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString("member_id"));
				member.setMemberPw(rs.getString("member_pw"));
				member.setMemberName(rs.getString("member_name"));
				member.setMemberAddr(rs.getString("member_addr"));
				member.setMemberPoint(rs.getInt("member_point"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return member;
	}
	//회원탈퇴
	public void deleteMember(String sessionId, Connection connection) {
		String sql = "delete * from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	//쇼핑카드 담기
	public void insertShoppingCart(ShoppingCart shoppingCart, String sessionId, Connection connection) {
		String sql1 = "insert into from shoppingcart(book_no, member_no, shoppingcart_amount, shoppingcart_price, shoppingcart_date) value(?, ?, ?, ?, now())";
		String sql2 = "select * from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql2);
			pstmt.setString(1, sessionId);
			
			pstmt.executeQuery();
			rs.next();
			
			pstmt = connection.prepareStatement(sql1);
			pstmt.setInt(1, shoppingCart.getBookNo());
			pstmt.setInt(2, rs.getInt("member_no"));
			pstmt.setInt(3, shoppingCart.getShoppingcartAmount());
			pstmt.setInt(4, shoppingCart.getShoppingcartPrice());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	//쇼핑카트 리스트
	public ShoppingCart selectShoppingCart(String sessionId, Connection connection) {
		ShoppingCart shoppingCart = null;
		String sql1 = "select * from member where member_id=?";
		String sql2 = "select * from shoppingcart where member_no=?";
		try {
			pstmt = connection.prepareStatement(sql1);
			pstmt.setString(1, sessionId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = connection.prepareStatement(sql2);
				pstmt.setInt(1, rs.getInt("member_no"));
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					shoppingCart = new ShoppingCart();
					shoppingCart.setShoppingcartNo(rs.getInt("shoppingcart_no"));
					shoppingCart.setBookNo(rs.getInt("book_no"));
					shoppingCart.setMemberNo(rs.getInt("member_no"));
					shoppingCart.setShoppingcartAmount(rs.getInt("shoppingcart_amount"));
					shoppingCart.setShoppingcartPrice(rs.getInt("shoppingcart_price"));
					shoppingCart.setShoppingcartDate(rs.getString("shoppingcart_date"));
				}
			}
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return shoppingCart;
	}
	
	//쇼핑카드 수량 수정
	public void updateShoppingCartAmount(int shoppingcartNo, int shoppingcartAmount, Connection connection) {
		String sql = "update shoppingcart set shoppingcart_amount=? where shoppingcart_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, shoppingcartAmount);
			pstmt.setInt(2, shoppingcartNo);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	
	/*public Member selectMypage(int no) {
		
	}
				

	public void deleteShoppingCart(int shoppingCartNo) {
		
	}
	public void updateShoppingCart(int shoppingCartNo) {
		
	}
	public ArrayList<BookInfo> insertOrders(Bookinfo bookinfo){
		
	}
	public ArrayList<BookInfo>insertOrdersList(Bookinfo bookinfo){
		
	}
	public void insertQuestion(Qna qna) {
		
	}
	public void insertReview(Review review) {
		
	}*/		


}
