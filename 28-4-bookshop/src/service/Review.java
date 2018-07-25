package service;

import java.util.ArrayList;

public class Review {
	private Member member;
	private Book Book;
	private ArrayList<BookReview> bookReview;
	
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public Book getBook() {
		return Book;
	}
	public void setBook(Book book) {
		Book = book;
	}
	public ArrayList<BookReview> getBookReview() {
		return bookReview;
	}
	public void setBookReview(ArrayList<BookReview> bookReview) {
		this.bookReview = bookReview;
	}
	
	
}
