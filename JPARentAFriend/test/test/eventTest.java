package test;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


import entities.Event;

public class eventTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();

		Event event = em.find(Event.class, 1);
		System.out.println(event);

		em.close();
		emf.close(); 
	}


}
