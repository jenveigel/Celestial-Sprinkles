package data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Address;
import entities.Event;
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
		public Event updateEvent(int id, Event event) {
			System.out.println("update event");
			Event updatedEvent = em.find(Event.class, event.getId());
			updatedEvent.setActivity(event.getActivity());
			updatedEvent.setDateTime(event.getDateTime());
			updatedEvent.setAddress(event.getAddress());

			return updatedEvent;
		}
		@Override
		public Event updateEvent(int eid, String activity, String when, String street, String city, String state, int id) {
			System.out.println("update event");
			Event updatedEvent = em.find(Event.class, eid);
			Address add = new Address();
			add.setCity(city);
			add.setState(state);
			add.setAddress(street);
			updatedEvent.setActivity(activity);
			updatedEvent.setAddress(add);
			String str = when;
			str = str.replace("T", " ");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
			updatedEvent.setDateTime(dateTime);
			return updatedEvent;
		}

		@Override
		public boolean destroyById(int id) {
			Event destroyEvent = em.find(Event.class, id);
			String query = "DELETE FROM Event e WHERE e.id = :id";

			int num = em.createQuery(query).setParameter("id", id).executeUpdate();
//			em.remove(destroyEvent);
			if (num > 0) {
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
		public List<Event> getAllEventsWithUsers() {
			String query = "SELECT DISTINCT e FROM Event e JOIN FETCH e.users";
			return em.createQuery(query, Event.class).getResultList();
		}

		@Override
		public List<Event> getAllEventsByUserId(User user) {

			try {
				String query = "SELECT u FROM User u JOIN FETCH u.events WHERE u.id = :id";

				List<Event> events = em.createQuery(query, User.class)
				.setParameter("id", user.getId())
				.getResultList()
				.get(0)
				.getEvents();

				if(events == null) {
					events = new ArrayList<>();

				}

				return events;

			}
			catch(Exception e){
				e.printStackTrace();
				return new ArrayList<Event>();
			}

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
		public boolean addUserToEvent(int eventId, User user) {
			Event event = em.find(Event.class, eventId);
			System.out.println(user);
			User userManaged = em.find(User.class, user.getId());
			List<User> userList = event.getUsers();
			boolean isGoing = false;
			for(int x=0; x<userList.size(); x++) {
				if(userList.get(x).getId() == userManaged.getId()) {
					isGoing = true;
				}
			}

			if(!isGoing) {
				userList.add(userManaged);
				event.setUsers(userList);
				return false;
			}

			return true;
		}




		@Override
		public boolean deleteUserFromEvent(int uid, int eid) {
			String query = "SELECT e FROM Event e JOIN FETCH e.users WHERE e.id = :eid";
			Event event = em.createQuery(query, Event.class).setParameter("eid", eid).getResultList().get(0);
			List<User> listOfUsers = event.getUsers();
			for(int x=0; x < listOfUsers.size(); x++) {
				if(listOfUsers.get(x).getId() == uid) {
					System.out.println(listOfUsers.remove(x));
				}
			}
			//get persisted user
			event = em.find(Event.class, eid);
			//set users events so that the new events list persists
			event.setUsers(listOfUsers);

			return true;
		}




}
