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
	public boolean createUser(String username, String password, String firstName, String lastName) {
		try {
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			Profile profile = new Profile();
			profile.setFirstName("");
			profile.setLastName("");
			profile.setBio("");
			profile.setImageURL("");
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


	// Method currently does not work. It will do everything correctly up until about maybe the setEvents
	// or the persist. It doesnt add the new List<Event> to the database.
	@Override
	public boolean deleteEventFromUser(int uid, int eid) {
		String query = "SELECT u FROM User u JOIN FETCH u.events WHERE u.id = :uid";
		User user = em.createQuery(query, User.class).setParameter("uid", uid).getResultList().get(0);
		List<Event> userEvents = user.getEvents();
		System.out.println(userEvents);
		List<Event> updatedEvents = new ArrayList<>();
		for (Event event : userEvents) {
			if(event.getId() != eid) {
				updatedEvents.add(event);
			}
		}
		System.out.println(updatedEvents);
		user.setEvents(updatedEvents);
		em.persist(user);
		em.flush();

//		DELETE FROM event_participant WHERE event.id=:eid AND user.id = :uid;
//		Event event = events.get(0);

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


	// @Override
	// public List<Profile> getProfileByKey(String keyword) {
	// String query = "SELECT p FROM profile pLIKE %:keyword%";
	// return em.createQuery(query, User.class)
	// .setParameter("keyword", keyword)
	// .getResultList();
	// }

}
