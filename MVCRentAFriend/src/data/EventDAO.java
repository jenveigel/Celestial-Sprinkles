package data;

import java.util.List;
import java.util.Set;

import entities.Event;
import entities.User;

public interface EventDAO {
	public Event create(Event event);
	public Event updateEvent(int id, Event event);
	public boolean destroyById(int id);
	public Event getEventById(int id);
	public List<Event> getAllEvents();
	public List<Event> getAllEventsByCity(String city);
	public List<Event> getAllEventsByState(String state);
	public List<Event> getAllEventsByActivity(String activity);
	public boolean addUserToEvent(int eventId,User user);
	List<Event> getAllEventsByUserId(User user);
	List<Event> getAllEventsWithUsers();
	public Event updateEvent(int eid, String title, String activity, String when, String street, String city, String state, String desc, int id);
	boolean deleteUserFromEvent(int uid, int eid);
	public List<Event> getAllEventsByKeyword(String title);
}
