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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookstore.dto.MyUser;
import com.bookstore.entity.ProductEntity;
import com.bookstore.service.CategoryService;
import com.bookstore.service.ProductService;

@Controller
public class Product {

	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/admin")
	public String adminlist(Model model,@AuthenticationPrincipal MyUser myUser)
	{
		model.addAttribute("products",productService.AllProduct());
		model.addAttribute("userDetails", myUser);
		return "admin/product_list";
	}
	
	@GetMapping("/admin/product/list")
	public String list(Model model,@AuthenticationPrincipal MyUser myUser)
	{
		model.addAttribute("products",productService.AllProduct());
		model.addAttribute("userDetails", myUser);
		return "admin/product_list";
	}
	
	@PostMapping("/admin/product/save")
	public String addProduct(@ModelAttribute("product") ProductEntity entity,@RequestParam("image") MultipartFile imageFile, BindingResult result, Model model, RedirectAttributes redirect,@AuthenticationPrincipal MyUser myUser)
	{
		if (result.hasErrors()||entity.getCategoryEntity()==null|| entity.getName().isEmpty()|| entity.getAuthor().isEmpty()) {
			redirect.addFlashAttribute("error", "Lưu sản phẩm thất bại!");
			model.addAttribute("userDetails", myUser);
			return "admin/product_upload";
		}
		productService.Upload(productService.uploadImg(entity, imageFile));
		redirect.addFlashAttribute("success", "Lưu sản phẩm thành công!");
		return "redirect:/admin/product/list";
	}
	
	@GetMapping("/admin/product/{id}/edit")
	public String getEditProduct(@PathVariable("id") Integer id, Model model,@AuthenticationPrincipal MyUser myUser) {
		model.addAttribute("product", productService.findOne(id));
		model.addAttribute("categories",categoryService.AllCategory());
		model.addAttribute("userDetails", myUser);
		return "admin/product_upload";
	}
	
	@PutMapping("/admin/product/{id}/edit")
	public String putEditProduct(@PathVariable("id") Long id, RedirectAttributes redirect,Model model,@AuthenticationPrincipal MyUser myUser)
	{
		model.addAttribute("product", new ProductEntity());
		model.addAttribute("category", categoryService.AllCategory());
		model.addAttribute("userDetails", myUser);
		return "admin/product_upload";
	}
	
	@GetMapping("/admin/product/add")
	public String addProduct(Model model,@AuthenticationPrincipal MyUser myUser) {
		model.addAttribute("product", new ProductEntity());
		model.addAttribute("categories",categoryService.AllCategory());
		model.addAttribute("userDetails", myUser);
		return "admin/product_upload";
	}
	
}
