/*2018-07-23 이응빈*/
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

public class MemberDao {
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
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
	//회원탈퇴
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
	//쇼핑카드 담기
	public int insertShoppingCart(int bookNo, String sessionId, Connection connection) {
		String sql1 = "insert into shoppingcart(book_no, member_no, shoppingcart_amount, shoppingcart_price, shoppingcart_date) values(?, ?, ?, ?, now())";
		String sql2 = "select * from member where member_id=?";
		String sql3 = "select * from book where book_no=?";
		int login = 0;
		try {
			pstmt = connection.prepareStatement(sql2);
			pstmt.setString(1, sessionId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt2 = connection.prepareStatement(sql3);
				pstmt2.setInt(1, bookNo);
				
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()) {
					pstmt3 = connection.prepareStatement(sql1);
					pstmt3.setInt(1, rs2.getInt("book_no"));
					pstmt3.setInt(2, rs.getInt("member_no"));
					pstmt3.setInt(3, 1);
					pstmt3.setInt(4, rs2.getInt("book_price"));
					login = pstmt3.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (rs2 != null) try { rs2.close(); } catch(SQLException e) {}
			if (pstmt3 != null) try { pstmt3.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return login;
	}
	//쇼핑카트 리스트
	public ArrayList<ShoppingCart> selectShoppingCart(String sessionId, Connection connection) {
		ArrayList<ShoppingCart> list = new ArrayList<ShoppingCart>();
		ShoppingCart shoppingCart = null;
		String sql1 = "select * from member where member_id=?";
		String sql2 = "select * from shoppingcart where member_no=?";
		try {
			pstmt = connection.prepareStatement(sql1);
			pstmt.setString(1, sessionId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt2 = connection.prepareStatement(sql2);
				pstmt2.setInt(1, rs.getInt("member_no"));
				
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					shoppingCart = new ShoppingCart();
					shoppingCart.setShoppingcartNo(rs2.getInt("shoppingcart_no"));
					shoppingCart.setBookNo(rs2.getInt("book_no"));
					shoppingCart.setMemberNo(rs2.getInt("member_no"));
					shoppingCart.setShoppingcartAmount(rs2.getInt("shoppingcart_amount"));
					shoppingCart.setShoppingcartPrice(rs2.getInt("shoppingcart_price"));
					shoppingCart.setShoppingcartDate(rs2.getString("shoppingcart_date"));
					list.add(shoppingCart);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (rs2 != null) try { rs2.close(); } catch(SQLException e) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return list;
	}
	//쇼핑카드 수량 수정
	public void updateShoppingCartAmount(int shoppingcartNo, int shoppingcartAmount, int bookNo, Connection connection) {
		String sql = "update shoppingcart set shoppingcart_amount=?, shoppingcart_price=? where shoppingcart_no=?";
		String sql2 = "select * from book where book_no=?";
		try {
			pstmt =  connection.prepareStatement(sql2);
			pstmt.setInt(1, bookNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, shoppingcartAmount);
				pstmt.setInt(2, shoppingcartAmount * rs.getInt("book_price"));
				pstmt.setInt(3, shoppingcartNo);
	
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	
	//쇼핑카트 목록 삭제
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
	/*public Member selectMypage(int no) {
		
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
