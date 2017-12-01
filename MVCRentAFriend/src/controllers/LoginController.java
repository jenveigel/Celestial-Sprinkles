package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.UserDAO;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO dao;
	
	//This method takes you from the index page to the profile page
		@RequestMapping(path="viewprofile.do", method=RequestMethod.GET)
		public ModelAndView createHome() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("viewprofile.jsp");
			return mv;
		}
}