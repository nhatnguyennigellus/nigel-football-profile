package nigel.footballprofile.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import nigel.footballprofile.entity.Championship;
import nigel.footballprofile.entity.Item;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.ProfileService;

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
	 * 		Nov 10, 2015 11:22:34 PM
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
	 * 		Nov 10, 2015 11:25:16 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/championship")
	public String toChamp(Model model, HttpServletRequest request) {
		List<Championship> listChamp = profileService.getChampionshipList();

		Item item = profileService.getItemByItem("LSTGN", "E");
		List<Integer> listGrpNoOpt = new ArrayList<Integer>();
		String desc = item.getDescription();
		for (int i = 0; i < desc.length(); i += 2) {
			listGrpNoOpt.add(Integer.parseInt(desc.substring(i, i + 2)));
		}

		List<Item> listLang = profileService.getItemByType("LANGUAGE");
		List<Item> listRndFmt = profileService.getItemByType("ROUND FORMAT");

		model.addAttribute("listChamp", listChamp);
		model.addAttribute("lstGrpNo", listGrpNoOpt);
		model.addAttribute("lstLang", listLang);
		model.addAttribute("lstRndFmt", listRndFmt);
		model.addAttribute("partiNoMin", profileService.getItemByItem("NPMIN", "E").getDescription());
		model.addAttribute("partiNoMax", profileService.getItemByItem("NPMAX", "E").getDescription());
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
	 * 		Nov 16, 2015 8:49:34 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addChamp", method = RequestMethod.POST)
	public String addStadium(@ModelAttribute("champ") @Valid Championship champ, BindingResult result, Model model,
			HttpServletRequest request) {
		champ.setFormula(request.getParameter("formula"));

		if (profileService.existedChamp(champ.getShortName(), champ.getFullName())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Existed Championship!");
			return toChamp(model, request);
		}
		champ.setGroupNo(Integer.parseInt(request.getParameter("champGrpNo")));
		champ.setParticipantNo(Integer.parseInt(request.getParameter("champPartiNo")));
		champ.setLogoUrl("/resources/images/champ/brazuca-ball.png");
		champ.setRounds(request.getParameter("champRndFmt"));
		champ.setLanguage(request.getParameter("champLanguage"));
		if (profileService.addChampionship(champ)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", "Added championship!");

			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added champion [" + champ.toString() + "]");
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
	 * 		Nov 16, 2015 8:49:38 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/uploadLogoChamp", method = RequestMethod.POST)
	public String changeImageChamp(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				File serverFile = new File(
						request.getSession().getServletContext().getRealPath("/resources/images/champ") + File.separator
								+ file.getOriginalFilename());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				Integer id = Integer.parseInt(request.getParameter("champId"));
				Championship champ = profileService.getChampionshipById(id);
				champ.setLogoUrl("/resources/images/champ" + File.separator + file.getOriginalFilename());
				if (!profileService.updateChampionship(champ)) {
					request.getSession().setAttribute("txtError", "Error occurs!");
					request.getSession().removeAttribute("success");
				} else {
					request.getSession().setAttribute("success", "Logo/flag uploaded successfully!");
					request.getSession().removeAttribute("txtError");

					profileService.addWorkLog(AppConstant.WLOG_UPDATE,
							"Uploaded Logo for Championship [" + champ.getChampId() + ", " + champ.getFullName() + "]");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.getSession().setAttribute("txtError", "Failed to upload! ");
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
	public String modifyChamp(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("champId"));

		String fullName = request.getParameter("champName");
		String shortName = request.getParameter("champShrtName");
		String season = request.getParameter("champSeason");
		String formula = request.getParameter("champFormula");
		Integer partiNo = Integer.parseInt(request.getParameter("champPartiNo"));
		Integer groupNo = Integer.parseInt(request.getParameter("champGrpNo"));
		Integer teamPerGrp = Integer.parseInt(request.getParameter("champTeamGrp"));

		Championship champ = profileService.getChampionshipById(id);
		champ.setFullName(fullName);
		champ.setShortName(shortName);
		champ.setFormula(formula);
		champ.setSeason(season);
		champ.setGroupNo(groupNo);
		champ.setParticipantNo(partiNo);
		champ.setTeamsPerGroup(teamPerGrp);
		champ.setRounds(request.getParameter("champUpdRndFmt"));
			
		champ.setLanguage(request.getParameter("champLanguage"));

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
