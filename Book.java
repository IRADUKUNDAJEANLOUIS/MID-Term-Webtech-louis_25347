package model;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Book")
public class Book {
	@Id
	@Column(name="Book_id")
	private UUID Book_id = UUID.randomUUID();
	
	@Column(name="user_name", unique=true)
	private String userName;
	
	@Column(name="ISBNCode", unique=true)
	private String ISBNCode;
	
	@Column(name="publication_name", unique=true)
	private String publication_name;
	
	@Column(name="title", unique=true)
	private String title;
	
	
	@Column(name="edition", unique=true)
	private int edition;
	
	
	@Column(name="Book_status")
	@Enumerated(EnumType.STRING)
	private Book_status Status   ;
	
	@OneToMany(mappedBy="Book")
	private List<Borrower> Borrowers;
	
	@ManyToOne
	@JoinColumn(name="shelf_id")
	private shelf shelf;

	public Book(UUID book_id, String userName, String iSBNCode, String publication_name, String title, int edition,
			Book_status status, List<Borrower> borrowers, model.shelf shelf) {
		super();
		Book_id = book_id;
		this.userName = userName;
		ISBNCode = iSBNCode;
		this.publication_name = publication_name;
		this.title = title;
		this.edition = edition;
		Status = status;
		Borrowers = borrowers;
		this.shelf = shelf;
	}

	public UUID getBook_id() {
		return Book_id;
	}

	public void setBook_id(UUID book_id) {
		Book_id = book_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getISBNCode() {
		return ISBNCode;
	}

	public void setISBNCode(String iSBNCode) {
		ISBNCode = iSBNCode;
	}

	public String getPublication_name() {
		return publication_name;
	}

	public void setPublication_name(String publication_name) {
		this.publication_name = publication_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public Book_status getStatus() {
		return Status;
	}

	public void setStatus(Book_status status) {
		Status = status;
	}

	public List<Borrower> getBorrowers() {
		return Borrowers;
	}

	public void setBorrowers(List<Borrower> borrowers) {
		Borrowers = borrowers;
	}

	public shelf getShelf() {
		return shelf;
	}

	public void setShelf(shelf shelf) {
		this.shelf = shelf;
	}
	
	
}
