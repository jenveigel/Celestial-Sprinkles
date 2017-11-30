package data;

import java.util.List;

import entities.Event;
import entities.Profile;
import entities.User;

public interface UserDAO {
	public User createUser(String username, String password);
	public User updateUser(int id, User user);
	public User destroyUserById(int id);
	public User getUserById(int id);
	public List<User> getAllUsers();
	public List<User> getAllUsersByEvent(Event event);
	

	public Profile updateProfile(int id, Profile profile);
	public Profile destroyProfileById(int id);
	public Profile getProfileById(int id);
	public List<Profile> getProfileByKey(String keyword);
}
