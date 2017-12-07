package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;
import data.UserDAO;
import entities.Event;
import entities.Profile;
import entities.Review;
import entities.User;

@Controller
public class ProfileController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private EventDAO eventDao;

	//This method takes you from the index page to the profile page
		@RequestMapping(path="viewprofile.do", method=RequestMethod.GET)
		public ModelAndView viewProfile(HttpSession sessionObj) {
			ModelAndView mv = new ModelAndView();
			User user = (User) sessionObj.getAttribute("sessionObj");
			Profile prof;

			
			if(user == null) {
				mv.setViewName("login.jsp");
				return mv;
			}
			prof = dao.getProfileByUserId(user.getId());
			
			int id = user.getId();
			List<Event> events = eventDao.getAllEventsByUserId(user);
			List<Event> eventsWithUsers = eventDao.getAllEventsWithUsers();
			List<Review> reviews = dao.getReviewsByUser(user.getId());
			
			//System.out.println(reviews);
			mv.addObject("sessionUser", user);
			mv.addObject("user", user);
			mv.addObject("userId", id);
			mv.addObject("reviews", reviews);
			mv.addObject("profile", prof);
			mv.addObject("events", events);
			mv.addObject("eventsWithUsers", eventsWithUsers);
			mv.setViewName("viewprofile.jsp");
			return mv;
		}
		@RequestMapping(path="viewUserProfile.do", method=RequestMethod.GET)
		public ModelAndView viewUserProfile(@RequestParam("uid") int uid, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			User user = dao.getUserById(uid);
			User sessionUser = (User) session.getAttribute("sessionObj");
			Profile prof = dao.getProfileByUserId(uid);
			List<Event> events = eventDao.getAllEventsByUserId(user);
			List<Event> eventsWithUsers = eventDao.getAllEventsWithUsers();
			mv.addObject("sessionUser", sessionUser);
			mv.addObject("user", user);
			mv.addObject("userId", uid);
			mv.addObject("profile", prof);
			mv.addObject("events", events);
			mv.addObject("eventsWithUsers", eventsWithUsers);
			mv.setViewName("viewprofile.jsp");
			return mv;
		}

		@RequestMapping(path="editProfileWithValues.do", method=RequestMethod.GET)
		public ModelAndView editProfileWithValues(HttpSession session, Profile profile) {

			ModelAndView mv = new ModelAndView();
			
			
			Object obj = session.getAttribute("sessionId");
			int id = (Integer) obj;
			Object obj2 = session.getAttribute("user");
//			int id2 = (Integer) obj;


			Profile prof = dao.getProfileByUserId(id);
			mv.addObject("user", obj2);
			mv.addObject("profile", prof);
			mv.setViewName("editprofile.jsp");

			return mv;
		}

		@RequestMapping(path="editprofile.do", method=RequestMethod.GET)
		public ModelAndView editProfile(HttpSession sessionId, Profile profile) {

			ModelAndView mv = new ModelAndView();

			Object obj = sessionId.getAttribute("sessionId");
			int id = (Integer) obj;
			if(profile.getImageURL()==""||profile.getImageURL()==null) {
				profile.setImageURL("default.jpg");
			}

			Profile prof = dao.updateProfile(id, profile);

			mv.addObject("profile", prof);
			mv.setViewName("viewprofile.do");
			return mv;
		}
		@RequestMapping(path="viewUserReviews.do", method=RequestMethod.GET)
		public ModelAndView viewUserReviews(@RequestParam("uid") int uid, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			User user = dao.getUserById(uid);
			List<Review> reviews = dao.getReviewsByUser(uid);
			User sessionUser = (User) session.getAttribute("sessionObj");
			Profile prof = dao.getProfileByUserId(uid);
			mv.addObject("sessionUser", sessionUser);
			mv.addObject("user", user);
			mv.addObject("reviews", reviews);
			mv.addObject("userId", uid);
			mv.addObject("profile", prof);
			mv.setViewName("userReview.jsp");
			return mv;
		}

}
