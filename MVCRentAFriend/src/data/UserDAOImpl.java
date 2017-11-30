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
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);
		
		Profile profile = new Profile();
		em.persist(profile);
		em.flush();
		
		user.setProfileId(profile.getId());
		em.persist(user);
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
	public User destroyUserById(int id) {
		try {
			if(em.find(User.class, id) != null) {
				User deletedUser = em.find(User.class, id);
				em.remove(deletedUser);
			}			
		}
		catch(Exception){
			
		}
		
		return null;
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAllUsersByEvent(Event event) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Profile createProfile(String firstName, String lastName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Profile updateProfile(int id, Profile profile) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Profile destroyProfileById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Profile getProfileById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Profile> getProfileByKey(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
