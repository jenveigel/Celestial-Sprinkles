package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;
import data.UserDAO;
import entities.Event;
import entities.Profile;
import entities.User;

@Controller
public class ProfileController {
	
	@Autowired
	private UserDAO dao;
	private EventDAO eventDao;
	
	//This method takes you from the index page to the profile page
		@RequestMapping(path="viewprofile.do", method=RequestMethod.GET)
		public ModelAndView viewProfile(HttpSession sessionId) {
			ModelAndView mv = new ModelAndView();
			
			Object obj = sessionId.getAttribute("sessionId");
			int id = (Integer) obj;
			
			User user = dao.getUserById(id);
			Profile prof = dao.getProfileByUserId(id);
			List<Event> events = eventDao.getAllEventsByUserId(id);
			
			
			
			
			mv.addObject("user", user);
			mv.addObject("profile", prof);
			mv.addObject("events", events);
			
			mv.setViewName("viewprofile.jsp");
			return mv;
		}
		
		@RequestMapping(path="editProfileWithValues.do", method=RequestMethod.GET)
		public ModelAndView editProfileWithValues(HttpSession sessionId, Profile profile) {
			
			ModelAndView mv = new ModelAndView();
			
			Object obj = sessionId.getAttribute("sessionId");
			int id = (Integer) obj;
			
			
			Profile prof = dao.getProfileByUserId(id);
			
			mv.addObject("profile", prof);
			mv.setViewName("editprofile.jsp");
			
			return mv;
		}
		
		@RequestMapping(path="editprofile.do", method=RequestMethod.POST)
		public ModelAndView editProfile(HttpSession sessionId, Profile profile) {
			
			ModelAndView mv = new ModelAndView();
			
			Object obj = sessionId.getAttribute("sessionId");
			int id = (Integer) obj;
			
			
			Profile prof = dao.updateProfile(id, profile);
			
			mv.addObject("profile", prof);
			mv.setViewName("viewprofile.jsp");
			
			return mv;
		}
		
//		@Override
//		public Profile updateProfile(int id, Profile profile) {
//			User user = em.find(User.class, id);
//			Profile updatedProfile = user.getProfile();
//			updatedProfile.setBio(profile.getBio());
//			updatedProfile.setFirstName(profile.getFirstName());
//			updatedProfile.setLastName(profile.getLastName());
//			updatedProfile.setImageURL(profile.getImageURL());
//			return updatedProfile;
//		}
		
//		@RequestMapping(path="addUser.do", method = RequestMethod.POST)
//		public ModelAndView addUser(String userName, String password) {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("login.jsp");
//			dao.createUser(userName, password, "","");
//			return mv;
//		}
		
		
}