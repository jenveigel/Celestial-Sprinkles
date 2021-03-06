package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_name")
	private String userName;

	private String password;

	@ManyToMany(mappedBy = "users")
	private List<Event> events;
	
	//added bi-directional mapping, owner events separate from other events
//	@OneToOne(mappedBy = "owner")
//	private Event ownerEvent;
	//CascadeType.REMOVE , CascadeType.PERSIST
	@OneToOne(cascade={CascadeType.REMOVE, CascadeType.PERSIST})
	@JoinColumn(name = "profile_id")
	private Profile profile;
	
	@OneToMany(mappedBy="reviewee")
	private List<Review> reviews;

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

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public int getId() {
		return id;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
//	public Event getOwnerEvent() {
//		return ownerEvent;
//	}
//
//	public void setOwnerEvent(Event ownerEvent) {
//		this.ownerEvent = ownerEvent;
//	}
	

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + "]";
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

}
