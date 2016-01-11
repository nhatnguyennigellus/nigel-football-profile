package nigel.footballprofile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller for home page and other common pages
 * 
 * @author Nigellus
 *
 *         Oct 25, 2015 10:22:51 PM
 */
@Controller
public class HomeController {
	@Autowired
	ProfileService profileService;

	/**
	 * Redirect to 404 page
	 * 
	 * @return
	 *
	 *         Oct 25, 2015 10:24:42 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/404")
	public String error404() {
		return "404";
	}

	/**
	 * Redirect to About page
	 * 
	 * @return
	 *
	 *         Oct 25, 2015 10:27:07 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/about")
	public String about() {
		return "about";
	}

	/**
	 * Redirects to Home Page
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Oct 25, 2015 10:26:05 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/home")
	public String redirectHome(Model model, HttpServletRequest request) {
		// HttpSession session = request.getSession();

		return "home";
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * Oct 26, 2015 9:56:21 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/admin")
	public String redirectAdmin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("CountryNo", profileService.getCountryList().size());
		session.setAttribute("CityNo", profileService.getCityList().size());
		session.setAttribute("StadeNo", profileService.getStadiumList().size());
		session.setAttribute("TeamNo", profileService.getTeamList().size());
		session.setAttribute("PlayerNo", profileService.getPlayerList().size());
		session.setAttribute("ChampNo", profileService.getChampionshipList().size());
		session.setAttribute("MatchNo", 0);
		session.setAttribute("LogNo", profileService.getWorkLogList().size());
		session.setAttribute("Items", profileService.getItemList());
		return "admin";
	}
}
