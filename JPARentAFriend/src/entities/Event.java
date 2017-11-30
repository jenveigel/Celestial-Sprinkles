package entities;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String activity;
	
	@Column(name="owner_id")
	private int ownerId;
	
	@Column(name="time")
	private Date dateTime;
	
	@OneToOne
    @JoinColumn(name="address_id")
	private Address address;
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(
			name="event_participant", 
			joinColumns=@JoinColumn(name="event_id"),
			inverseJoinColumns=@JoinColumn(name="user_id")
	)
	private List<User> users;
	
	//getters and setters

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public int getId() {
		return id;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Event(String activity, int ownerId, Date dateTime, Address address) {
		super();
		//this.id = id;  DONT NEED ID BECAUSE ITS AUTO GENERATED.
		this.activity = activity;
		this.ownerId = ownerId;
		this.dateTime = dateTime;
		this.address = address;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", activity=" + activity + ", ownerId=" + ownerId + ", dateTime=" + dateTime + "]";
	}
		
}
