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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="\"user\"")
public class User extends Person {
    @Column(name="user_name", unique=true)
    private String userName;

    @Column(name="password", unique=true)
    private String password;

    @Column(name="Role")
    @Enumerated(EnumType.STRING)
    private Role Role;

    @ManyToOne
    @JoinColumn(name="village_id")
    private Location Location;

    @OneToMany(mappedBy="user")
    private List<Borrower> Borrowers;

    @OneToMany(mappedBy="user")
    private List<Membership> Memberships;

    // Getters and setters


	
	
	
	public User() {
		super();
	}



	public User(String userName, String password, model.Role role, model.Location location, List<Borrower> borrowers,
			List<Membership> memberships) {
		super();
		this.userName = userName;
		this.password = password;
		Role = role;
		Location = location;
		Borrowers = borrowers;
		Memberships = memberships;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Role getRole() {
		return Role;
	}



	public void setRole(Role role) {
		Role = role;
	}



	public Location getLocation() {
		return Location;
	}



	public void setLocation(Location location) {
		Location = location;
	}



	public List<Borrower> getBorrowers() {
		return Borrowers;
	}



	public void setBorrowers(List<Borrower> borrowers) {
		Borrowers = borrowers;
	}



	public List<Membership> getMemberships() {
		return Memberships;
	}



	public void setMemberships(List<Membership> memberships) {
		Memberships = memberships;
	}
	
	

	
	
}
