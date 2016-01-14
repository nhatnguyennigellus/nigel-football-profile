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
import nigel.footballprofile.entity.TeamPlayer;
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
	 *         Nov 27, 2015 11:52:10 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toTeamPlayer")
	public String redirectToTeamPlayer(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		List<Team> listClub = profileService
				.getTeamByType(AppConstant.TEAM_CLUB);
		List<Team> listNation = profileService
				.getTeamByType(AppConstant.TEAM_NATIONAL);
		String playerId = request.getParameter("pId");
		Player player = profileService.getPlayerById(playerId);

		model.addAttribute("listClub", listClub);
		model.addAttribute("listNational", listNation);
		model.addAttribute("player", player);

		return "teamPlayer";
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
	 *         Dec 4, 2015 11:37:20 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toUpdatePlayer")
	public String redirectModifyPlayer(Model model, HttpServletRequest request) {
		String playerId = request.getParameter("id");
		Player player = profileService.getPlayerById(playerId);
		if (!model.containsAttribute("player")) {
			model.addAttribute("player", player);
		}
		model.addAttribute("countries", profileService.getCountryList());
		return "modifyPlayer";
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
	public String addPlayer(Model model, HttpServletRequest request) {
		List<Player> listPlayer = new ArrayList<Player>();
		if (request.getParameter("srcTeam") == null
				|| request.getParameter("srcTeam").equals("All")) {
			listPlayer = profileService.getPlayerList();
			request.setAttribute("selectedId", "All");

		} else {
			Team team = profileService.getTeamById(request
					.getParameter("srcTeam"));
			listPlayer = profileService.getPlayerListByTeam(team);
			request.setAttribute("selectedId", request.getParameter("srcTeam"));
			model.addAttribute("teamName", team.getFullName());
			model.addAttribute("logoUrl", team.getLogoUrl());
			Player captain = profileService.findCaptain(team);
			if(captain != null) {		
				model.addAttribute("captain", captain.getPlayerId());
			}
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
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 28, 2015 7:16:43 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/teamPlayer")
	public String teamPlayer(Model model, HttpServletRequest request) {

		return "teamPlayer";
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
	
	/**
	 * 
	 * @param player
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 * Dec 5, 2015 6:30:28 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyPlayer", method = RequestMethod.POST)
	public String updatePlayer(@ModelAttribute("player") @Valid Player player,
			BindingResult result, Model model, HttpServletRequest request) {
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
		if (profileService.updatePlayer(player)) {
			String successMsg = "Modified player successfully!";
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
			profileService.addWorkLog(AppConstant.WLOG_UPDATE, "Modified player ["
					+ player.toString() + nations.toString() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		
		return redirectModifyPlayer(model, request);
	}

	@RequestMapping(value = "/addTeamPlayer")
	public String addTeamPlayer(Model model, HttpServletRequest request) {

		if (profileService.callPlayerToTeam(request)) {
			Player player = profileService.getPlayerById(request
					.getParameter("playerId"));
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute(
					"success",
					"Updated teams for " + player.getFirstName() + " "
							+ player.getLastName());

			profileService
					.addWorkLog(AppConstant.WLOG_UPDATE, "Updated teams for "
							+ "player [" + player.toString() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:player";
	}
}
