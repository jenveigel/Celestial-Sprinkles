package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.UserDAO;
import entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path = "createUser.do", method = RequestMethod.GET)
	public String createUser() {
		return "createAccount.jsp";
	}
	
	@RequestMapping(path="addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(@RequestParam("user") User user) {
		ModelAndView mv = new ModelAndView();
		userDAO.createUser(user.getUserName(), user.getPassword(), user.getProfile().getFirstName(), user.getProfile().getLastName());
		return mv;
	}
	
}
