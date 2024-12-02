package model;

import java.util.List;
import java.util.UUID;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name="room")
public class Room {

	
	@Id
	@GeneratedValue
	@Column(name = "roomid")
	private UUID roomId;

	@Column(name="room_code",nullable = false)
	private String roomCode;
	
	@OneToMany(mappedBy = "room", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Shelf> shelves;


	 
	public Room() {
	}


	public Room(UUID roomId, String roomCode, List<Shelf> shelves) {
		this.roomId = roomId;
		this.roomCode = roomCode;
		this.shelves = shelves;
	}


	public UUID getRoomId() {
		return roomId;
	}


	public void setRoomId(UUID roomId) {
		this.roomId = roomId;
	}


	public String getRoomCode() {
		return roomCode;
	}


	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}


	public List<Shelf> getShelves() {
		return shelves;
	}


	public void setShelves(List<Shelf> shelves) {
		this.shelves = shelves;
	}

	 
}
