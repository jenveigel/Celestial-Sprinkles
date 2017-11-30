package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	
	
}
