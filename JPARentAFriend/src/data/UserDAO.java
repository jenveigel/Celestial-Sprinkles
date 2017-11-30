package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.User;

public class UserDAO {

	public User create(User user) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(user);
		em.flush();
		em.getTransaction().commit();
		em.close();
		emf.close();
		return user;
	}
}
