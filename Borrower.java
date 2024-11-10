package model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Borrower")
public class Borrower {
	@Id
	@Column(name="id")
	private UUID id = UUID.randomUUID();
	
	@Column(name="fine", unique=true)
	private int fine;
	
	@Column(name="late_charge_fees", unique=true)
	private int lateChargeFees;

	@Column(name="pickup_date")
	private Date pickupDate;
	
	@Column(name="due_date")
	private Date dueDate;

	@Column(name="return_date")
	private Date returnDate;
	
	@ManyToOne
	@JoinColumn(name="reader_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="book_id")
	private Book Book;

	public Borrower(UUID id, int fine, int lateChargeFees, Date pickupDate, Date dueDate, Date returnDate,
			model.User user, model.Book book) {
		super();
		this.id = id;
		this.fine = fine;
		this.lateChargeFees = lateChargeFees;
		this.pickupDate = pickupDate;
		this.dueDate = dueDate;
		this.returnDate = returnDate;
		this.user = user;
		Book = book;
	}

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}

	public int getLateChargeFees() {
		return lateChargeFees;
	}

	public void setLateChargeFees(int lateChargeFees) {
		this.lateChargeFees = lateChargeFees;
	}

	public Date getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(Date pickupDate) {
		this.pickupDate = pickupDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return Book;
	}

	public void setBook(Book book) {
		Book = book;
	}
	
	

	
	
	
}
