package controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

	@RequestMapping(path = "/generalErrors.do", method = RequestMethod.GET)
	public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {

		ModelAndView mv = new ModelAndView("errorPage.jsp");
		String errorMsg = "";
		String errorImg = "";
		int httpErrorCode = getErrorCode(httpRequest);

		switch (httpErrorCode) {
		case 400: {
			errorMsg = "Http Error Code: 400. Bad Request";
			errorImg = "https://www.an8bitmind.com/wp-content/uploads/2016/02/YOU-MUST-CONSTRUCT-ADDITIONAL-PYLONS.jpg";
			break;
		}
		case 404: {
			errorMsg = "Http Error Code: 404. Resource not found";
			errorImg = "http://i.imgur.com/BAbXpMz.jpg";
			break;
		}
		case 500: {
			errorMsg = "Http Error Code: 500. Internal Server Error";
			errorImg = "https://fthmb.tqn.com/khRFVrXPVo2F7Uf8H3A_i5ycuYE=/768x0/filters:no_upscale()/please-stand-by-500879062-56fd7b5f3df78c7d9efc4ed2.jpg";
			break;
		}
		}
		mv.addObject("errorMsg", errorMsg);
		mv.addObject("errorImg", errorImg);
		return mv;
	}

	private int getErrorCode(HttpServletRequest httpRequest) {
		return (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
	}
}
