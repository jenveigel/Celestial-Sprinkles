package data;

import java.util.List;

import entities.Event;
import entities.Profile;
import entities.User;

public interface UserDAO {
	public boolean createUser(String username, String password, String firstName, String lastName);
	public User updateUser(int id, User user);
	public boolean destroyUserById(int id);
	public User getUserById(int id);
	public List<User> getAllUsers();
	public List<User> getAllUsersByEvent(int eventId);
	public User getUserByUserName(String username);
	
	public Profile updateProfile(int id, Profile profile);
	public Profile getProfileById(int id);
	//public List<Profile> getProfileByKey(String keyword);
	Profile getProfileByUserId(int id);
	boolean deleteEventFromUser(int uid, int eid);
}
