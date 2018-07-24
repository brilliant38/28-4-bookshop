//김호순,김준영 2018.7.18
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
	// 도서 리스트, 페이징, 검색()
	public ArrayList<BookInfo> bookList(int currentPage, int pagePerRow, String word, String sel){
		
		ArrayList<BookInfo> bookList = new ArrayList<BookInfo>();
		System.out.println(bookList + "<---BookInfo");
		
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; 
		PreparedStatement pstmt2 = null; 
		ResultSet resultSet = null; 
		ResultSet resultSet2 = null; 
		
		try {
			conn = DriverUtil.driverDBcon();
			System.out.println(conn + " <---연결 드라이버");
			
			int startRow = (currentPage - 1) * pagePerRow; //첫 인덱스
			int row = 0; //테이블의 전체 행의 수
			int lastPage = 0; //마지막 페이지
			
			if(sel==null & word==null) {
				pstmt2 = conn.prepareStatement("select count(book_no) from book");
				pstmt = conn.prepareStatement("select * from book order by book_no desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			}else if(sel!=null & word.equals("")) {
				pstmt2 = conn.prepareStatement("select count(book_no) from book");
				pstmt = conn.prepareStatement("select * from book order by book_no desc limit ?, ?");
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pagePerRow);
			}else if(sel!=null & word!=null) {
				pstmt2 = conn.prepareStatement("select count(book_no) from book where "+ sel +" like ?");
				pstmt2.setString(1, "%"+word+"%");
				pstmt = conn.prepareStatement("select * from book where "+ sel +"  like ? order by book_no desc limit ?, ?");
				pstmt.setString(1, "%"+word+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, pagePerRow);
			}
			resultSet2 = pstmt2.executeQuery();
			System.out.println(resultSet2 + " <---페이징");
			
			if(resultSet2.next()) {
				row = resultSet2.getInt("count(book_no)"); //테이블의 전체 행의 수 구하기
			}
			
			if(row % pagePerRow == 0) {
				lastPage = row / pagePerRow; //마지막 페이지
			} else { //0이 아니었을 때
				lastPage = row / pagePerRow + 1; //마지막 페이지
			}
			
			resultSet = pstmt.executeQuery();
			System.out.println(resultSet + " <---리스트");
			
			while(resultSet.next()) {
				Book book = new Book();
				System.out.println(book + "<--- Book");
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
				System.out.println(resultSet.getInt("book_no") + " <---도서번호");
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
	// 도서 구매 이력 리스트, 페이징
	public ArrayList<Orders> ordersList(){
		ArrayList<Orders> ordersList = new ArrayList<Orders>();
		System.out.println(ordersList + " 주문 리스트");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			conn = DriverUtil.driverDBcon();
			System.out.println(conn + " <---연결 드라이버");
			
			pstmt = conn.prepareStatement("select book_no, member_no, orders_amount, orders_price, orders_date, orders_addr, orders_state from orders");
			// 첫 컬럼 orders_no 를 제외한  나머지 컬럼들을 orders_no를 조회하여 내림차순으로 나열

			resultSet = pstmt.executeQuery();	// orders 테이블 조회
			System.out.println(resultSet + " <---리스트");
			
			while(resultSet.next()) {
				Orders orders = new Orders();
				System.out.println(orders + " <---Orders");
				orders.setBookNo(resultSet.getInt("book_no"));
				System.out.println(orders.getBookNo() + " <--도서 번호");
				orders.setMemberNo(resultSet.getInt("member_no"));
				orders.setOrdersAmount(resultSet.getInt("order_amount"));
				orders.setOrdersPrice(resultSet.getInt("orders_price"));
				orders.setOrdersDate(resultSet.getString("orders_date"));
				orders.setOrdersAddr(resultSet.getString("orders_addr"));
				orders.setOrdersState(resultSet.getString("orders_state"));
				System.out.println(resultSet.getString("orders_addr")+ " <--주소");
				System.out.println(orders.getOrdersState() + " <--배송상태");
				
				ordersList.add(orders);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			if (resultSet != null) try { resultSet.close(); } catch(SQLException e) {} //resultSet의 값이 null이 아닐 경우 resultSet를 종료시켜줍니다.
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //statement의 값이 null이 아닐 경우 statement를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //connection의 값이 null이 아닐 경우 connection를 종료시켜줍니다.
		}
		return ordersList;
	}
	// QnA 리스트

	//	도서 상품 리뷰 리스트

}
