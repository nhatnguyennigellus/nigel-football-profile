package nigel.footballprofile.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import nigel.footballprofile.entity.Item;
import nigel.footballprofile.entity.Stadium;
import nigel.footballprofile.service.AppConstant;
import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		if (request.getParameter("search") != null) {
			request.getSession().removeAttribute("txtError");
			request.getSession().removeAttribute("success");
		}
		List<Item> listItem = new ArrayList<Item>();
 		String[] listLang = {"E", "D"};
		String[] listType = {"LEAGUE", "TOUR", "CUP", "WLOG", "TEAM", "CHAMP", 
				"POS", "LEAGUE ROUND", "TOUR ROUND", "CUP ROUND", "LANGUAGE", 
				"ROUND FORMAT"};

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
		model.addAttribute("item", new Item());
		return "item";
	}
	
	/**
	 * 
	 * @param item
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 * Jan 24, 2016 3:05:36 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/addItem", method = RequestMethod.POST)
	public String addItem(@ModelAttribute("item") @Valid Item item,
			BindingResult result, Model model, HttpServletRequest request) {
		if (profileService.addItem(item)) {
			String successMsg = "Added item successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);
			
			profileService.addWorkLog(AppConstant.WLOG_ADD,
					"Added item " + item.toString());
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		
		return "redirect:item?lang=All&type=All";
	}
	
	/**
	 * 
	 * @param item
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 *
	 * Jan 25, 2016 11:24:15 PM
	 * @author Nigellus
	 */
	@RequestMapping(value = "/modifyItem", method = RequestMethod.POST)
	public String modifyItem(@ModelAttribute("item") @Valid Item item,
			BindingResult result, Model model, HttpServletRequest request) {
		if (profileService.updateItem(item)) {
			String successMsg = "Modified item successfully!";
			request.getSession().removeAttribute("txtError");
			request.getSession().setAttribute("success", successMsg);
			
			profileService.addWorkLog(AppConstant.WLOG_UPDATE,
					"Modified item " + item.toString());
		} else {
			request.getSession().removeAttribute("success");
			request.getSession().setAttribute("txtError", "Error occurs!");
		}
		
		
		return "redirect:item?lang=All&type=All";
	}
}
