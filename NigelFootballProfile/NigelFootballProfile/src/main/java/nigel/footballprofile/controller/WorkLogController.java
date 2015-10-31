package nigel.footballprofile.controller;

import javax.servlet.http.HttpServletRequest;

import nigel.footballprofile.service.ProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Nigellus
 *
 * Oct 31, 2015 1:34:09 PM
 */
@Controller
public class WorkLogController {
	@Autowired
	ProfileService profileService;
	
	@RequestMapping(value = "/worklog")
	public String redirectToLocation(Model model, HttpServletRequest request) {
		model.addAttribute("listWorklog", profileService.getWorkLogList());
		
		return "worklog";
	}
}
