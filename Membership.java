package model;

import java.util.Date;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="membership")
public class Membership {
  
	@Id
    @GeneratedValue
    private UUID membershipId;
	
	private Date expiry_time;
	private Date reg_date;	

	@Column(name="membership_code")
	private String m_code;
	
    @Enumerated(EnumType.STRING)
    private Status membershipStatus = Status.PENDING;;

    @ManyToOne
    @JoinColumn(name = "reader_id")
    private Users reader;

    @ManyToOne
    @JoinColumn(name = "membership_type_id",nullable = false)
    private Membership_type membershipType;



	public Membership() {
		super();
	}

	public Membership(UUID membershipId, Date expiry_time, Date reg_date, String m_code, Status membershipStatus,
			Users reader, Membership_type membershipType) {
		this.membershipId = membershipId;
		this.expiry_time = expiry_time;
		this.reg_date = reg_date;
		this.m_code = m_code;
		this.membershipStatus = Status.PENDING;
		this.reader = reader;
		this.membershipType = membershipType;
	}

	public UUID getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(UUID membershipId) {
		this.membershipId = membershipId;
	}

	public Date getExpiry_time() {
		return expiry_time;
	}

	public void setExpiry_time(Date expiry_time) {
		this.expiry_time = expiry_time;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getM_code() {
		return m_code;
	}

	public void setM_code(String m_code) {
		this.m_code = m_code;
	}

	public Users getReader() {
		return reader;
	}

	public void setReader(Users reader) {
		this.reader = reader;
	}

	public Membership_type getMembershipType() {
		return membershipType;
	}

	public void setMembershipType(Membership_type membershipType) {
		this.membershipType = membershipType;
	}

	public Status getMembershipStatus() {
		return membershipStatus;
	}

	public void setMembershipStatus(Status membershipStatus) {
		this.membershipStatus = membershipStatus;
	}
	
    
}
