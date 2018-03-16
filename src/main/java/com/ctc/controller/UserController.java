package com.ctc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ctc.model.Role;
import com.ctc.model.User;
import com.ctc.service.SecurityService;
import com.ctc.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private SecurityService securityService;

	@RequestMapping(value = { "/listUser", "/" }, method = RequestMethod.GET)
	public String listUser(Model model, HttpServletRequest request) {
		request.getSession().setMaxInactiveInterval(10 * 60);
		String username = securityService.findLoggedInUsername();
		if (username != null) {
			User u = userService.findByUsername(username);
			for (Role role : u.getRoles()) {
				if (role.getName().equals("ROLE_ADMIN")) {
					model.addAttribute("role", "ROLE_ADMIN");
					break;
				}
			}
		}
		return "listUser";
	}

	@RequestMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		return "registration";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User user) {
		try{
			userService.save(user);
			securityService.autoLogin(user.getUsername(), user.getPasswordConfirm());
			return "redirect:/listUser";		
		}catch(Exception e){
			System.out.println("abc");
		}return "registration";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout, String expired) {
		if (error != null) {
			model.addAttribute("msg", "Yourname or password is invalid");
		}
		if (logout != null) {
			model.addAttribute("msg", "You have been logged out successfully");
		}
		if (expired != null) {
			model.addAttribute("msg", "Session is expired");
		}
		return "login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}
}
