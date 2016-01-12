package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Controller handles Match's actions
 * 
 * @author Nigellus
 *
 * Oct 24, 2015 8:45:43 PM
 */
@Controller
public class MatchController {
	@Autowired
	ProfileService profileService;
	

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * Jan 10, 2016 9:47:53 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toMatch")
	public String redirectToStadium(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:match";
	}
	
	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * Jan 10, 2016 9:56:04 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/match")
	public String toMatch(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("Items", profileService.getItemList());
		List<Stadium> listStadium = profileService.getStadiumList();
		List<Team> listTeam = profileService.getTeamList();
		List<Match> listMatch = new ArrayList<Match>();
		List<Championship> listChamp = profileService.getChampionshipList();
		
		if (request.getParameter("srcChamp") == null
				|| request.getParameter("srcChamp").equals("All")) {
			listMatch = profileService.getMatchList();
			request.setAttribute("selectedId", "All");
		}
		else {
			Championship champ = profileService.getChampionshipById(
					Integer.parseInt(request.getParameter("srcChamp")));
					
			listMatch = profileService.getMatchListByChamp(
					Integer.parseInt(request.getParameter("srcChamp")));
			request.setAttribute("selectedId", request.getParameter("srcChamp"));
			model.addAttribute("champName", champ.getFullName());
			model.addAttribute("logoUrl", champ.getLogoUrl());
					
		}
		model.addAttribute("listStadium", listStadium);
		model.addAttribute("listTeam", listTeam);
		model.addAttribute("listMatch", listMatch);
		model.addAttribute("listChamp", listChamp);
		if (!model.containsAttribute("match")) {
			model.addAttribute("match", new Match());
		}

		return "match";
		
		
	}
}
