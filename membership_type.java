package model;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="membership_type")
public class membership_type {
	@Id
	@Column(name="membership_type_id")
	private UUID membership_type_id = UUID.randomUUID();
	
	@Column(name="membership_name", unique=true)
	private String membership_name;
	
	@Column(name="max_books", unique=true)
	private int max_books;
	
	@Column(name="price", unique=true)
	private int price;
	
	@OneToMany(mappedBy="membership_type")
	private List<Membership> Memberships;

	public membership_type(UUID membership_type_id, String membership_name, int max_books, int price,
			List<Membership> memberships) {
		super();
		this.membership_type_id = membership_type_id;
		this.membership_name = membership_name;
		this.max_books = max_books;
		this.price = price;
		Memberships = memberships;
	}

	public UUID getMembership_type_id() {
		return membership_type_id;
	}

	public void setMembership_type_id(UUID membership_type_id) {
		this.membership_type_id = membership_type_id;
	}

	public String getMembership_name() {
		return membership_name;
	}

	public void setMembership_name(String membership_name) {
		this.membership_name = membership_name;
	}

	public int getMax_books() {
		return max_books;
	}

	public void setMax_books(int max_books) {
		this.max_books = max_books;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public List<Membership> getMemberships() {
		return Memberships;
	}

	public void setMemberships(List<Membership> memberships) {
		Memberships = memberships;
	}

	

	
	
}
