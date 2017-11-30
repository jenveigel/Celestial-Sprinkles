package client;

import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import data.EventDAO;
import entities.Address;
import entities.Event;
import entities.User;

public class eventDAOtest {
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();
		
		EventDAO dao = new EventDAO();
		Event event = new Event();
		
		event.setActivity("Fighting");
		Address add = em.find(Address.class, 1);
		event.setAddress(add);
		Date date = new Date(2017, 03, 12);
		event.setDateTime(date);
		User user = new User();
		event.setOwnerId(em.find(User.class, 1));
		dao.create(event);
		em.close();
		emf.close();
//		System.out.println(em.find(Address.class, 1));
//		System.out.println(user.getUserName());
	}
}
