package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;
import entities.Event;

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
	public ModelAndView createEvent() {
		ModelAndView mv = new ModelAndView();
		Event newEvent = new Event(activity, ownerId, dateTime, address)
		
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
