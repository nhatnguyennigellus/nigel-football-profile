package nigel.footballprofile.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.MatchTeam;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.entity.State;
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
 * Controller handles Match's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:45:43 PM
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
	 *         Jan 10, 2016 9:47:53 PM
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
	 *         Jan 10, 2016 9:56:04 PM
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
		Championship champ = new Championship();

		if (request.getParameter("srcChamp") == null
				|| request.getParameter("srcChamp").equals("All")) {
			listMatch = profileService.getMatchList();
			request.setAttribute("selectedId", "All");
		} else {
			champ = profileService.getChampionshipById(Integer.parseInt(request
					.getParameter("srcChamp")));

			listMatch = profileService.getMatchListByChamp(Integer
					.parseInt(request.getParameter("srcChamp")));
			request.setAttribute("selectedId", request.getParameter("srcChamp"));
			model.addAttribute("champ", champ);
			
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

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 18, 2016 10:17:12 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toAddMatch")
	public String toAddMatch(Model model, HttpServletRequest request) {
		if (!model.containsAttribute("match")) {
			model.addAttribute("match", new Match());
		}
		int champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		List<Item> listItem = new ArrayList<Item>();
		List<Stadium> listStadium = new ArrayList<Stadium>(champ.getStadiums());
		List<Team> listTeams = new ArrayList<Team>();

		for (State state : profileService.getStateListByChamp(champ)) {
			listTeams.add(state.getTeam());
		}

		if (champ != null) {
			if (champ.getFormula().equals(AppConstant.CHAMP_FORM_LEAGUE)) {
				if (champ.getFullName().contains("Bundesliga")) {
					listItem = profileService
							.getItemByType("LEAGUE ROUND", "D");
				} else {
					listItem = profileService
							.getItemByType("LEAGUE ROUND", "E");
				}

			} else if (champ.getFormula().equals(
					AppConstant.CHAMP_FORM_PLAY_OFF)) {
				if (champ.getFullName().contains("DFB")) {
					listItem = profileService.getItemByType("CUP ROUND", "D");
				} else {
					listItem = profileService.getItemByType("CUP ROUND", "E");
				}
			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
				listItem = profileService.getItemByType("TOUR ROUND", "E");
			}
		}

		model.addAttribute("listItem", listItem);
		model.addAttribute("listStadium", listStadium);
		model.addAttribute("listTeam", listTeams);
		model.addAttribute("champ", champ);
		return "addMatch";
	}

	/**
	 * 
	 * @param match
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 18, 2016 11:26:47 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addMatch", method = RequestMethod.POST)
	public String addMatch(@ModelAttribute("match") @Valid Match match,
			BindingResult result, Model model, HttpServletRequest request) {
		Team teamA = profileService.getTeamById(request.getParameter("teamA")
				.toString());
		Team teamB = profileService.getTeamById(request.getParameter("teamB")
				.toString());
		if (teamA.getTeamId().equals(teamB.getTeamId())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError",
					"Team A must not be the same as Team B!");
			return toAddMatch(model, request);
		}

		int champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		Date dateTime = null;
		try {
			dateTime = DateUtil.stringToDate(request.getParameter("dateTime"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Stadium stadium = profileService.getStadiumById(request
				.getParameter("stadium"));
		String round = request.getParameter("round");

		match.setMatchId(IDGenerator.genMatchId(profileService.getMatchList()));
		match.setDateTime(dateTime);
		match.setPlayed(false);
		match.setRound(round);
		match.setGoalA(0);
		match.setGoalB(0);

		match.setStadium(stadium);
		match.setChampionship(champ);

		MatchTeam matchTeamA = new MatchTeam();
		matchTeamA.setTeam(teamA);
		matchTeamA.setSide("A");
		matchTeamA.setMatch(match);
		MatchTeam matchTeamB = new MatchTeam();
		matchTeamB.setTeam(teamB);
		matchTeamB.setSide("B");
		matchTeamB.setMatch(match);
		match.getMatchTeams().add(matchTeamA);
		match.getMatchTeams().add(matchTeamB);

		if (profileService.addMatch(match)
				&& profileService.addMatchTeam(matchTeamA)
				&& profileService.addMatchTeam(matchTeamB)) {
			String successMsg = "Added match successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added match ["
					+ matchTeamA.getTeam().getFullName() + " - "
					+ matchTeamB.getTeam().getFullName() + ", "
					+ match.getStadium().getName() + ", " + match.getRound()
					+ ", " + match.getChampionship().getFullName() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return toAddMatch(model, request);
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 29, 2016 8:08:14 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toModifyMatch")
	public String toModifyMatch(Model model, HttpServletRequest request) {
		int champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		List<Item> listItem = new ArrayList<Item>();
		List<Stadium> listStadium = new ArrayList<Stadium>(champ.getStadiums());
		List<Team> listTeams = new ArrayList<Team>();

		for (State state : profileService.getStateListByChamp(champ)) {
			listTeams.add(state.getTeam());
		}

		if (champ != null) {
			if (champ.getFormula().equals(AppConstant.CHAMP_FORM_LEAGUE)) {
				if (champ.getFullName().contains("Bundesliga")) {
					listItem = profileService
							.getItemByType("LEAGUE ROUND", "D");
				} else {
					listItem = profileService
							.getItemByType("LEAGUE ROUND", "E");
				}

			} else if (champ.getFormula().equals(
					AppConstant.CHAMP_FORM_PLAY_OFF)) {
				if (champ.getFullName().contains("DFB")) {
					listItem = profileService.getItemByType("CUP ROUND", "D");
				} else {
					listItem = profileService.getItemByType("CUP ROUND", "E");
				}
			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
				listItem = profileService.getItemByType("TOUR ROUND", "E");
			}
		}

		model.addAttribute("listItem", listItem);
		model.addAttribute("listStadium", listStadium);
		model.addAttribute("listTeam", listTeams);

		String matchId = request.getParameter("matchId");
		Match match = profileService.getMatchById(matchId);
		MatchTeam teamA = profileService.getMatchTeamBySide("A", match);
		MatchTeam teamB = profileService.getMatchTeamBySide("B", match);
		model.addAttribute("match", match);
		model.addAttribute("champ", champ);
		model.addAttribute("teamA", teamA);
		model.addAttribute("teamB", teamB);

		return "modifyMatch";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Feb 1, 2016 11:05:26 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyMatch", method = RequestMethod.POST)
	public String modifyMatch(Model model, HttpServletRequest request) {
		Team teamA = profileService.getTeamById(request.getParameter("teamA")
				.toString());
		Team teamB = profileService.getTeamById(request.getParameter("teamB")
				.toString());
		if (teamA.getTeamId().equals(teamB.getTeamId())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError",
					"Team A must not be the same as Team B!");
			return toModifyMatch(model, request);
		}

		String matchId = request.getParameter("matchId");
		Match match = profileService.getMatchById(matchId);
		Date dateTime = null;
		try {
			dateTime = DateUtil.stringToDate(request.getParameter("dateTime"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Stadium stadium = profileService.getStadiumById(request
				.getParameter("stadium"));
		String round = request.getParameter("round");
		match.setDateTime(dateTime);
		match.setRound(round);
		match.setStadium(stadium);

		MatchTeam mteamA = profileService.getMatchTeamBySide("A", match);
		MatchTeam mteamB = profileService.getMatchTeamBySide("B", match);
		mteamA.setTeam(teamA);
		mteamB.setTeam(teamB);

		if (profileService.updateMatch(match)
				&& profileService.updateMatchTeam(mteamA)
				&& profileService.updateMatchTeam(mteamB)) {
			String successMsg = "Modified match successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(
					AppConstant.WLOG_UPDATE,
					"Modified match [" + mteamA.getTeam().getFullName() + " - "
							+ mteamB.getTeam().getFullName() + ", "
							+ match.getStadium().getName() + ", "
							+ match.getRound() + ", "
							+ match.getChampionship().getFullName() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return toModifyMatch(model, request);
	}

	@RequestMapping(value = "/updateScore", method = RequestMethod.POST)
	public String updateScore(Model model, HttpServletRequest request) {
		String matchId = request.getParameter("matchId");
		int champId =  Integer.parseInt(request.getParameter("srcChamp"));
		int goalA = Integer.parseInt(request.getParameter("goalA"));
		int goalB = Integer.parseInt(request.getParameter("goalB"));

		Match match = profileService.getMatchById(matchId);
		match.setGoalA(goalA);
		match.setGoalB(goalB);
		match.setPlayed(true);

		if (profileService.updateMatch(match)) {
			String successMsg = "Updated score successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_SUBMIT_SCORE, "Updated "
					+ "score for match " + match.toString() + " - " + goalA
					+ ":" + goalB);
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		
		model.addAttribute("champ", profileService.getChampionshipById(champId));
		return "redirect:match?srcChamp=" + champId;
	}
}
