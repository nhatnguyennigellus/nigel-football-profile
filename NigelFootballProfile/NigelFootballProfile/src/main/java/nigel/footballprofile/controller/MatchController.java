package nigel.footballprofile.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.Scorer;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	 * 		Jan 10, 2016 9:47:53 PM
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
	 * 		Jan 10, 2016 9:56:04 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/match")
	public String toMatch(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("Items", profileService.getItemList());
		session.removeAttribute("txtError");
		session.removeAttribute("success");
		List<Stadium> listStadium = profileService.getStadiumList();
		List<Team> listTeam = profileService.getTeamList();
		List<Match> listMatch = new ArrayList<Match>();
		List<Championship> listChamp = profileService.getChampionshipList();
		Championship champ = new Championship();

		if (request.getParameter("srcChamp") == null || request.getParameter("srcChamp").equals("All")) {
			listMatch = profileService.getMatchList();
			request.setAttribute("selectedId", "All");
		} else {
			champ = profileService.getChampionshipById(Integer.parseInt(request.getParameter("srcChamp")));

			listMatch = profileService.getMatchListByChamp(Integer.parseInt(request.getParameter("srcChamp")));
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
	 * 		Jan 18, 2016 10:17:12 PM
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

				listItem = profileService.getItemByType("LEAGUE ROUND", champ.getLanguage());

			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_PLAY_OFF)) {

				listItem = profileService.getItemByType("CUP ROUND", champ.getLanguage());
			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
				listItem = profileService.getItemByType("TOUR ROUND", champ.getLanguage());
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
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 *
	 * 		Mar 24, 2016 4:55:26 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/importMatches", method = RequestMethod.POST)
	public String importMatches(@RequestParam("file") MultipartFile file, HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		int champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);

		boolean isOK = true;

		boolean errExist = false;
		StringBuilder errorMsg = new StringBuilder();
		int count = 0;
		if (!file.isEmpty()) {
			BufferedReader br = null;
			String line = "";

			try {
				InputStream inputStream = file.getInputStream();
				br = new BufferedReader(new InputStreamReader(inputStream));
				while ((line = br.readLine()) != null) {
					String[] stdData = line.split(",");
					if (stdData.length != 4) {
						continue;
					}

					Team teamA = new Team();
					Team teamB = new Team();
					if (profileService.getTeamByName("", stdData[0]) != null) {
						teamA = profileService.getTeamByName("", stdData[0]);
					} else {
						isOK = false;
						errorMsg.append("Team A Short Name not found! ");
						continue;
					}

					if (profileService.getTeamByName("", stdData[1]) != null) {
						teamB = profileService.getTeamByName("", stdData[1]);
					} else {
						isOK = false;
						errorMsg.append("Team B Short Name not found! ");
						continue;
					}

					Date dateTime = null;
					try {
						dateTime = DateUtil.stringToDate(stdData[2]);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					Stadium stadium = new Stadium();
					if (stdData[3].equals("Home")) {
						stadium = teamA.getStadium();
					} else {
						stadium = profileService.getStadiumById(stdData[3]);
					}

					String round = request.getParameter("round");

					Match match = new Match();
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

					if (profileService.addMatch(match) && profileService.addMatchTeam(matchTeamA)
							&& profileService.addMatchTeam(matchTeamB)) {
						count++;
					} else {
						isOK = false;
					}
				}
			} catch (IOException e) {
				errorMsg.append(" Import error! ");
				isOK = false;
			}
		} else {
			errorMsg.append(" File was empty! ");
			isOK = false;
		}

		String successMsg = "";
		if (count > 0) {
			String ctryMsg = (count > 1) ? " matches" : " match";
			successMsg = "Imported " + count + ctryMsg + " successfully!";
		}
		if (!isOK) {
			errorMsg.append(" Error occurs! ");
			if (errExist) {
				errorMsg.append("One or more existed stadia");
			}
			request.getSession().setAttribute("txtError", errorMsg.toString());
		}

		// Add Work Log
		if (!successMsg.equals("")) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_IMPORT, successMsg);
		}

		return "redirect:standing?srcChamp=" + champ.getChampId();
	}

	/**
	 * 
	 * @param match
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Jan 18, 2016 11:26:47 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addMatch", method = RequestMethod.POST)
	public String addMatch(@ModelAttribute("match") @Valid Match match, BindingResult result, Model model,
			HttpServletRequest request) {
		Team teamA = profileService.getTeamById(request.getParameter("teamA").toString());
		Team teamB = profileService.getTeamById(request.getParameter("teamB").toString());
		if (teamA.getTeamId().equals(teamB.getTeamId())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Team A must not be the same as Team B!");
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
		Stadium stadium = profileService.getStadiumById(request.getParameter("stadium"));
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

		if (profileService.addMatch(match) && profileService.addMatchTeam(matchTeamA)
				&& profileService.addMatchTeam(matchTeamB)) {
			String successMsg = "Added match successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_ADD,
					"Added match [" + matchTeamA.getTeam().getFullName() + " - " + matchTeamB.getTeam().getFullName()
							+ ", " + match.getStadium().getName() + ", " + match.getRound() + ", "
							+ match.getChampionship().getFullName() + "]");
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
	 * 		Jan 29, 2016 8:08:14 AM
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
					listItem = profileService.getItemByType("LEAGUE ROUND", "D");
				} else {
					listItem = profileService.getItemByType("LEAGUE ROUND", "E");
				}

			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_PLAY_OFF)) {
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
	 * 		Feb 1, 2016 11:05:26 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyMatch", method = RequestMethod.POST)
	public String modifyMatch(Model model, HttpServletRequest request) {
		Team teamA = profileService.getTeamById(request.getParameter("teamA").toString());
		Team teamB = profileService.getTeamById(request.getParameter("teamB").toString());
		if (teamA.getTeamId().equals(teamB.getTeamId())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Team A must not be the same as Team B!");
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
		Stadium stadium = profileService.getStadiumById(request.getParameter("stadium"));
		String round = request.getParameter("round");
		match.setDateTime(dateTime);
		match.setRound(round);
		match.setStadium(stadium);

		MatchTeam mteamA = profileService.getMatchTeamBySide("A", match);
		MatchTeam mteamB = profileService.getMatchTeamBySide("B", match);
		mteamA.setTeam(teamA);
		mteamB.setTeam(teamB);

		if (profileService.updateMatch(match) && profileService.updateMatchTeam(mteamA)
				&& profileService.updateMatchTeam(mteamB)) {
			String successMsg = "Modified match successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_UPDATE,
					"Modified match [" + mteamA.getTeam().getFullName() + " - " + mteamB.getTeam().getFullName() + ", "
							+ match.getStadium().getName() + ", " + match.getRound() + ", "
							+ match.getChampionship().getFullName() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return toModifyMatch(model, request);
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Feb 2, 2016 8:55:51 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/updateScore", method = RequestMethod.POST)
	public String updateScore(Model model, HttpServletRequest request) {
		String matchId = request.getParameter("matchId");
		int champId = Integer.parseInt(request.getParameter("srcChamp"));
		int goalA = Integer.parseInt(request.getParameter("goalA"));
		int goalB = Integer.parseInt(request.getParameter("goalB"));

		boolean is1stTime = true;
		Match match = profileService.getMatchById(matchId);
		Match oldMatch = profileService.getMatchById(matchId);

		is1stTime = match.isPlayed() ? false : true;
		match.setGoalA(goalA);
		match.setGoalB(goalB);
		match.setPlayed(true);

		if (profileService.updateMatch(match)) {
			String successMsg = "Updated score successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			Championship champ = profileService.getChampionshipById(champId);

			if (match.getRound().startsWith("LRD") || match.getRound().startsWith("TRGR")) {
				profileService.updateStandingData(champ, match, oldMatch, is1stTime);
			}

			profileService.addWorkLog(AppConstant.WLOG_SUBMIT_SCORE,
					"Updated " + "score for match " + match.toString() + " - " + goalA + ":" + goalB);
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		model.addAttribute("champ", profileService.getChampionshipById(champId));

		String next = "";
		next = request.getParameter("from") != null ? "standing" : "match";
		return "redirect:" + next + "?srcChamp=" + champId;
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Feb 26, 2016 23:23:13 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toScorer")
	public String redirectToScorer(Model model, HttpServletRequest request) {
		if (!model.containsAttribute("addScr")) {
			request.getSession().removeAttribute("txtError");
			request.getSession().removeAttribute("success");
		}

		String matchId = request.getParameter("matchId");
		int champId = Integer.parseInt(request.getParameter("champId"));
		Match match = profileService.getMatchById(matchId);
		Championship champ = profileService.getChampionshipById(champId);
		model.addAttribute("match", match);
		model.addAttribute("champ", champ);
		Team teamA = profileService.getMatchTeamBySide("A", match).getTeam();
		Team teamB = profileService.getMatchTeamBySide("B", match).getTeam();
		model.addAttribute("teamPlayerA", teamA.getTeamplayers());
		model.addAttribute("teamPlayerB", teamB.getTeamplayers());

		return "modifyScorer";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Feb 27, 2016 8:08:11 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addScorer")
	public String addScorer(Model model, HttpServletRequest request) {
		String matchId = request.getParameter("matchId");
		Match match = profileService.getMatchById(matchId);

		int time = Integer.parseInt(request.getParameter("time"));
		int addedTime = Integer.parseInt(request.getParameter("addedTime"));
		String side = request.getParameter("side");
		String oppo = side.equals("A") ? "B" : "A";
		boolean og = request.getParameter("og") != null;
		boolean pen = request.getParameter("pen") != null;
		Player player = new Player();
		if (og) {
			player = profileService.getPlayerById(request.getParameter("player" + side + oppo));
		} else {
			player = profileService.getPlayerById(request.getParameter("player" + side));
		}

		Scorer scorer = new Scorer();
		scorer.setMatch(match);
		scorer.setOwnGoal(og);
		scorer.setPenalty(pen);
		scorer.setPlayer(player);
		scorer.setTeam(side);
		scorer.setTime(time);
		scorer.setAddedTime(addedTime);
		scorer.setStatus(true);

		model.addAttribute("addScr", "Y");
		if (profileService.addScorer(scorer)) {
			String successMsg = "Added scorer successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_SUBMIT_SCORE, "Added scorer [" + scorer.toString() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return redirectToScorer(model, request);
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Feb 28, 2016 12:22:59 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/removeScorer")
	public String removeScorer(Model model, HttpServletRequest request) {
		int scorerId = Integer.parseInt(request.getParameter("scorerId"));
		Scorer scorer = profileService.getScorerById(scorerId);
		scorer.setStatus(false);
		model.addAttribute("addScr", "Y");
		if (profileService.updateScorer(scorer)) {
			String successMsg = "Removed scorer successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_SUBMIT_SCORE, "Removed scorer [" + scorer.toString() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return redirectToScorer(model, request);
	}
}
