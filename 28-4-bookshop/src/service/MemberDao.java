package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	PreparedStatement pstmt = null;
	public void insertMember(Member member, Connection connection) {
		String sql = "insert into member(member_id, member_pw, member_name, member_addr, member_point, member_date) value(?, ?, ?, ?, ?, now())";
		try {
			pstmt = connection.prepareStatement(sql);
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
			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
	}
	/*public Member selectMypage(int no) {
		
	}
	public Member updateFormMember(int no) {
		
	}
	public void updateMember(Member member) {
		
	}
	public void deleteMember(int no) {
		
	}				
	public BookInfo insertShoppingCart(Bookinfo bookinfo) {
		
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
		
	}		
	public ArrayList<Member> memberList(String id){
		
	}
*/
}
