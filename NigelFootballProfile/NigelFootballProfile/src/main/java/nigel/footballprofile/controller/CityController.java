package nigel.footballprofile.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import nigel.footballprofile.entity.City;
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
 * Controller handles
 * 
 * @author Nigellus
 *
 *         Oct 24, 2015 8:32:31 PM
 */
@Controller
public class CityController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param file
	 * @param request
	 * @param model
	 * @return
	 *
	 *         Oct 30, 2015 8:12:58 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/importCity", method = RequestMethod.POST)
	public String importCity(@RequestParam("fileCity") MultipartFile file,
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
					String[] cityData = line.split(",");
					if (cityData.length != 2) {
						continue;
					}

					if (profileService.getCountryByShortname(cityData[1]) == null) {
						isOK = false;
						errorMsg.append("Country does not exist! ");
						continue;
					}

					if (profileService.existedCity(cityData[0])) {
						isOK = false;
						errExist = true;
						continue;
					}
					
					City city = new City();
					city.setCityId(IDGenerator.genCityId(profileService
							.getCityList()));
					city.setName(cityData[0]);
					city.setCountry(profileService
							.getCountryByShortname(cityData[1]));

					if (!profileService.addCity(city)) {
						isOK = false;
					} else {
						count++;
					}
				}
			} catch (Exception e) {
				isOK = false;
				errorMsg.append("Error occurs! ");
			}
		} else {
			isOK = false;
			errorMsg.append(" File was empty! ");
		}
		String successMsg = "";
		if (count > 0) {
			String cityMsg = (count > 1) ? " cities" : " city";
			successMsg = "Imported " + count + cityMsg + " successfully!";
		}
		if (!isOK) {
			errorMsg.append(" Error occurs! ");
			if (errExist) {
				errorMsg.append("Some existed cities");
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
	 * Nov 3, 2015 7:49:06 AM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyCity", method = RequestMethod.POST)
	public String modifyCity(HttpServletRequest request) {
		boolean isOK = true;
		String cityId = request.getParameter("cityId");
		String cityName = request.getParameter("cityName");
		String ctryName = request.getParameter("cntryName");
		
		City city = profileService.getCityById(cityId);
		if(profileService.existedCity(cityName)
				&& !cityName.equals(city.getName())) {
			request.getSession().removeAttribute("importSuccess");
			request.getSession().setAttribute("txtError",
					"Existed city name!");
			return "redirect:location";
		}
		
		if(profileService.getCountryByName(ctryName) == null) {
			request.getSession().removeAttribute("importSuccess");
			request.getSession().setAttribute("txtError",
					"Country name doesn't exist!");
			return "redirect:location";
		}
		city.setName(cityName);
		city.setCountry(profileService.getCountryByName(ctryName));
		
		if (profileService.updateCity(city)) {
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("importSuccess",
					"City modified successfully!");
			
			WorkLog log = new WorkLog();
			log.setDatetime(new Date());
			log.setLogType(AppConstant.WLOG_UPDATE);
			log.setDescription("Modify city => [" + cityId + 
					", " + cityName + ", " + ctryName + "]");
			profileService.addWorkLog(log);
		} else {
			request.getSession().removeAttribute("importSuccess");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		
		return "redirect:location";
	}
}
