package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Match;
import nigel.footballprofile.entity.StandingsData;
import nigel.footballprofile.entity.State;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.ProfileService;

/**
 * Controller handles Standing & Group's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:51:08 PM
 */
@Controller
public class StandingController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toStanding")
	public String redirectToStanding(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:standing";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toAddGroup")
	public String redirectToGroup(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:group?champId=" + request.getParameter("champId");
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * @author Nigellus
	 */
	@RequestMapping(value = "/standing")
	public String toStanding(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("Items", profileService.getItemList());

		Championship champ = profileService.getChampionshipById(Integer.parseInt(request.getParameter("srcChamp")));
		model.addAttribute("champ", champ);
		// Get list of rounds
		List<String> rounds = new ArrayList<String>();
		List<String> groups = new ArrayList<String>();
		Item item = profileService.getItemByItem(champ.getRounds(), champ.getLanguage());
		String desc = item.getDescription();
		for (int i = 0; i < desc.length(); i += 5) {
			rounds.add(desc.substring(i, i + 5));
		}
		model.addAttribute("rounds", rounds);
		// Add round for league
		List<Item> listRound = new ArrayList<Item>();
		
		// Add matches per round
		for (String round : rounds) {
			List<Match> listMatch = new ArrayList<Match>();
			listMatch = profileService.getMatchListByChamp(champ.getChampId());
			model.addAttribute("listMatch", listMatch);

			if (round.startsWith("TRGR")) {
				String groupName = round.substring(round.length() - 1);
				groups.add(groupName);
			}
			else if (round.startsWith("LRD")) {
				if (groups.size() == 0)
					groups.add("L");
				Item rnd = profileService.getItemByItem(round, champ.getLanguage());
				listRound.add(rnd);
			}
		}
		// Add group standings
		List<StandingsData> listSD = new ArrayList<StandingsData>();
		for (String group : groups) {
			listSD = profileService.getGroupStanding(champ.getShortName(), group);
			model.addAttribute(group, listSD);
		}
		
		String next = "";
		if (champ.getFormula().equals(AppConstant.CHAMP_FORM_TOUR)) {
			next = "standing";
		} else if (champ.getFormula().equals(AppConstant.CHAMP_FORM_LEAGUE)) {
			next = "league";
			model.addAttribute("listRound", listRound);
		}
		return next;
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Mar 19, 2016 11:58:33 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/group")
	public String toGroup(Model model, HttpServletRequest request) {
		Championship champ = profileService.getChampionshipById(Integer.parseInt(request.getParameter("champId")));
		model.addAttribute("champ", champ);
		List<State> listParticipant = profileService.getStateListByChamp(champ);
		model.addAttribute("parti", listParticipant);

		List<String> rounds = new ArrayList<String>();
		List<String> groups = new ArrayList<String>();
		Item item = profileService.getItemByItem(champ.getRounds(), champ.getLanguage());
		String desc = item.getDescription();
		for (int i = 0; i < desc.length(); i += 5) {
			rounds.add(desc.substring(i, i + 5));
		}
		// Add matches per round
		for (String round : rounds) {
			if (round.startsWith("TRGR")) {
				String groupName = round.substring(round.length() - 1);
				groups.add(groupName);
			}
		}
		// Add group standings
		List<StandingsData> listSD = new ArrayList<StandingsData>();
		for (String group : groups) {
			listSD = profileService.getGroupStanding(champ.getShortName(), group);
			model.addAttribute(group, listSD);
		}
		return "group";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * 		Mar 19, 2016 12:11:03 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/updateGroup")
	public String updateGroup(Model model, HttpServletRequest request) {
		int champId = Integer.parseInt(request.getParameter("champId"));
		Championship champ = profileService.getChampionshipById(champId);
		String group = request.getParameter("groupId");
		List<StandingsData> listGr = profileService.getGroupStanding(champ.getShortName(), group);

		boolean isOK = false;
		for (int i = 0; i < champ.getTeamsPerGroup(); i++) {
			Team team = profileService.getTeamById(request.getParameter("team" + (i + 1)));
			if (listGr.isEmpty()) {
				StandingsData data = new StandingsData();
				data.setTeam(team);
				data.setChampionship(champ);
				data.setRank(i + 1);
				data.setGroup(group);

				if (profileService.addStandingsData(data)) {
					isOK = true;
				} else {
					isOK = false;
				}
			} else {
				if (!team.getTeamId().equals(listGr.get(i))) {
					StandingsData data = listGr.get(i);
					data.setTeam(team);
					if (profileService.updateStandingsData(data)) {
						isOK = true;
					} else {
						isOK = false;
					}
				}
			}
		}

		if (isOK) {
			listGr = profileService.getGroupStanding(champ.getShortName(), group);
			String successMsg = "Added teams to group successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			StringBuilder wlogDesc = new StringBuilder();
			wlogDesc.append("Updated: Group " + group + ", " + champ.getFullName() + ": [");
			for (StandingsData data : listGr) {
				if (data != listGr.get(listGr.size() - 1)) {
					wlogDesc.append(data.getTeam().getFullName() + ", ");
				} else {
					wlogDesc.append(data.getTeam().getFullName() + "]");
				}
			}

			profileService.addWorkLog(AppConstant.WLOG_SUBMIT_QUALIFIERS, wlogDesc.toString());
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return toGroup(model, request);
	}
}
