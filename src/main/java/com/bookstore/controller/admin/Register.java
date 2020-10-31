package com.bookstore.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.entity.UserEntity;
import com.bookstore.service.UserService;

@Controller
public class Register {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new UserEntity());
		return "/register";
	}
	
	@GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login?logout";
    }

	@PostMapping("/register")
	public String registerMember(@ModelAttribute("user") UserEntity entity,RedirectAttributes redirect)
	{
		if(userService.findOneByEmail(entity.getEmail()))
		{
			userService.register(entity);
			redirect.addFlashAttribute("success", "Register Success");
			return "redirect:/register";
		}
		else
		{
			redirect.addFlashAttribute("error", "Email already exists!");
			return "redirect:/register";
		}
	}
}
