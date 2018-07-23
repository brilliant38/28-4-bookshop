//김호순,김준영 2018.7.18.
package service;
import java.util.*;
import java.sql.*;
import service.BookInfo;

// 공용
public class PublicDao {
	
	// 로그인 회원
	public String loginMember(Connection Connection, Member member) {
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String result = null;
		try {
			pstmt = Connection.prepareStatement("select * from member where member_id=? and member_pw=?");
			pstmt.setString(1, member.getMemberId()); 
			pstmt.setString(2, member.getMemberPw());
			resultSet = pstmt.executeQuery(); 
			
			if(resultSet.next()) {
				result = "로그인 성공";
			}else {
				result = "로그인 실패";
			}

		}catch (Exception e) {
			// TODO: handle exception
		}finally{
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return result;
	}
	// 로그인 관리자
	public String loginAdmin(Connection Connection, Admin admin) {
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String result = null;
		try {
			pstmt = Connection.prepareStatement("select * from admin where admin_id=? and admin_pw=?");
			pstmt.setString(1, admin.getAdminID()); 
			pstmt.setString(2, admin.getAdminPw());
			resultSet = pstmt.executeQuery(); 
			
			if(resultSet.next()) {
				result = "관리자 로그인 성공";
			}else {
				result = "관리자 로그인 실패";
			}

		}catch (Exception e) {
			// TODO: handle exception
		}finally{
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return result;
	}
	// 도서 리스트, 페이징, 검색
	public ArrayList<BookInfo> bookList(int currentPage, int pagePerRow, String word){
		
		ArrayList<BookInfo> bookList = new ArrayList<BookInfo>();
		
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; 
		PreparedStatement pstmt2 = null; 
		ResultSet resultSet = null; 
		ResultSet resultSet2 = null; 
		
		try {
			conn = DriverUtil.driverDBcon();
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(word.equals("")) {
				pstmt2 = conn.prepareStatement("select count(book_no) from book");
				pstmt = conn.prepareStatement("select * from book order by book_no desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			} else {
				pstmt2 = conn.prepareStatement("select count(book_no) from book where book_name like ?");
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement("select * from book where book_name like ? order by book_no desc limit ?, ?");
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			
			resultSet2 = pstmt2.executeQuery();
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(book_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}
			
			resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				Book book = new Book();
				book.setBookNo(resultSet.getInt("book_no"));
				book.setBookCodeNo(resultSet.getInt("bookcode_no"));
				book.setPublisherNo(resultSet.getInt("publisher_no"));
				book.setBookName(resultSet.getString("book_name"));
				book.setBookAuthor(resultSet.getString("book_author"));
				book.setBookPrice(resultSet.getInt("book_price"));
				book.setBookPoint(resultSet.getInt("book_point"));
				book.setBookAmount(resultSet.getInt("book_amount"));
				book.setBookOut(resultSet.getString("book_out"));
				book.setBookDate(resultSet.getString("book_date"));
				book.setLastPage(lastPage);
				
				BookInfo bookInfo = new  BookInfo();
				bookInfo.setBook(book);
				bookList.add(bookInfo);
			}
			if(!resultSet.previous()) {
				Book book = new Book();
				book.setBookName("검색하신 도서가 없습니다");
				book.setLastPage(lastPage);
				
				BookInfo bookInfo = new  BookInfo();
				bookInfo.setBook(book);
				bookList.add(bookInfo);
			}
		}catch (SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (resultSet2 != null) try { resultSet2.close(); } catch(SQLException e) {} //resultSet2의 값이 null이 아닐 경우 resultSet2를 종료시켜줍니다.
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료시켜줍니다.
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e) {} //statement2의 값이 null이 아닐 경우 statement2를 종료시켜줍니다.
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 statement를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료시켜줍니다.
		}
		return bookList;
	}
	// 도서 상세 리스트
	public ArrayList<BookInfo> bookDetail(int bookNo){
		
		return null;
	}
	
	// 도서 구매 이력 리스트

	// QnA 리스트

	//	도서 상품 리뷰 리스트

}
