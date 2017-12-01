package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.UserDAO;
import entities.Profile;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO dao;
	
	//This method takes you from the index page to the profile page
		@RequestMapping(path="viewprofile.do", method=RequestMethod.GET)
		public ModelAndView viewProfile() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("viewprofile.jsp");
			return mv;
		}
		
		@RequestMapping(path="editprofile.do", method=RequestMethod.POST)
		public ModelAndView editProfile(HttpSession sessionId, Profile profile) {
			
			ModelAndView mv = new ModelAndView();
			Object obj = sessionId.getAttribute("sessionId");
			int id = (Integer) obj;
			dao.updateProfile(id, profile);
			
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