package nigel.footballprofile.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import nigel.footballprofile.entity.Championship;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Controller handles Championship's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:48:09 PM
 */
@Controller
public class ChampionshipController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 10, 2015 11:22:34 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toChampionship")
	public String redirectToChamp(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:championship";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 10, 2015 11:25:16 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/championship")
	public String toChamp(Model model, HttpServletRequest request) {
		List<Championship> listChamp = profileService.getChampionshipList();

		model.addAttribute("listChamp", listChamp);
		if (!model.containsAttribute("champ")) {
			model.addAttribute("champ", new Championship());
		}

		return "championship";
	}

	/**
	 * 
	 * @param champ
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 16, 2015 8:49:34 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addChamp", method = RequestMethod.POST)
	public String addStadium(
			@ModelAttribute("champ") @Valid Championship champ,
			BindingResult result, Model model, HttpServletRequest request) {
		champ.setFormula(request.getParameter("formula"));

		if (profileService.existedChamp(champ.getShortName(),
				champ.getFullName())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError",
					"Existed Championship!");
			return toChamp(model, request);
		}

		champ.setLogoUrl("/resources/images/champ/brazuca-ball.png");
		if (profileService.addChampionship(champ)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", "Added championship!");

			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added team ["
					+ champ.getChampId() + ", " + champ.getFullName() + ", "
					+ champ.getShortName() + ", " + champ.getSeason() + ", "
					+ champ.getFormula() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:championship";
	}

	/**
	 * 
	 * @param file
	 * @param request
	 * @return
	 *
	 *         Nov 16, 2015 8:49:38 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/uploadLogoChamp", method = RequestMethod.POST)
	public String changeImageChamp(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				File serverFile = new File(request.getSession()
						.getServletContext()
						.getRealPath("/resources/images/champ")
						+ File.separator + file.getOriginalFilename());

				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				Integer id = Integer.parseInt(request.getParameter("champId"));
				Championship champ = profileService.getChampionshipById(id);
				champ.setLogoUrl("/resources/images/champ" + File.separator
						+ file.getOriginalFilename());
				if (!profileService.updateChampionship(champ)) {
					request.getSession().setAttribute("txtError",
							"Error occurs!");
					request.getSession().removeAttribute("success");
				} else {
					request.getSession().setAttribute("success",
							"Logo/flag uploaded successfully!");
					request.getSession().removeAttribute("txtError");

					profileService.addWorkLog(
							AppConstant.WLOG_UPDATE,
							"Uploaded Logo for Championship ["
									+ champ.getChampId() + ", "
									+ champ.getFullName() + "]");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.getSession().setAttribute("txtError",
						"Failed to upload! ");
				request.getSession().removeAttribute("success");
			}
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "File was empty!");
		}
		return "redirect:championship";
	}

	/**
	 * 
	 * @param request
	 * @return
	 *
	 *         Nov 16, 2015 9:18:35 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyChamp", method = RequestMethod.POST)
	public String modifyStadium(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("champId"));

		String fullName = request.getParameter("champName");
		String shortName = request.getParameter("champShrtName");
		String season = request.getParameter("champSeason");
		String formula = request.getParameter("formula");

		Championship champ = profileService.getChampionshipById(id);
		champ.setFullName(fullName);
		champ.setShortName(shortName);
		champ.setFormula(formula);
		champ.setSeason(season);

		if (profileService.updateChampionship(champ)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success",
					"Championship was modified successfully!");

			profileService.addWorkLog(
					AppConstant.WLOG_UPDATE,
					"Modify championship => [" + champ.getChampId() + ", "
							+ champ.getFullName() + ", " + champ.getShortName()
							+ ", " + champ.getSeason() + ", "
							+ champ.getFormula() + "]");
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:championship";
	}

}
