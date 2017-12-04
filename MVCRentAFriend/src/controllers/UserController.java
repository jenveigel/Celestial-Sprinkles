package controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.UserDAO;
import entities.Event;
import entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	

	@RequestMapping(path = "createUser.do", method = RequestMethod.GET)
	public String createUser() {
		return "createAccount.jsp";
	}

	////Creates 
	@RequestMapping(path="addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(String userName, String password, String firstName,
			String lastName, String imgUrl, String bio) {
		ModelAndView mv = new ModelAndView();
		boolean notNullValues = dao.createUser(userName, password, firstName,lastName , bio,imgUrl);
		if(notNullValues == false) {
			mv.setViewName("createAccount.jsp");
			String errorMessage = "You are missing a filled field";
			mv.addObject(errorMessage);
		}
		mv.setViewName("login.jsp");
		return mv;
	}
	
	//For Button to take you to login page
	@RequestMapping(path="loginPage.do", method=RequestMethod.GET)
	public String loginPage() {
		return "login.jsp";
	}
	
	
	@RequestMapping(path="login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, String userName, String password) {
		ModelAndView mv = new ModelAndView();
		User user = dao.getUserByUserName(userName);
		if(user!=null&&user.getPassword().equals(password)) {
			mv.setViewName("index.jsp");
			session.setAttribute("sessionId", user.getId());
			session.setAttribute("sessionObj", user);
			session.setAttribute("user", user);
		} else {
			mv.addObject("errorMessage","Username or password Incorrect.");
			mv.setViewName("login.jsp");
		}
		return mv;
	}
	
	
	
	
	
	
}
