package com.bookstore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.dto.MyUser;
import com.bookstore.entity.UserEntity;
import com.bookstore.service.UserService;

@Controller
public class User {

	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String login(Model model)
	{
		return "login";
	}
	@GetMapping("/403")
    public String accessDenied() {
        return "403";
    }
	@GetMapping("/admin/user/list")
	public ModelAndView adminListUser(@AuthenticationPrincipal MyUser myUser) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/user_list");
		mav.addObject("users",userService.AllUser());
		mav.addObject("userDetails", myUser);
		return mav;
	}
	
	@GetMapping("/admin/user/add")
	public ModelAndView adminUploadUser(@AuthenticationPrincipal MyUser myUser) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/user_upload");
		mav.addObject("user", new UserEntity());
		mav.addObject("userDetails", myUser);
		return mav;
	}
	
	@GetMapping("/admin/user/{id}/edit")
	public String getEditUser(@PathVariable("id") long id, Model model,@AuthenticationPrincipal MyUser myUser) {
		model.addAttribute("user", userService.findOne(id));
		model.addAttribute("userDetails", myUser);
		return "admin/user_upload";
	}
	
	@PostMapping("/admin/user/save")
	public String addUser(@ModelAttribute("user") UserEntity user,@RequestParam("image") MultipartFile imageFile, BindingResult result, Model model, RedirectAttributes redirect)
	{
		if (result.hasErrors()) {
			redirect.addFlashAttribute("error", "Lưu user thất bại!");
			return "admin/user_upload";
		}
		user.setRole(userService.findOne(user.getId()).getRole());
		user.setStatus(1);
		user.setPassword(userService.findOne(user.getId()).getPassword());
		userService.update(userService.uploadImg(user, imageFile));

		redirect.addFlashAttribute("success", "Lưu user thành công!");
		return "redirect:/admin/user/list";
	}
}
