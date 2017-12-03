package controllers;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;
import data.UserDAO;
import data.UserDAOImpl;
import entities.Address;
import entities.Event;
import entities.User;

@Controller
public class EventController {
	@Autowired
	private EventDAO dao;
	
	@Autowired
	private UserDAO userDao;
	
	//This method takes you from the index page to the create event page
	@RequestMapping(path="createEventPage.do", method=RequestMethod.GET)
	public ModelAndView createHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createevent.jsp");
		return mv;
	}
	
	//This method causes the actual event to populate
	@RequestMapping(path="createEvent.do", method=RequestMethod.POST)
	public ModelAndView createEvent(HttpSession session, String activity, String when, String street
			,String city, String state, String desc, String event) {
		ModelAndView mv = new ModelAndView();
		//Generate a Address object from the address fields
		Address newAddress= new Address();
		newAddress.setAddress(street);
		newAddress.setCity(city);
		newAddress.setState(state);
		//date time
		String str = when;
		str = str.replace("T", " ");
		//System.out.println(when);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
		
		//Get session userId to see who is currently loged in
		Object contextObject = session.getAttribute("sessionId");
		if(contextObject == null) {
			mv.setViewName("login.jsp");
		}
		int ownerId = (Integer) contextObject;
		User owner = userDao.getUserById(ownerId);
		//Create a new event object
		Event newEvent = new Event(activity, owner, dateTime, newAddress);
		//The dao adds the event to the database here
		dao.create(newEvent);
		mv.setViewName("createevent.jsp");
		return mv;
	}
	//This method causes the actual event to populate
	@RequestMapping(path="updateevent.do", method=RequestMethod.GET)
	public ModelAndView updateEvent(HttpSession session, int eid, String activity, String when, String street
			,String city, String state, String desc) {
		ModelAndView mv = new ModelAndView();
		Event e = dao.getEventById(eid);
		System.out.println(e);
//		Event updatedEvent = dao.updateEvent(event.getId(), event);
		Event updatedEvent = dao.updateEvent(eid, activity, when, street, city, state, e.getOwner().getId());
//		Event updatedEvent = dao.getEventById(eventId);
		//Generate a Address object from the address fields
//		Address newAddress= new Address();
//		newAddress.setAddress(street);
//		newAddress.setCity(city);
//		newAddress.setState(state);
		//date time
//		String str = when;
//		str = str.replace("T", " ");
		//System.out.println(when);
//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//		LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
		
		//Get session userId to see who is currently loged in
//		Object contextObject = session.getAttribute("sessionId");
//		if(contextObject == null) {
//			mv.setViewName("login.jsp");
//		}
//		int ownerId = (Integer) contextObject;
//		User owner = userDao.getUserById(ownerId);
//		updatedEvent.setActivity(activity);
//		updatedEvent.setAddress(newAddress);
//		updatedEvent.setDateTime(dateTime);
		//Create a new event object
//		Event newEvent = new Event(activity, owner, dateTime, newAddress);
		//The dao updates the event to the database here
		mv.addObject("event", updatedEvent);
		mv.setViewName("viewprofile.do");
		return mv;
	}
	
	@RequestMapping(path="attendEvent.do", method=RequestMethod.GET)
	public ModelAndView attendHome() {
		ModelAndView mv = new ModelAndView();
		List<Event> events = dao.getAllEvents();
		List<Event> eventsWithUsers = dao.getAllEventsWithUsers();
		mv.addObject("eventsWithUsers", eventsWithUsers);
		mv.addObject("events", events);
		mv.setViewName("attend.jsp");
		return mv;
	}
	@RequestMapping(path="deleteEvent.do", method=RequestMethod.GET)
	public ModelAndView deleteEvent(int eventId) {
		ModelAndView mv = new ModelAndView();
		System.out.println("HELLO");
		dao.destroyById(eventId);
		mv.setViewName("redirect:viewprofile.do");
		return mv;
	}
	
	@RequestMapping(path="addEventToUser.do", method=RequestMethod.GET)
	public ModelAndView addEventToUser(HttpSession session, int eventId) {
		ModelAndView mv = new ModelAndView();
		//get user from session
		User user = (User) session.getAttribute("user");
		if(user == null) {
			mv.setViewName("login.jsp");
		}
		
		//error message for attending event already going too
		boolean alreadyGoing = dao.addUserToEvent(eventId, user);
		if(alreadyGoing) {
			String errorMessage = "You are already attending this event";
			mv.addObject("errorMessage", errorMessage);
		}
		
		//list of all events
		List<Event> events = dao.getAllEvents();
		List<Event> events1 = dao.getAllEventsWithUsers();
		mv.addObject("eventsWithUsers", events1);
		mv.addObject("events", events);
		mv.setViewName("attend.jsp");
		return mv;
	}
	
}
