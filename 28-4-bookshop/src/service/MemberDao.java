/*2018-07-23 이응빈 and 박원우*/
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
	public Member memberMypage(String sessionId, Connection connection){
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
	//회원탈퇴 (작성자 : 이응빈)
	public void deleteMember(String sessionId, Connection connection) {
		String sql = "delete from member where member_id=?";
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
	//쇼핑카드 담기 (작성자 : 이응빈)
	public int insertShoppingCart(int bookNo, Book book, Member member, Connection connection) {
		String sql = "insert into shoppingcart(book_no, member_no, shoppingcart_amount, shoppingcart_price, shoppingcart_date) values(?, ?, ?, ?, now())";
		int login = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			pstmt.setInt(2, member.getMemberNo());
			pstmt.setInt(3, 1);
			pstmt.setInt(4, book.getBookPrice());
			
			login = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return login;
	}
	//Id를 이용하여 member_no 가져오기 (작성자 : 이응빈)
	public Member selectMemberNo(String sessionId, Connection connection) {
		Member member = null;
		String sql = "select * from member where member_id=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setMemberNo(rs.getInt("member_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return member;
	}
	//쇼핑카트 리스트 (작성자 : 이응빈)
	public ArrayList<ShoppingCart> selectShoppingCart(Member member, Connection connection) {
		ArrayList<ShoppingCart> list = new ArrayList<ShoppingCart>();
		ShoppingCart shoppingCart = null;
		String sql = "select * from shoppingcart where member_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, member.getMemberNo());
				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				shoppingCart = new ShoppingCart();
				shoppingCart.setShoppingcartNo(rs.getInt("shoppingcart_no"));
				shoppingCart.setBookNo(rs.getInt("book_no"));
				shoppingCart.setMemberNo(rs.getInt("member_no"));
				shoppingCart.setShoppingcartAmount(rs.getInt("shoppingcart_amount"));
				shoppingCart.setShoppingcartPrice(rs.getInt("shoppingcart_price"));
				shoppingCart.setShoppingcartDate(rs.getString("shoppingcart_date"));
				list.add(shoppingCart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return list;
	}
	//책의 가격 가져오기 (작성자 : 이응빈)
	public Book selectBookPrice(int bookNo, Connection connection) {
		Book book = null;
		String sql = "select * from book where book_no=?";
		try {
			pstmt =  connection.prepareStatement(sql);
			pstmt.setInt(1, bookNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new Book();
				book.setBookPrice(rs.getInt("book_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return book;
	}
	//쇼핑카드 수량 수정 (작성자 : 이응빈)
	public void updateShoppingCartAmount(int shoppingcartNo, int shoppingcartAmount, Book book, Connection connection) {
		String sql = "update shoppingcart set shoppingcart_amount=?, shoppingcart_price=? where shoppingcart_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, shoppingcartAmount);
			pstmt.setInt(2, shoppingcartAmount * book.getBookPrice());
			pstmt.setInt(3, shoppingcartNo);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	
	//쇼핑카트 목록 삭제 (작성자 : 이응빈)
	public void deleteShoppingCart(int shoppingcartNo, Connection connection) {
		String sql = "delete from shoppingcart where shoppingcart_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, shoppingcartNo);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	
	public void insertMemberInter(Member member, ArrayList<MemberInter> memberinter, Connection connection) {
		String sql = "select member_no from member where member_id=?";
		String sql2 = "insert into memberinter(member_no, bookcode_no) value(?, ?)";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				for(int i=0; i<memberinter.size(); i++) {
					pstmt = connection.prepareStatement(sql2);
					pstmt.setInt(1, rs.getInt("member_no"));
					pstmt.setInt(2, memberinter.get(i).getBookcodeNo());
					
					pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	//회원 주소 가져오기 (작성자 : 이응빈)
	public Member selectMemberAddr(int memberNo, Connection connection){
		Member member = null;
		String sql = "select * from member where member_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				member = new Member();
				member.setMemberAddr(rs.getString("member_addr"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return member;
	}
	//회원 장바구니 목록 가져오기 (작성자 : 이응빈)
	public ArrayList<ShoppingCart> selectShoppingCart(int memberNo, Connection connection){
		ArrayList<ShoppingCart> list = new ArrayList<ShoppingCart>();
		ShoppingCart shoppingCart = null;
		String sql = "select * from shoppingcart where member_no=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				shoppingCart = new ShoppingCart();
				shoppingCart.setBookNo(rs.getInt("book_no"));
				shoppingCart.setMemberNo(rs.getInt("member_no"));
				shoppingCart.setShoppingcartAmount(rs.getInt("shoppingcart_amount"));
				shoppingCart.setShoppingcartPrice(rs.getInt("shoppingcart_price"));
				list.add(shoppingCart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return list;
	}
	//회원 주문 (작성자 : 이응빈)
	public void insertOrders(Member member, ArrayList<ShoppingCart> list, Connection connection){
		String sql = "insert into orders(book_no, member_no, orders_amount, orders_price, orders_addr, orders_state, orders_date) values(?, ?, ?, ?, ?, ?, now())";
		try {
			for(int i=0; i<list.size(); i++) {
				ShoppingCart shoppingCart = list.get(i);
				
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, shoppingCart.getBookNo());
				pstmt.setInt(2, shoppingCart.getMemberNo());
				pstmt.setInt(3, shoppingCart.getShoppingcartAmount());
				pstmt.setInt(4, shoppingCart.getShoppingcartPrice());
				pstmt.setString(5, member.getMemberAddr());
				pstmt.setString(6, "배송 처리 중");
				
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	/*public Member selectMypage(int no) {
		
	}
	public void updateShoppingCart(int shoppingCartNo) {
		
	}
	public ArrayList<BookInfo>insertOrdersList(Bookinfo bookinfo){
		
	}
	public void insertQuestion(Qna qna) {
		
	}
	public void insertReview(Review review) {
		
	}*/		


}
