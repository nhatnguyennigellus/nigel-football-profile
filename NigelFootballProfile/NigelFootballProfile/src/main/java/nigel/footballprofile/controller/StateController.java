package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.StandingsData;
import nigel.footballprofile.entity.State;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StateController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 13, 2016 11:12:22 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toParticipant")
	public String redirectToPlayer(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:participant";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 13, 2016 11:11:56 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/participant")
	public String toState(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<State> listState = new ArrayList<State>();
		Championship champ = new Championship();
		if (request.getParameter("champId") == null
				|| request.getParameter("champId").equals("All")) {
			listState = profileService.getStateList();
		} else {
			int champId = Integer.parseInt(request.getParameter("champId"));
			champ = profileService.getChampionshipById(champId);
			listState = profileService.getStateListByChamp(champ);
			session.setAttribute("champ", champ);
		}

		List<Item> listItem = new ArrayList<Item>();
		if (champ != null) {
			if (champ.getFormula().equals(AppConstant.CHAMP_FORM_LEAGUE)) {
				listItem = profileService.getItemByType("LEAGUE", "E");
			} else if (champ.getFormula().equals(
					AppConstant.CHAMP_FORM_PLAY_OFF)) {
				listItem = profileService.getItemByType("CUP", "E");
			} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
				listItem = profileService.getItemByType("TOUR", "E");
			}
		}
		List<Team> listTeam = profileService.getTeamList();

		model.addAttribute("listPtcp", listState);
		model.addAttribute("listItem", listItem);
		model.addAttribute("listTeam", listTeam);
		model.addAttribute("newState", new State());

		return "participant";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 15, 2016 10:57:22 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addParticipant")
	public String addParticipate(Model model, HttpServletRequest request) {
		State state = new State();
		String teamId = request.getParameter("partTeam");
		Integer champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		Team team = profileService.getTeamById(teamId);

		if (profileService.onlineInChamp(team, champ)) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError",
					"Existed participant!");
			return "redirect:participant?champId=" + champ.getChampId();
		}

		
		state.setTeam(team);
		state.setChampionship(champ);
		if (champ.getFormula().equals(AppConstant.CHAMP_FORM_LEAGUE)) {
			state.setStatuz(AppConstant.LEAGUE_NORMAL);
		} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_PLAY_OFF)) {
			state.setStatuz(AppConstant.CUP_ROUND_OF_64);
		} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
			state.setStatuz(AppConstant.TOUR_GROUP_STAGE);
		}

		if (profileService.existedInChamp(team, champ) > 0) {
			state.setStateId(profileService.existedInChamp(team, champ));
			if (profileService.updateState(state)) {
				String successMsg = "Modified participant successfully!";
				request.getSession().removeAttribute("txtError");
				request.getSession().setAttribute("success", successMsg);

				profileService.addWorkLog(
						AppConstant.WLOG_UPDATE,
						"Modify state/participant ["
								+ state.getTeam().getFullName() + ", "
								+ state.getStatuz() + ", "
								+ state.getChampionship().getFullName() + "]");
			} else {
				request.getSession().removeAttribute("success");
				request.getSession().setAttribute("txtError", "Error occurs!");
			}
		}
		else if (profileService.addState(state)) {
			List<StandingsData> listGr = 
					profileService.getGroupStanding(champ.getShortName(), "L");
			
			if (listGr.size() == champ.getParticipantNo()) {
				request.getSession().removeAttribute("success");
				request.getSession().setAttribute("txtError", "Enough participants!");
				return "redirect:participant?champId=" + champ.getChampId();
			} 
			
			String successMsg = "Added participant successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			if (request.getParameter("addStd") != null) {
				champ.getStadiums().add(state.getTeam().getStadium());
				if (profileService.updateChampionship(champ)) {
					profileService.addWorkLog(AppConstant.WLOG_ADD,
							"Added state/participant ["
									+ state.getTeam().getFullName() + ", "
									+ state.getStatuz() + ", "
									+ state.getChampionship().getFullName()
									+ "]");
					profileService
							.addWorkLog(AppConstant.WLOG_ADD, "Added stadium ["
									+ state.getTeam().getStadium().toString()
									+ "] for championship [" + champ.toString());
				}
				else {
					request.getSession().removeAttribute("success");
					request.getSession().setAttribute("txtError", "Error occurs!");
				}
			} else {
				profileService.addWorkLog(AppConstant.WLOG_ADD,
						"Added state/participant ["
								+ state.getTeam().getFullName() + ", "
								+ state.getStatuz() + ", "
								+ state.getChampionship().getFullName()
								+ "]");
			} 
			
			
			StandingsData data = new StandingsData();
			data.setTeam(team);
			data.setChampionship(champ);
			data.setRank(listGr.size() + 1);
			data.setGroup("L");
			
			if (profileService.addStandingsData(data)) {
				successMsg += " Added teams to standing successfully!";
				request.getSession().removeAttribute("txtError");
				request.getSession().setAttribute("success", successMsg);

				StringBuilder wlogDesc = new StringBuilder();
				wlogDesc.append("Updated standing for " + champ.getFullName() + ": [");
				for (StandingsData sdata : listGr) {
					if (sdata != listGr.get(listGr.size() - 1)) {
						wlogDesc.append(sdata.getTeam().getFullName() + ", ");
					} else {
						wlogDesc.append(sdata.getTeam().getFullName() + "]");
					}
				}

				profileService.addWorkLog(AppConstant.WLOG_SUBMIT_QUALIFIERS, wlogDesc.toString());
			} else {
				request.getSession().removeAttribute("success");
				request.getSession().setAttribute("txtError", "Error occurs!");
			}
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:participant?champId=" + champ.getChampId();
	}

	@RequestMapping(value = "/modifyState", method = RequestMethod.POST)
	public String updateState(Model model, HttpServletRequest request) {
		Integer stateId = Integer.parseInt(request.getParameter("stateId"));
		Integer champId = Integer.parseInt(request.getParameter("champId"));
		State state = profileService.getStateById(stateId);
		state.setStatuz(request.getParameter("statuz"));

		if (profileService.updateState(state)) {
			String successMsg = "Modified participant successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(
					AppConstant.WLOG_UPDATE,
					"Modify state/participant ["
							+ state.getTeam().getFullName() + ", "
							+ state.getStatuz() + ", "
							+ state.getChampionship().getFullName() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:participant?champId=" + champId;
	}
}
