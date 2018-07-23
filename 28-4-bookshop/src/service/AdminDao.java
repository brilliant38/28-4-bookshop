/*구해성,이광재 2018.07.23*/
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao {
	
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
		String updateBookSql = "UPDATE";
		
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
		String deleteBookSql = "DELETE";
		
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
