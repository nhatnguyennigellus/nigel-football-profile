package nigel.footballprofile.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import nigel.footballprofile.entity.City;
import nigel.footballprofile.entity.Country;
import nigel.footballprofile.entity.SpecialEntity;
import nigel.footballprofile.entity.WorkLog;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.IDGenerator;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Controller handles Country's actions
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:30:23 PM
 */
@Controller
public class CountryController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Oct 30, 2015 9:07:52 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toLocation")
	public String redirectToLocation(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("importSuccess");
		return "redirect:location";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Oct 26, 2015 10:51:48 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/location")
	public String redirectLocation(Model model, HttpServletRequest request) {
		List<Country> listCountry = profileService.getCountryList();
		List<City> listCity = profileService.getCityList();

		model.addAttribute("listCountry", listCountry);
		model.addAttribute("listCity", listCity);
		return "location";
	}

	/**
	 * 
	 * @param file
	 * @param request
	 * @return
	 *
	 *         Oct 27, 2015 12:24:48 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/importCountry", method = RequestMethod.POST)
	public String importCountry(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, Model model) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("importSuccess");

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
					String[] ctryData = line.split(",");
					if (ctryData.length != 2) {
						continue;
					}
					Country country = new Country();
					country.setCountryId(IDGenerator
							.genCountryId(profileService.getCountryList()));
					country.setName(ctryData[0]);
					country.setShortName(ctryData[1]);

					if (profileService
							.existedCountry(ctryData[1], ctryData[0])) {
						isOK = false;
						errExist = true;
						continue;
					}

					if (!profileService.addCountry(country)) {
						isOK = false;
					} else {
						count++;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.append("Error occurs! ");
			}
		} else {
			errorMsg.append(" File was empty! ");
		}
		String successMsg = "";
		if (count > 0) {
			String ctryMsg = (count > 1) ? " countries" : " country";
			successMsg = "Imported " + count + ctryMsg + " successfully!";
		}
		if (!isOK) {
			errorMsg.append(" Error occurs! ");
			if (errExist) {
				errorMsg.append("Some existed countries");
			}
			request.getSession().setAttribute("txtError", errorMsg.toString());
		}
		// Add Work Log
		if (!successMsg.equals("")) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("importSuccess", successMsg);
			WorkLog log = new WorkLog();
			log.setDatetime(new Date());
			log.setLogType(AppConstant.WLOG_IMPORT);
			log.setDescription(successMsg);
			profileService.addWorkLog(log);
		}
		return "redirect:location";
	}

	/**
	 * 
	 * @param request
	 * @return
	 *
	 * Nov 1, 2015 11:45:25 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyCountry", method = RequestMethod.POST)
	public String modifyCountry(HttpServletRequest request) {
		boolean isOK = true;
		String ctryId = request.getParameter("ctryId");
		String ctryName = request.getParameter("ctryName");
		String shrtName = request.getParameter("shrtName");

		if (profileService.existedCountry(shrtName, ctryName)) {
			request.getSession().removeAttribute("importSuccess");
			request.getSession().setAttribute("txtError",
					"Existed country name or short name!");
			return "redirect:location";
		}

		Country country = profileService.getCountryById(ctryId);
		country.setName(ctryName);
		country.setShortName(shrtName);
		if (profileService.updateCountry(country)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("importSuccess",
					"Country modified successfully!");
			
			WorkLog log = new WorkLog();
			log.setDatetime(new Date());
			log.setLogType(AppConstant.WLOG_UPDATE);
			log.setDescription("Modify country => [" + ctryId + 
					", " + ctryName + ", " + shrtName + "]");
			profileService.addWorkLog(log);
		} else {
			request.getSession().removeAttribute("importSuccess");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}

		return "redirect:location";
	}
}
