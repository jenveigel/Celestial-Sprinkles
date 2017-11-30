package data;

import entities.User;

public interface UserDAO {
	public User createUser(String username, String password);
	public User updateUser(int id, User user);
	public User destroyById(int id);
	
	
}
