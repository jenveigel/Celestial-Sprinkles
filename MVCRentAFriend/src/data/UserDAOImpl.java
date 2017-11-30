package data;

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
	public User createUser(String username, String password) {
		try {
			
		} catch(Exception e) {
			
		}
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);
		System.out.println(user);
		em.persist(user);
		em.flush();
		//System.out.println(user);
		return user;
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
			if(em.find(User.class, id) != null) {
				User deletedUser = em.find(User.class, id);
				em.remove(deletedUser);
				return true;
			}		
			
		}
		catch(Exception e){
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
	public List<User> getAllUsersByEvent(int eventId) {
		String query = "Select e FROM Event e JOIN FETCH e.users WHERE e.id = :eventId";
		
		return em.createQuery(query, Event.class)
				.setParameter("eventId", eventId)
				.getResultList().get(0).getUsers();
	}

	@Override
	public Profile updateProfile(int id, Profile profile) {
		User user = em.find(User.class, id);
		Profile updatedProfile = user.getProfile();
		updatedProfile.setBio(profile.getBio());
		updatedProfile.setFirstName(profile.getFirstName());
		updatedProfile.setLastName(profile.getLastName());
		updatedProfile.setImageURL(profile.getImageURL());
		return updatedProfile;
	}

	@Override
	public Profile getProfileById(int id) {
		return em.find(Profile.class, id);
	}

//	@Override
//	public List<Profile> getProfileByKey(String keyword) {
//		String query = "SELECT p FROM profile pLIKE %:keyword%";
//		return em.createQuery(query, User.class)
//				.setParameter("keyword", keyword)
//				.getResultList();
//	}

}
