package nigel.footballprofile.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Stadium;
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
 * Controller handles Stadium's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:47:37 PM
 */
@Controller
public class StadiumController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 4, 2015 9:24:06 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toStadium")
	public String redirectToStadium(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:stadium";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 4, 2015 9:24:34 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/stadium")
	public String toStadium(Model model, HttpServletRequest request) {
		List<Stadium> listStadium = profileService.getStadiumList();
		List<City> listCity = profileService.getCityList();

		model.addAttribute("listStadium", listStadium);
		model.addAttribute("listCity", listCity);
		model.addAttribute("stadium", new Stadium());
		return "stadium";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 10, 2015 9:24:34 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/importStadium", method = RequestMethod.POST)
	public String importStadium(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

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

					if (!profileService.existedCity(stdData[3])) {
						isOK = false;
						errorMsg.append("City does not exist or mispell! ");
						continue;
					}

					if (profileService.existedStadium(stdData[0], stdData[1])) {
						isOK = false;
						errExist = true;
						continue;
					}

					Stadium stadium = new Stadium();
					stadium.setStadiumId(IDGenerator
							.genStadiumId(profileService.getStadiumList()));
					stadium.setName(stdData[0]);
					stadium.setUefaName(stdData[1]);
					stadium.setCapacity(Integer.parseInt(stdData[2]));
					stadium.setCity(profileService.getCityByName(stdData[3])
							.get(0));

					if (!profileService.addStadium(stadium)) {
						isOK = false;
					} else {
						count++;
					}
				}
			} catch (IOException e) {
				errorMsg.append(" File was empty! ");
				isOK = false;
			}
		} else {
			errorMsg.append(" File was empty! ");
			isOK = false;
		}

		String successMsg = "";
		if (count > 0) {
			String ctryMsg = (count > 1) ? " stadia" : " stadium";
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
		return "redirect:stadium";
	}

	/**
	 * 
	 * @param stadium
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Nov 6, 2015 11:54:46 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addStadium", method = RequestMethod.POST)
	public String addStadium(@ModelAttribute("stadium") @Valid Stadium stadium,
			BindingResult result, Model model, HttpServletRequest request) {
		stadium.setStadiumId(IDGenerator.genStadiumId(profileService
				.getStadiumList()));
		stadium.setCity(profileService.getCityById(request
				.getParameter("stdLocation")));

		if (profileService.existedStadium(stadium.getName(),
				stadium.getUefaName())) {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Existed stadium!");
			return "redirect:stadium";
		}

		if (profileService.addStadium(stadium)) {
			String successMsg = "Added stadium successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);

			profileService.addWorkLog(AppConstant.WLOG_ADD, "Added stadium ["
					+ stadium.toString());
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		return "redirect:stadium";
	}

	/**
	 * 
	 * @param request
	 * @return
	 *
	 *         Nov 8, 2015 10:49:50 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyStadium", method = RequestMethod.POST)
	public String modifyStadium(HttpServletRequest request) {
		String id = request.getParameter("stdId");
		String name = request.getParameter("stdName");
		String uefaName = request.getParameter("stdUefaName");
		Integer capacity = Integer
				.parseInt(request.getParameter("stdCapacity"));
		City city = profileService.getCityById(request
				.getParameter("stdLocation"));

		Stadium stadium = new Stadium();
		stadium.setStadiumId(id);
		stadium.setName(name);
		stadium.setUefaName(uefaName);
		stadium.setCapacity(capacity);
		stadium.setCity(city);

		if (profileService.updateStadium(stadium)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success",
					"Stadium was modified successfully!");

			profileService.addWorkLog(AppConstant.WLOG_UPDATE,
					"Modify stadium => " + stadium.toString());
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return "redirect:stadium";
	}
}
