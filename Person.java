package model;


import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@MappedSuperclass
public class Person {
	@Id
	@Column(name="person_id")
	private UUID person_id = UUID.randomUUID();
    
	
	@Column(name="first_name")
	private String first_name;
	
	@Column(name="last_name")
	private String last_name;
	
	@Column(name="GENDER")
	@Enumerated(EnumType.STRING)
	private GENDER  GENDER ;
	
	@Column(name="phone_number")
	private String phone_number;

	public Person() {
		super();
	}

	public Person(UUID person_id, String first_name, String last_name, model.GENDER gENDER, String phone_number) {
		super();
		this.person_id = person_id;
		this.first_name = first_name;
		this.last_name = last_name;
		GENDER = gENDER;
		this.phone_number = phone_number;
	}

	public UUID getPerson_id() {
		return person_id;
	}

	public void setPerson_id(UUID person_id) {
		this.person_id = person_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public GENDER getGENDER() {
		return GENDER;
	}

	public void setGENDER(GENDER gENDER) {
		GENDER = gENDER;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	
	
	
	

}
