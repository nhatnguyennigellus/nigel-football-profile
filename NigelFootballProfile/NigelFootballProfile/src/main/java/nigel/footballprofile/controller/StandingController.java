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
	public String redirectToStadium(Model model, HttpServletRequest request) {
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
	@RequestMapping(value = "/standing")
	public String toMatch(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("Items", profileService.getItemList());

		Championship champ = profileService.getChampionshipById
				(Integer.parseInt(request.getParameter("srcChamp")));
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
		// Add matches per round
		for (String round : rounds) {
			List<Match> listMatch = new ArrayList<Match>();
			listMatch = profileService.getMatchListByChamp(champ.getChampId());
			model.addAttribute("listMatch", listMatch);

			if (round.startsWith("TRGR")) {
				String groupName = round.substring(round.length() - 1);
				groups.add(groupName);
			}
		}
		// Add group standings
		List<StandingsData> listSD = new ArrayList<StandingsData>();
		for (String group : groups) {
			listSD = 
					profileService.getGroupStanding(champ.getShortName(), group);
			model.addAttribute(group, listSD);
		}
		return "standing";
	}
}
