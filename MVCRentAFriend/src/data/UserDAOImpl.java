package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Event;
import entities.Profile;
import entities.Review;
import entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean createUser(String username, String password, String firstName
			, String lastName, String bio, String imageUrl, String facebookUrl, String linkedinUrl) 
	{//method returns false if 
		try {
			if(bio == null)
				bio = "";
			if(imageUrl ==  null || imageUrl=="")
				imageUrl = "default.jpg";
			if(facebookUrl==null)
				facebookUrl = "";
			if(linkedinUrl==null)
				linkedinUrl = "";
			
			username = username.trim();
			password = password.trim();
			firstName = firstName.trim(); 
			lastName = lastName.trim();
			bio = bio.trim();
			imageUrl = imageUrl.trim();
			facebookUrl = facebookUrl.trim();
			linkedinUrl = linkedinUrl.trim();
				
			if(firstName.equals("")||lastName.equals("")||username.equals("")||password.equals("")) {
				return false; 
			}
			
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			Profile profile = new Profile();
			
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setBio(bio);
			profile.setImageURL(imageUrl);
			profile.setFacebookUrl(facebookUrl);
			profile.setLinkedinUrl(linkedinUrl);
			user.setProfile(profile);
			em.persist(user);
			em.flush();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public User updateUser(int id, User user) {
		User updatedUser = em.find(User.class, id);
		updatedUser.setPassword(user.getPassword());
		updatedUser.setUserName(user.getUserName());
		return null;
	}

	@Override
	public boolean destroyUserById(int uid) {
		String queryReview = "DELETE FROM Review r WHERE r.reviewee.id = :rid";
		int num3 = em.createQuery(queryReview).setParameter("rid", uid).executeUpdate();
		
		String queryUser = "DELETE FROM User u WHERE u.id = :uid";
		int num1 = em.createQuery(queryUser).setParameter("uid", uid).executeUpdate();
		
//		//Profile profile = new Profile();
		String queryProfile = "DELETE FROM Profile p WHERE p.id = :pid";
		int num2 = em.createQuery(queryProfile).setParameter("pid", uid).executeUpdate();
		
		
		if (num1 > 0 && num2 > 0 && num3 > 0) {
			return true;
		}

		return false;
	}

	@Override
	public User getUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public List<User> getAllUsers() {
		String query = "SELECT u FROM user u";
		return em.createQuery(query, User.class).getResultList();
	}

	@Override
	public boolean deleteEventFromUser(int uid, int eid) {
		String query = "SELECT u FROM User u JOIN FETCH u.events WHERE u.id = :uid";
		User user = em.createQuery(query, User.class).setParameter("uid", uid).getResultList().get(0);
		//Get list from user
		List<Event> userEvents = user.getEvents();
		//remove event from user list that is equal to eid
		for(int x=0; x < userEvents.size(); x++) {
			if(userEvents.get(x).getId() == eid) {
				System.out.println(userEvents.remove(x));
			}
		}
		//get persisted user
		user = em.find(User.class, uid);
		//set users events so that the new events list persists
		user.setEvents(userEvents);
		return true;
	}

	@Override
	public List<User> getAllUsersByEvent(int eventId) {
		String query = "Select e FROM Event e JOIN FETCH e.users WHERE e.id = :eventId";
		return em.createQuery(query, Event.class).setParameter("eventId", eventId).getResultList().get(0).getUsers();
	}



	@Override
	public Profile updateProfile(int id, Profile profile) {
		User user = em.find(User.class, id);
		Profile updatedProfile = user.getProfile();
		updatedProfile.setFirstName(profile.getFirstName());
		updatedProfile.setLastName(profile.getLastName());
		updatedProfile.setBio(profile.getBio());
		updatedProfile.setImageURL(profile.getImageURL());
		updatedProfile.setFacebookUrl(profile.getFacebookUrl());
		updatedProfile.setLinkedinUrl(profile.getLinkedinUrl());
		return updatedProfile;
	}

	@Override
	public Profile getProfileById(int id) {
		return em.find(Profile.class, id);
	}

	@Override
	public Profile getProfileByUserId(int id) {
		return em.find(User.class, id).getProfile();
	}

	@Override
	public User getUserByUserName(String username) {
		try {
		String query = "Select u FROM User u WHERE u.userName=:username";
		return em.createQuery(query, User.class).setParameter("username", username).getResultList().get(0);
		} catch (Exception e) {
			return null;
		}
	}
	@Override
	public boolean addReview(int uid, String comment, int rating) {
		User user = em.find(User.class, uid);
		List<Review> reviews = user.getReviews();
		Review review = new Review();
		review.setReview(comment);
		review.setRating(rating);
		review.setReviewee(user);
		boolean bool = reviews.add(review);
		em.persist(review);
		if(bool == true) {
			return true;
		}
		return false;
	}
	@Override
	public List<Review> getReviewsByUser(int uid) {
		String query = "Select r FROM Review r WHERE r.reviewee.id = :uid";
		return em.createQuery(query, Review.class).setParameter("uid", uid).getResultList();
	}
	
}





