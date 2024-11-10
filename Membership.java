package model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="membership")
public class Membership {
	@Id
	@Column(name="membership_id")
	private UUID membershipId = UUID.randomUUID();
	
	@Column(name="membership_code")
	private String membership_code;
	
	@Column(name="status")
	@Enumerated(EnumType.STRING)
	private status  status ;
	
	@Column(name="registration_date")
	private Date registration_date;
	
	@Column(name="expiring_date")
	private Date expiring_date;
	
	@ManyToOne
	@JoinColumn(name="reader_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="membership_type_id")
	private membership_type membership_type;
		
    
}
