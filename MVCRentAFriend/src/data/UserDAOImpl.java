package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Event;
import entities.Profile;
import entities.User;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public boolean createUser(String username, String password, String firstName
			, String lastName, String bio, String imageUrl) 
	{//method returns false if 
		try {
			username = username.trim();
			password = password.trim();
			firstName = firstName.trim(); 
			lastName = lastName.trim();
			bio = bio.trim();
			imageUrl = imageUrl.trim();
			if(firstName.equals("")||lastName.equals("")||bio.equals("")
					||imageUrl.equals("")||username.equals("")||password.equals("")) {
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
	public boolean destroyUserById(int id) {
		try {
			if (em.find(User.class, id) != null) {
				User deletedUser = em.find(User.class, id);
				em.remove(deletedUser);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
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
}
