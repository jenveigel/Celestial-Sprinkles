package data;

import java.util.List;

import entities.Event;
import entities.Profile;
import entities.User;

public interface UserDAO {
	public User createUser(String username, String password);
	public User updateUser(int id, User user);
	public boolean destroyUserById(int id);
	public User getUserById(int id);
	public List<User> getAllUsers();
	public List<User> getAllUsersByEvent(int eventId);
	

	public Profile updateProfile(int id, Profile profile);
	public Profile getProfileById(int id);
	public List<Profile> getProfileByKey(String keyword);
}
