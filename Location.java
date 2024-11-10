package model;

import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Location")
public class Location {
    @Id
    @Column(name="location_id")
    private UUID location_id = UUID.randomUUID();

    @Column(name="location_code", unique=true)
    private String location_code;

    @Column(name="location_name", unique=true)
    private String location_name;

    @Column(name="Location_type")
    @Enumerated(EnumType.STRING)
    private Location_type LocationType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="parent_id", nullable=true)
    private Location Location;

    @OneToMany(mappedBy="Location")
    private List<User> users;
	public Location getProvince() {
	    Location currentLocation = this;
	    
	    // Traverse up the hierarchy to find the top-level Location
	    while (currentLocation.getLocation() != null) {
	        currentLocation = currentLocation.getLocation();
	    }
	    
	    return currentLocation;
	}

	// Optional: Add a method to get the name of the province, if desired
	public String getProvinceName() {
	    return getProvince().getLocation_name();
	}

	public Location() {
    }

	public Location(UUID location_id, String location_code, String location_name, Location_type locationType,
			Location location, List<User> users) {
		super();
		this.location_id = location_id;
		this.location_code = location_code;
		this.location_name = location_name;
		LocationType = locationType;
		Location = location;
		this.users = users;
	}

	public UUID getLocation_id() {
		return location_id;
	}

	public void setLocation_id(UUID location_id) {
		this.location_id = location_id;
	}

	public String getLocation_code() {
		return location_code;
	}

	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public Location_type getLocationType() {
		return LocationType;
	}

	public void setLocationType(Location_type locationType) {
		LocationType = locationType;
	}

	public Location getLocation() {
		return Location;
	}

	public void setLocation(Location location) {
		Location = location;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	
	
}
