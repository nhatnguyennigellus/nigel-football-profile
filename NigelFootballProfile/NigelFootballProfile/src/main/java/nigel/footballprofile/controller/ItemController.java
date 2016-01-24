package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nigel.footballprofile.entity.Item;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Nigellus
 *
 *         Jan 23, 2016 11:10:35 PM
 */
@Controller
public class ItemController {
	@Autowired
	ProfileService profileService;

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 *         Jan 23, 2016 11:14:42 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/toItem")
	public String toItem(Model model, HttpServletRequest request) {
		request.getSession().removeAttribute("txtError");
		request.getSession().removeAttribute("success");

		return "redirect:item?lang=All&type=All";
	}

	/**
	 * 
	 * @param model
	 * @param request
	 * @return
	 *
	 * Jan 23, 2016 11:46:56 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/item")
	public String item(Model model, HttpServletRequest request) {
		List<Item> listItem = new ArrayList<Item>();
 		String[] listLang = {"E", "D"};
		String[] listType = {"LEAGUE", "TOUR", "CUP", "WLOG", "TEAM", "CHAMP", 
				"POS", "LEAGUE ROUND", "TOUR ROUND", "CUP ROUND"};

		if (!request.getParameter("type").equals("All")
				&& !request.getParameter("lang").equals("All")) {
			listItem = profileService.getItemByType(
					request.getParameter("type"), request.getParameter("lang"));
		} else if (request.getParameter("type").equals("All")
				&& !request.getParameter("lang").equals("All")) {
			listItem = profileService.getItemList(request.getParameter("lang"));
		} else if (!request.getParameter("type").equals("All")
				&& request.getParameter("lang").equals("All")) {
			listItem = profileService.getItemByType(
					request.getParameter("type"));
		} else {
			listItem = profileService.getItemList();
		} 
		
		model.addAttribute("listItem", listItem);
		model.addAttribute("listType", listType);
		model.addAttribute("listLang", listLang);
		return "item";
	}
}
