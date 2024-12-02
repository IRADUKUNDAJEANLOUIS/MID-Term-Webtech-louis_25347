package model;

import java.util.UUID;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "membership_type")
public class Membership_type {

    @Id
    @GeneratedValue
    private UUID membershipTypeId;

    @Column(name = "max_books", nullable = false)
    private int maxBooks;

    @Column(nullable = false)
    private double price;

    @Column(name = "membership_name", nullable = false)
    private String membershipName;

    
    // No-argument constructor
    public Membership_type() {
    }

    public Membership_type(int maxBooks, double price, String membershipName) {
		super();
		this.maxBooks = maxBooks;
		this.price = price;
		this.membershipName = membershipName;
	}


	// Getters and Setters
    public UUID getMembershipTypeId() {
        return membershipTypeId;
    }

    public void setMembershipTypeId(UUID membershipTypeId) {
        this.membershipTypeId = membershipTypeId;
    }

    public int getMaxBooks() {
        return maxBooks;
    }

    public void setMaxBooks(int maxBooks) {
        this.maxBooks = maxBooks;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMembershipName() {
        return membershipName;
    }

    public void setMembershipName(String membershipName) {
        this.membershipName = membershipName;
    }
}
