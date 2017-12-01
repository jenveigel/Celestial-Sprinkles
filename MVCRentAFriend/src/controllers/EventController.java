package controllers;

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
	
	//This method takes you from the index page to the create event page
	@RequestMapping(path="createEventPage.do", method=RequestMethod.GET)
	public ModelAndView createHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createevent.jsp");
		return mv;
	}
	
	//This method causes the actual event to populate
	@RequestMapping(path="createEvent.do")
	public ModelAndView createEvent(HttpSession session, String activity, Date dateTime, String street
			,String city, String state, String desc, String event) {
		ModelAndView mv = new ModelAndView();
		//Generate a Address object from the address fields
		Address newAddress= new Address();
		newAddress.setAddress(street);
		newAddress.setCity(city);
		newAddress.setState(state);
		//Save session userId to see who is currently loged in
		Object obj = session.getAttribute("userId");
		int ownerId = (Integer) obj;
		//new userdao to get user by the id
		UserDAO udao = new UserDAOImpl();
		User owner =udao.getUserById(ownerId);
		//Create a new event object
		Event newEvent = new Event(activity, owner, dateTime, newAddress);
		//The dao adds the event to the database here
		dao.create(newEvent);

		return mv;
	}
	
	@RequestMapping(path="attendEvent.do", method=RequestMethod.GET)
	public ModelAndView attendHome() {
		ModelAndView mv = new ModelAndView();
		List<Event> events = dao.getAllEvents();
		mv.addObject("events", events);
		mv.setViewName("attend.jsp");
		return mv;
	}
	
}
