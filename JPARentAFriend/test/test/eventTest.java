package test;

import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Address;
import entities.Event;

public class eventTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();
		
//		EventDAO dao = new EventDAO();
//		Date date = new Date(2017, 03, 12);
//		Address address = new Address();
//		Event event = new Event("Drinking", 1, date, address);
//		//Event event = em.find(Event.class, 1);
//		event.setActivity("Drinking");
//		System.out.println(event);

		em.close();
		emf.close();
	}

	
}
