package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Player;
import nigel.footballprofile.entity.State;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * Jan 13, 2016 11:12:22 PM
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
	 * Jan 13, 2016 11:11:56 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/participant")
	public String toState(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<State> listState = new ArrayList<State>();
		if (request.getParameter("champId") == null
				||request.getParameter("champId").equals("All")) {
			listState = profileService.getStateList();
		} else {
			int champId = Integer.parseInt(request.getParameter("champId"));
			Championship champ = profileService.getChampionshipById(champId);
			listState = profileService.getStateListByChamp(champ);
			//model.addAttribute("champName", champ.getFullName()); 
			//model.addAttribute("logoUrl", champ.getLogoUrl()); 
			session.setAttribute("champ", champ); 
		}
		
		List<Item> listItem = profileService.getItemList();
		List<Team> listTeam = profileService.getTeamList();
		
		
		model.addAttribute("listPtcp", listState); 
		model.addAttribute("listItem", listItem); 
		model.addAttribute("listTeam", listTeam); 
		model.addAttribute("newState", new State()); 
		
		return "participant";
	}
	
	@RequestMapping(value = "/addParticipant")
	public String addParticipate(Model model, HttpServletRequest request) {
		State state = new State();
		String teamId = request.getParameter("partTeam");
		Integer champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		Team team = profileService.getTeamById(teamId);
		
		if (profileService.existedTeamInChamp(team, champ)) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Existed participant!");
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
		
		if (profileService.addState(state)) {
			String successMsg = "Added stadium successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added state/participant ["
					+ state.getTeam().getFullName() + ", " 
					+ state.getStatuz() + ", " + state.getChampionship().getFullName() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:participant?champId=" + champ.getChampId();
	}
}
