package model;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Room")
public class Room {
	@Id
	@Column(name="room_id")
	private UUID room_id = UUID.randomUUID();
	
	@Column(name="room_code", unique=true)
	private String room_code;
	
	@OneToMany(mappedBy="Room")
	private List<shelf> shelfs;

	public Room(UUID room_id, String room_code, List<shelf> shelfs) {
		super();
		this.room_id = room_id;
		this.room_code = room_code;
		this.shelfs = shelfs;
	}

	public UUID getRoom_id() {
		return room_id;
	}

	public void setRoom_id(UUID room_id) {
		this.room_id = room_id;
	}

	public String getRoom_code() {
		return room_code;
	}

	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}

	public List<shelf> getShelfs() {
		return shelfs;
	}

	public void setShelfs(List<shelf> shelfs) {
		this.shelfs = shelfs;
	}
	
	
}
