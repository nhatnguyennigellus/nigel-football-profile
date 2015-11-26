package nigel.footballprofile.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import nigel.footballprofile.entity.Country;
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.DateUtil;
import nigel.footballprofile.service.IDGenerator;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller handles Player's action
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:38:06 PM
 */
@Controller
public class PlayerController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 21, 2015 4:45:45 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toPlayer")
	public String redirectToPlayer(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:player";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 21, 2015 4:49:36 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toAddPlayer")
	public String redirectToAddPlayer(Model model, HttpServletRequest request) {
		if (!model.containsAttribute("player")) {
			model.addAttribute("player", new Player());
		}
		model.addAttribute("countries", profileService.getCountryList());
		return "addPlayer";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 21, 2015 4:49:56 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/player")
	public String toPlayer(Model model, HttpServletRequest request) {
		List<Player> listPlayer = new ArrayList<Player>();
		if (request.getParameter("srcTeam") == null
				|| request.getParameter("srcTeam").equals("All")) {
			listPlayer = profileService.getPlayerList();
			request.setAttribute("selectedId", "All");
			
		} else {
			Team team= profileService
					.getTeamById(request.getParameter("srcTeam"));
			listPlayer = profileService.getPlayerListByTeam(team);
			request.setAttribute("selectedId", request.getParameter("srcTeam"));
			model.addAttribute("teamName", team.getFullName());
		}

		List<Team> listTeam = profileService.getTeamList();
		model.addAttribute("listPlayer", listPlayer);
		model.addAttribute("listTeam", listTeam);
		
		if (!model.containsAttribute("player")) {
			model.addAttribute("player", new Player());
		}
		return "player";
	}

	/**
	 * 
	 * @param team
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 22, 2015 12:42:54 PM
	 * @author Nigellus
	 */

	@RequestMapping(value = "/addPlayer", method = RequestMethod.POST)
	public String addPlayer(@ModelAttribute("player") @Valid Player player,
			BindingResult result, Model model, HttpServletRequest request) {
		player.setPlayerId(IDGenerator.genPlayerId(profileService
				.getPlayerList()));
		String[] nationalityIds = request.getParameterValues("nationality");
		List<Country> nationalities = new ArrayList<Country>();
		for (String id : nationalityIds) {
			nationalities.add(profileService.getCountryById(id));
		}
		String position = request.getParameter("position");
		Date birthdate = null;
		try {
			birthdate = DateUtil.shortStringToDate(request
					.getParameter("birthdate"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		player.setBirthdate(birthdate);
		player.setPosition(position);
		player.setNationalities(new HashSet<Country>(nationalities));
		if (profileService.addPlayer(player)) {
			String successMsg = "Added player successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);
			request.getSession().setAttribute("pId", player.getPlayerId());

			StringBuilder nations = new StringBuilder();
			nations.append(" (");
			for (int i = 0; i < nationalities.size(); i++) {
				nations.append(nationalities.get(i).getName());
				if (i < nationalities.size() - 1) {
					nations.append(", ");
				} else {
					nations.append(")");
				}
			}
			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added player ["
					+ player.toString() + nations.toString() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return redirectToAddPlayer(model, request);
	}
}
