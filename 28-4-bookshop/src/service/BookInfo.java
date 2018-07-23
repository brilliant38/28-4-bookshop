//김호순, 김준영 2018.7.23
package service;

public class BookInfo {
	private Book book;
	private BookCode bookCode;
	private Publisher publisher;
	private BookIntro bookIntro;

	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public BookCode getBookCode() {
		return bookCode;
	}
	public void setBookCode(BookCode bookCode) {
		this.bookCode = bookCode;
	}
	public Publisher getPublisher() {
		return publisher;
	}
	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
	public BookIntro getBookIntro() {
		return bookIntro;
	}
	public void setBookIntro(BookIntro bookIntro) {
		this.bookIntro = bookIntro;
	}
}
