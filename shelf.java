package model;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="shelf")
public class shelf {
	@Id
	@Column(name="shelf_id")
	private UUID shelf_id = UUID.randomUUID();
	
	@Column(name="available_stock", unique=true)
	private int available_stock;
	
	@Column(name="book_category", unique=true)
	private String book_category;
	
	@Column(name="borrowed_number", unique=true)
	private int borrowed_number;
	
	@Column(name="initial_stock", unique=true)
	private int initial_stock;
	
	@OneToMany(mappedBy="shelf")
	private List<Book> Books;
	
	@ManyToOne
	@JoinColumn(name="room_id")
	private Room Room;

	public shelf(UUID shelf_id, int available_stock, String book_category, int borrowed_number, int initial_stock,
			List<Book> books, model.Room room) {
		super();
		this.shelf_id = shelf_id;
		this.available_stock = available_stock;
		this.book_category = book_category;
		this.borrowed_number = borrowed_number;
		this.initial_stock = initial_stock;
		Books = books;
		Room = room;
	}

	public UUID getShelf_id() {
		return shelf_id;
	}

	public void setShelf_id(UUID shelf_id) {
		this.shelf_id = shelf_id;
	}

	public int getAvailable_stock() {
		return available_stock;
	}

	public void setAvailable_stock(int available_stock) {
		this.available_stock = available_stock;
	}

	public String getBook_category() {
		return book_category;
	}

	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}

	public int getBorrowed_number() {
		return borrowed_number;
	}

	public void setBorrowed_number(int borrowed_number) {
		this.borrowed_number = borrowed_number;
	}

	public int getInitial_stock() {
		return initial_stock;
	}

	public void setInitial_stock(int initial_stock) {
		this.initial_stock = initial_stock;
	}

	public List<Book> getBooks() {
		return Books;
	}

	public void setBooks(List<Book> books) {
		Books = books;
	}

	public Room getRoom() {
		return Room;
	}

	public void setRoom(Room room) {
		Room = room;
	}

	
	
}
