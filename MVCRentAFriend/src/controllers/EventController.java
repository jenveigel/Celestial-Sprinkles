package controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;
import data.UserDAO;
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
	@RequestMapping(path="createEvent.do", method=RequestMethod.GET)
	public ModelAndView createEvent(HttpSession session, String activity, 
			String when, String street
			,String city, String state, String desc, 
			String event, String title) {
		ModelAndView mv = new ModelAndView();
		
		//error checking for state field
		if(state.length()!=2){
			mv.addObject("errorMessage","Enter two character state code");
			mv.setViewName("createevent.jsp");
			return mv;
		}
		//Generate a Address object from the address fields
		Address newAddress= new Address();
		newAddress.setAddress(street);
		newAddress.setCity(city);
		newAddress.setState(state);
		//date time
		if(when.trim().equals("")) {
			mv.addObject("errorMessage","fix you time foo");
			mv.setViewName("createevent.jsp");
			return mv;
		}
		String str = when;
		str = str.replace("T", " ");
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
		newEvent.setDescription(desc);
		newEvent.setTitle(title);
		if(newEvent.getTitle()==""||newEvent.getActivity()==""||
		   newEvent.getDateTime()==null||newEvent.getDescription()==""||
		   newEvent.getOwner()==null||newEvent.getAddress().getAddress()==""||
		   newEvent.getAddress().getCity()==""||
		   newEvent.getAddress().getState()=="") 
		{
			mv.addObject("errorMessage","No blank fields");
			mv.setViewName("createevent.jsp");
			return mv;
		}
			
		
		//The dao adds the event to the database here
		dao.create(newEvent);
		dao.addUserToEvent(newEvent.getId(), owner);
		
		mv.setViewName("viewprofile.do");
		return mv;
	}
	
	
	//This method causes the actual event to populate
	@RequestMapping(path="updateevent.do", method=RequestMethod.GET)
	public ModelAndView updateEvent(HttpSession session, int eid, String event, String activity, String when, String street
			,String city, String state, String desc) {
		ModelAndView mv = new ModelAndView();
		Event e = dao.getEventById(eid);
		Event updatedEvent = dao.updateEvent(eid, event, activity, when, street, city, state, desc, e.getOwner().getId());

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
	public ModelAndView deleteEvent(HttpSession session, int eventId) {
		ModelAndView mv = new ModelAndView();
		
		Object obj = session.getAttribute("sessionId");
		int id = (Integer) obj;
		
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
	
	@RequestMapping(path="cancelrsvp.do", method = RequestMethod.GET)
	public ModelAndView login(HttpSession sessionId, Integer eid) {
		ModelAndView mv = new ModelAndView();
		Object obj = sessionId.getAttribute("sessionId");
		int id = (Integer) obj;
		User user = userDao.getUserById(id);
		dao.deleteUserFromEvent(user.getId(), eid);		
		mv.setViewName("viewprofile.do");
		return mv;
	}
	
	@RequestMapping(path="search.do", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam("search") String search) {
		ModelAndView mv = new ModelAndView();
//		List<Event> events = dao.getAllEvents();
		List<Event> searchedEvents = dao.getAllEventsByKeyword(search);
		List<Event> eventsWithUsers = dao.getAllEventsWithUsers();
		mv.addObject("eventsWithUsers", eventsWithUsers);
		mv.addObject("events", searchedEvents);
		mv.setViewName("attend.jsp");
		return mv;
	}
	
	
}
