package data;

import java.util.List;
import java.util.Set;

import entities.Event;
import entities.User;

public interface EventDAO {
	public Event create(Event event);
	public Event update(int id, Event event);
	public boolean destroyById(int id);
	public Event getEventById(int id);
	public List<Event> getAllEvents();
	public List<Event> getAllEventsByCity(String city);
	public List<Event> getAllEventsByState(String state);
	public List<Event> getAllEventsByActivity(String activity);
	public boolean addUserToEvent(int eventId,User user);
	List<Event> getAllEventsByUserId(User user);
}
