package nigel.footballprofile.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.entity.Team;
import nigel.footballprofile.entity.WorkLog;
import nigel.footballprofile.service.AppConstant;
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
 * Controller handles Team's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:34:31 PM
 */
@Controller
public class TeamController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 8, 2015 2:34:43 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toTeam")
	public String redirectToStadium(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:team";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 8, 2015 2:34:39 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/team")
	public String toStadium(Model model, HttpServletRequest request) {
		List<Stadium> listStadium = profileService.getStadiumList();
		List<Team> listTeam = profileService.getTeamList();

		model.addAttribute("listStadium", listStadium);
		model.addAttribute("listTeam", listTeam);
		if (!model.containsAttribute("team")) {
			model.addAttribute("team", new Team());
		}

		return "team";
	}

	/**
	 * 
	 * @param stadium
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 8, 2015 4:04:58 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addTeam", method = RequestMethod.POST)
	public String addStadium(@ModelAttribute("team") @Valid Team team,
			BindingResult result, Model model, HttpServletRequest request) {
		team.setTeamId(IDGenerator.genTeamId(profileService.getTeamList()));
		team.setStadium(profileService.getStadiumById(request
				.getParameter("tmStadium")));

		if (profileService.existedTeam(team.getFullName(), team.getShortName())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Existed team!");
			return toStadium(model, request);
		}

		if (profileService.existedCoach(team.getCoach())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Existed coach!");
			return toStadium(model, request);
		}


		team.setLogoUrl("/resources/images/logoteam/nologo.png");
		team.setTeamType(request.getParameter("repeatable") != null ? AppConstant.TEAM_CLUB
				: AppConstant.TEAM_NATIONAL);
		
		if (profileService.addTeam(team)) {
			String successMsg = "Added team successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			WorkLog log = new WorkLog();
			log.setDatetime(new Date());
			log.setLogType(AppConstant.WLOG_ADD);
			log.setDescription("Added team [" + team.getId() + ", "
					+ team.getFullName() + ", " + team.getShortName() + ", "
					+ team.getCoach() + ", " + team.getTeamType() + ","
					+ team.getStadium().getName() + "]");
			profileService.addWorkLog(log);
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return "redirect:team";
	}
}
