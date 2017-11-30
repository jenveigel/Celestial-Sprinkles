package client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import data.UserDAO;
import entities.Profile;
import entities.User;

public class userdDAOtest {
	
	public static void main(String[] args) {
		
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
			EntityManager em = emf.createEntityManager();
			
			UserDAO dao = new UserDAO();
			User user = new User();
			
			user.setUserName("jen");
			user.setPassword("123");
			Profile profile = new Profile();
			profile.setFirstName("jen");
			profile.setLastName("ve");
			user.setProfile(profile);
			dao.create(user);
			System.out.println(em.find(User.class, 3));
			System.out.println(user.getProfile().getLastName());
			
			em.close();
			emf.close();
		}
		
}
