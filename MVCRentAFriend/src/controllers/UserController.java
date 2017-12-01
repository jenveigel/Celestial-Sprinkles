package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	////Creates 
	@RequestMapping(path="addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(String userName, String password) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login.jsp");
		userDAO.createUser(userName, password, "","");
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
		User user = userDAO.getUserByUserName(userName);
		if(user!=null&&user.getPassword().equals(password)) {
			mv.setViewName("index.jsp");
			session.setAttribute("userId", user.getId());
			Object obj = session.getAttribute("userId");
			int i = (Integer) obj;
			System.out.println(i);
			//USER ID SAVED TO SESSION GOES HERE
		} else {
			mv.addObject("errorMessage","Username or password Incorrect.");
			mv.setViewName("login.jsp");
		}
		return mv;
	}
	
	
	
}
