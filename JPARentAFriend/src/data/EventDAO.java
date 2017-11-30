package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Event;

public class EventDAO {

	public Event create(Event event) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(event);
		em.flush();
		em.getTransaction().commit();
		em.close();
		emf.close();
		return event;
	}
	
	public boolean delete(int id) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("RentAFriend");
		EntityManager em = emf.createEntityManager();
		Event event = em.find(Event.class, id);
		
		em.getTransaction().begin();
		em.remove(event);
		em.getTransaction().commit();

		if (em.find(Event.class, id) == null) {
            return true;
        } else

            em.close();
            emf.close();
        return false;

	}
}
