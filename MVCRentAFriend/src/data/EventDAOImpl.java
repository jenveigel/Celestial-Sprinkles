package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Event;

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
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Event> getAllEvents() {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Event> getAllEventsByUserId(int id) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Event> getAllEventsByCity(String city) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Event> getAllEventsByState(String state) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public List<Event> getAllEventsByActivity(String activity) {
			// TODO Auto-generated method stub
			return null;
		}
		
}
