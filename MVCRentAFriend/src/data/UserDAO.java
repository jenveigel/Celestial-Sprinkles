package data;

import java.util.List;

import entities.Event;
import entities.User;

public interface UserDAO {
	public User createUser(String username, String password);
	public User updateUser(int id, User user);
	public User destroyById(int id);
	public List<User> getAllUsers();
	public List<User> getAllUsersByEvent(Event event);
}
