package com.bookstore.controller.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.dto.MyUser;
import com.bookstore.entity.CategoryEntity;
import com.bookstore.service.CategoryService;

@Controller
public class Category {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/admin/category/list")
	public ModelAndView adminListCategory(@AuthenticationPrincipal MyUser myUser) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/category_list");
		mav.addObject("category",categoryService.AllCategory());
		mav.addObject("userDetails", myUser);
		return mav;
	}
	
	@GetMapping("/admin/category/add")
	public ModelAndView adminUploadCategory(@AuthenticationPrincipal MyUser myUser) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/category_add");
		mav.addObject("category", new CategoryEntity());
		mav.addObject("userDetails", myUser);
		return mav;
	}
	
	@GetMapping("/admin/category/{id}/edit")
	public String getEditCategory(@PathVariable("id") long id, Model model,@AuthenticationPrincipal MyUser myUser) {
		model.addAttribute("category", categoryService.findOne(id));
		model.addAttribute("userDetails", myUser);
		return "admin/category_add";
	}
	
	@PostMapping("/admin/category/save")
	public String addCategory(@Valid CategoryEntity entity, BindingResult result, Model model, RedirectAttributes redirect)
	{
		if (result.hasErrors()) {

			redirect.addFlashAttribute("error", "Register Success");
			return "admin/category_add";
		}
		categoryService.save(entity);
		redirect.addFlashAttribute("success", "Lưu user thành công!");
		return "redirect:/admin/category/list";
	}
	
}
