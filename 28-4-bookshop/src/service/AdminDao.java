/*구해성,이광재 2018.07.24*/
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDao {
	
	//Review 테이블에 1행의 책 리뷰를 입력하는 메소드.
	public void insertReview(BookReview bookReview,Connection connection) {
		PreparedStatement preparedStatement = null;
		String insertReviewSql = "INSERT INTO bookreview (book_no, member_no, bookreview_content) VALUES (?,?,?)";
		
		try {
			preparedStatement = connection.prepareStatement(insertReviewSql); 
			preparedStatement.setInt(1, bookReview.getBookNo());
			preparedStatement.setInt(2, bookReview.getMemberNo());
			preparedStatement.setString(3, bookReview.getBookReviewContent());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	//Q&A 테이블에 1행의 답글을 입력하는  메소드.
	public void insertQuestion(Qna qna, Connection connection) {
		PreparedStatement preparedStatement = null;
		String insertQnaSql = "INSERT INTO qna (member_no, qna_title, qna_content, qna_date) VALUES (?,?,?,NOW())";
		
		try {
			preparedStatement = connection.prepareStatement(insertQnaSql); 
			preparedStatement.setInt(1, qna.getMemberNo());
			preparedStatement.setString(2, qna.getQnaTitle());
			preparedStatement.setString(3, qna.getQnaContennt());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//개인회원번호를 입력받아서 DB내의 Member테이블에서 해당하는 회원번호의 정보 1행을 삭제하는 메소드
	
	public void deleteMember(int memberNo, Connection connection) {
		PreparedStatement preparedStatement = null;
		String deleteMemberSql = "DELETE FROM member WHERE member_no=?";
		
		try {
			preparedStatement = connection.prepareStatement(deleteMemberSql); 
			preparedStatement.setInt(1, memberNo);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//개인회원이 관심있어하는 장르를 조회해서 장르 목록을 리턴 해주는 메소드
	public ArrayList<BookCode> selectMemberInter (int memberNo, Connection connection) {
		System.out.println(" 02 selectMemberInter <- 확인");
		ArrayList<BookCode> arraylist = new ArrayList<BookCode>();
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String selectMemberInterSql = "SELECT bookcode_name FROM memberinter m INNER JOIN bookcode b ON m.bookcode_no=b.bookcode_no WHERE m.member_no=? ORDER BY bookcode_name DESC";
		

		try {
			preparedStatement = connection.prepareStatement(selectMemberInterSql); 
			preparedStatement.setInt(1, memberNo);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				BookCode bookCode = new BookCode();
				
				bookCode.setBookCodeName(resultSet.getString(1));
				
				arraylist.add(bookCode);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				resultSet.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arraylist;
	}
	
	//모든 회원의 정보를 저장하여 리스트로 리턴 시켜주는 메소드
	public ArrayList<Member> selectMemberList(Connection connection) {
		System.out.println(" 02 selectMemberList <- 확인");
		ArrayList<Member> arraylist = new ArrayList<Member>();
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String selectMemberListSql = "SELECT member_no, member_id, member_name, member_addr, member_point, member_date FROM member";
		
		try {
			preparedStatement = connection.prepareStatement(selectMemberListSql); 
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Member member = new Member();
				
				member.setMemberNo(resultSet.getInt(1));
				member.setMemberId(resultSet.getString(2));
				member.setMemberName(resultSet.getString(3));
				member.setMemberAddr(resultSet.getString(4));
				member.setMemberPoint(resultSet.getInt(5));
				member.setMemberDate(resultSet.getString(6));
				
				arraylist.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				resultSet.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arraylist;
	}
	
	// 1명의 회원 정보를 삭제시키는 메소드
	public void deleteMemberAction(String id, Connection connection) {
		System.out.println(" 02 deleteMemberAction <- 확인");
		
		PreparedStatement preparedStatement = null;
		String deleteMemberActionSql = "DELETE";
		
		try {
			preparedStatement = connection.prepareStatement(deleteMemberActionSql); 
			preparedStatement.setString(1, id);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//QnA 리스트에 올라온 질문에 답글을 다는 메소드
	public void insertAnswer(QnaComment qnaComment, Connection connection) {
		System.out.println(" 02 insertAnswer <- 확인");
		
		PreparedStatement preparedStatement = null;
		String insertAnswerSql = "INSERT";
		
		try {
			preparedStatement = connection.prepareStatement(insertAnswerSql); 
			preparedStatement.setInt(1, qnaComment.getQnaNo());
			preparedStatement.setInt(2, qnaComment.getAdminNo());
			preparedStatement.setString(3, qnaComment.getCommentContent());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//판매할 책의 정보를 입력하는 메소드
	public void insertBook(BookInfo bookInfo, Connection connection) {
		System.out.println(" 03 insertBook <- 확인");
		
		PreparedStatement preparedStatement = null;
		String insertBookSql = "INSERT INTO book (bookcode_no, publisher_no, book_name, book_author, book_price, book_point, book_amount, book_out, book_date) VALUES (?,?,?,?,?,?,?,?,NOW())";
		
		try {
			preparedStatement = connection.prepareStatement(insertBookSql); 
			preparedStatement.setInt(1, bookInfo.getBookCode().getBookCodeNo());
			preparedStatement.setInt(2, bookInfo.getPublisher().getPublisherNo());
			preparedStatement.setString(3, bookInfo.getBook().getBookName());
			preparedStatement.setString(4, bookInfo.getBook().getBookAuthor());
			preparedStatement.setInt(5, bookInfo.getBook().getBookPrice());
			preparedStatement.setInt(6, bookInfo.getBook().getBookPoint());
			preparedStatement.setInt(7, bookInfo.getBook().getBookAmount());
			preparedStatement.setString(8, bookInfo.getBook().getBookOut());
			
			System.out.println(preparedStatement + " 04 preparedStatement <- 확인");
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//판매할 책의 수정할 정보를 화면에 뿌려주기 위해 책 정보를 리턴하는 메소드 
	public BookInfo updateFormBook(int bookNo, Connection connection) {
		System.out.println(" 02 updateFormBook <- 확인");
		BookInfo bookInfo = new BookInfo();
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String updateFormBookSql = "SELECT bookcode_no, publisher_no, book_name, book_author, book_price, book_point, book_amount, book_out, book_date FROM book WHERE book_no=?";
		
		try {
			preparedStatement = connection.prepareStatement(updateFormBookSql); 
			preparedStatement.setInt(1, bookNo);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				Book book = new Book(); 
				
				book.setBookCodeNo(resultSet.getInt(1));
				book.setPublisherNo(resultSet.getInt(2));
				book.setBookName(resultSet.getString(3));
				book.setBookAuthor(resultSet.getString(4));
				book.setBookPrice(resultSet.getInt(5));
				book.setBookPoint(resultSet.getInt(6));
				book.setBookAmount(resultSet.getInt(7));
				book.setBookOut(resultSet.getString(8));
				
				bookInfo.setBook(book);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookInfo;
	}
	
	//판매할 책의 수정된 정보를 DB에 업데이트 하는 메소드
	public void updateBook(BookInfo bookInfo, Connection connection) {
		System.out.println(" 02 updateBook <- 확인");
		
		PreparedStatement preparedStatement = null;
		String updateBookSql = "UPDATE book SET bookcode_no=?,publisher_no=?,book_name=?,book_author=?,book_price=?,book_point=?,book_amount=?,book_out=? WHERE book_no  = ?";
		
		try {
			preparedStatement = connection.prepareStatement(updateBookSql); 
			preparedStatement.setInt(1, bookInfo.getBook().getBookCodeNo());
			preparedStatement.setInt(2, bookInfo.getBook().getPublisherNo());
			preparedStatement.setString(3, bookInfo.getBook().getBookName());
			preparedStatement.setString(4, bookInfo.getBook().getBookAuthor());
			preparedStatement.setInt(5, bookInfo.getBook().getBookPrice());
			preparedStatement.setInt(6, bookInfo.getBook().getBookPoint());
			preparedStatement.setInt(7, bookInfo.getBook().getBookAmount());
			preparedStatement.setString(8, bookInfo.getBook().getBookOut());
			preparedStatement.setInt(9, bookInfo.getBook().getBookNo());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//책 1권의 정보를 삭제하는 메소드
	public void deleteBook(int bookNo, Connection connection) {
		System.out.println(" 02 deleteOrdersState <- 확인");
		
		PreparedStatement preparedStatement = null;
		String deleteBookSql = "delete from book where book_no= ?";
		
		try {
			preparedStatement = connection.prepareStatement(deleteBookSql); 
			preparedStatement.setInt(1, bookNo);
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//배송상황을  update 하는 메소드
	public void updateOrdersState(Orders orders,Connection connection) {
		System.out.println(" 02 updateOrdersState <- 확인");
			
		PreparedStatement preparedStatement = null;
		String updateOrdersStateSql = "UPDATE";
		
		try {
			preparedStatement = connection.prepareStatement(updateOrdersStateSql); 
			preparedStatement.setInt(1, orders.getOrdersNo());
			
			preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
