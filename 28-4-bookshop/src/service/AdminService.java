/*구해성,이광재 2018.07.24*/
package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminService {
	Connection connection = DriverUtil.driverDBcon();
	
	
	//로그인 체크를 하는 loginMember 메소드를 호출하는 서비스 메소드
	
	public int loginAdminService(Admin admin) {
		int login = 0;
		
		try {//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			
			login = adminDao.loginMember(admin,connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return login;
	}
	
	//reviewList를 호출하여 review 목록을 리턴하는 서비스 메소드
	public ArrayList<Review> reviewListService(){
		System.out.println(" 01 reviewListService <- 확인");
		ArrayList<Review> arraylist = null;
		ArrayList<BookReview> bookReview = null;
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			
			arraylist = new ArrayList<Review>();
			bookReview = adminDao.reviewList(connection);
			
			for(int i=0; i<bookReview.size(); i++) {
				Book book = new Book();
				book.setBookName(adminDao.selectbookName(bookReview.get(i).getBookNo(),connection));
				
				Member member = new Member();
				member.setMemberId(adminDao.selectMemberId(bookReview.get(i).getMemberNo(), connection));
				
				System.out.println(bookReview.get(i).getMemberNo() + " : 회원 번호 출력");
				System.out.println(member.getMemberId() + " : 회원 아이디 출력");
				
				Review review = new Review();
				review.setBook(book);
				review.setBookReview(bookReview);
				review.setMember(member);
				
				arraylist.add(review);
			}
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arraylist;
	}
	
	//bookNo를 입력해서 bookName을 리턴 시키는 메소드
	public String selectbookNameService(int bookNo) {
		System.out.println(" 01 selectMemberNo <- 확인");
		String bookName = null;
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			bookName = adminDao.selectbookName(bookNo, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookName;
	}
	
	//memberNo로 selectMemberId 메소드를 호출하는 서비스 메소드
		public String selectMemberIdService(int memberNo) {
			System.out.println(" 01 selectMemberNo <- 확인");
			String memberId = null;
			
			try {
				//Autocommit 정지 메소드
				connection.setAutoCommit(false);
				
				AdminDao adminDao = new AdminDao();
				memberId = adminDao.selectMemberId(memberNo, connection);
				
				//수동 commit 처리 메소드
				connection.commit();
				
			} catch (SQLException e) {
				try {
					//예외발생시 rollback 메소드
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return memberId;
		}
	
	//memberID로 selectMemberNo 메소드를 호출하는 서비스 메소드
	public int selectMemberNoService(String memberId) {
		System.out.println(" 01 selectMemberNo <- 확인");
		int memberNo = 0;
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			memberNo = adminDao.selectMemberNo(memberId, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberNo;
	}
	
	//insertReview 메소드를 bookReview 객체 주소값을 입력하여 호출
	public void insertReviewService(BookReview bookReview) {
		System.out.println(" 01 insertReview <- 확인");
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			adminDao.insertReview(bookReview, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//QNA 테이블에 1행을 추가하는 메소드를 호출하는 서비스 메소드
	
	public void insertQnaService(Qna qna) {
		System.out.println(" 01 insertQnaService <- 확인");
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			adminDao.insertQuestion(qna, connection);
			
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//개인회원의 회원번호를 받아서 DAO의 deleteMember메소드로 입력하고 호출하는 메소드
	
	public void deleteMemberService(int memberNo) {
		System.out.println(" 01 deleteMemberService <- 확인");
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			adminDao.deleteMember(memberNo, connection);
			
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//개인회원의 관심 장르를 받아서 MemberInterForm로 보내주는 메소드
	public ArrayList<BookCode> selectMemberInter(int memberNo) {
		System.out.println(" 01 selectMemberInter <- 확인");
		ArrayList<BookCode> arraylist = null;
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			arraylist = adminDao.selectMemberInter(memberNo, connection);
			
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arraylist;
	}
	
	//모든 회원의 정보를 받아서 memberList로 뿌려주는 메소드
	public ArrayList<Member> memberList() {
		System.out.println(" 01 memberList <- 확인");
		ArrayList<Member> arraylist = null;
		
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			arraylist = adminDao.selectMemberList(connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return arraylist;
	}
	
	//특정 주문의 배송 상태 컬럼의 값을 변경 시키는 메소드 
	public void updateOrdersState(String ordersstate) {
		System.out.println(" 01 updateOrdersState <- 확인");
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			Orders orders = new Orders();
			orders.setOrdersState(ordersstate);
			
			AdminDao adminDao = new AdminDao();
			adminDao.updateOrdersState(orders, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (SQLException e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//특정 회원의 정보를 삭제시키는 메소드
	public void deleteMemberAction(String id) {
		System.out.println(" 01 deleteMemberAction <- 확인");
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);
			
			AdminDao adminDao = new AdminDao();
			adminDao.deleteMemberAction(id, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//QnAComment테이블에 답변 1행을 추가하는 메소드
	public void insertQnaComment(QnaComment qnaComment) {
		System.out.println(" 01 insertQnaComment <- 확인");
		try {
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);	
			
			AdminDao adminDao = new AdminDao();
			adminDao.insertAnswer(qnaComment, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {	
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//책 정보 수정화면으로 책의 정보를 불러와서 화면에 출력해주는 메소드
	public BookInfo updateFormBook(int bookNo) {
		System.out.println(" 01 updateFormBook <- 확인");
		BookInfo bookInfo = new BookInfo();
		
		try {
			
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);	
			
			AdminDao adminDao = new AdminDao();
			bookInfo = adminDao.updateFormBook(bookNo, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bookInfo;
	}
	
	//책 1개의 정보를 삭제하는 메소드
	public void deleteBook(int bookNo) {
		System.out.println(" 01 deleteBook <- 확인");
		
		try {
			
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);	
			
			AdminDao adminDao = new AdminDao();
			adminDao.deleteBook(bookNo, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//책 1개의 정보를 입력하는 메소드
	public void insertBook(BookInfo bookInfo) {
		System.out.println(" 01 insertBook <- 확인");
		try {
			
			//Autocommit 정지 메소드
			System.out.println(connection + " 02 connection check");
			connection.setAutoCommit(false);	
			
			AdminDao adminDao = new AdminDao();
			adminDao.insertBook(bookInfo, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//책 1개의 정보를 수정처리하는 메소드
	public void updateBook(BookInfo bookInfo) {
		System.out.println(" 01 updateBook <- 확인");
		
		try {
			
			//Autocommit 정지 메소드
			connection.setAutoCommit(false);	
			
			AdminDao adminDao = new AdminDao();
			adminDao.updateBook(bookInfo, connection);
			
			//수동 commit 처리 메소드
			connection.commit();
			
		} catch (Exception e) {
			try {
				//예외발생시 rollback 메소드
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
