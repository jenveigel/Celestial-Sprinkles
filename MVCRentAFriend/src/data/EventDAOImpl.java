package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Event;
import entities.Profile;
import entities.User;

@Repository
@Transactional
public class EventDAOImpl implements EventDAO {
		@PersistenceContext
		private EntityManager em;

		@Override
		public Event create(Event event) {
			em.persist(event);
			em.flush();
			return event;
		}

		@Override
		public Event update(int id, Event event) {
			Event updatedEvent  = em.find(Event.class, id);
			updatedEvent.setActivity(updatedEvent.getActivity());
			updatedEvent.setDateTime(updatedEvent.getDateTime());
			updatedEvent.setAddress(updatedEvent.getAddress());
			
			return updatedEvent;
		}

		@Override
		public boolean destroyById(int id) {
			Event destroyEvent = em.find(Event.class, id) ;
			em.remove(destroyEvent);
			if (em.find(Event.class, id) == null) {
				return true;
			} else

				em.close();
				
			return false;
		}

		@Override
		public Event getEventById(int id) {	
			return em.find(Event.class, id);
		}

		public void addUserToEvent() {
			
		}
		
		@Override
		public List<Event> getAllEvents() {
			String query = "SELECT e FROM Event e";
			return em.createQuery(query, Event.class).getResultList();
		}

		@Override
		public List<Event> getAllEventsByUserId(int id) {
			String query = "SELECT u.events FROM User u JOIN FETCH u.events WHERE u.id = :id";
			return em.createQuery(query, Event.class).setParameter("id", id).getResultList();
		}

		@Override
		public List<Event> getAllEventsByCity(String city) {
			String query = "SELECT e FROM Event e WHERE e.address.city = :city";
			return em.createQuery(query, Event.class).setParameter("city", city).getResultList();
		}

		@Override
		public List<Event> getAllEventsByState(String state) {
			String query = "SELECT e FROM Event e WHERE e.address.state = :state";
			return em.createQuery(query, Event.class).setParameter("state", state).getResultList();
		}

		@Override
		public List<Event> getAllEventsByActivity(String activity) {
			String query = "SELECT e FROM Event e WHERE e.activity = :activity";
			return em.createQuery(query, Event.class).setParameter("activity", activity).getResultList();
		}

		@Override
		public List<User> addUserToEvent(int eventId, User user) {
			Event event = em.find(Event.class, eventId);
			User userManaged = em.find(User.class, user.getId());
			List<User> userList = event.getUsers();
			userList.add(userManaged);
			event.setUsers(userList);
			return userList;
		}
		
		
}
