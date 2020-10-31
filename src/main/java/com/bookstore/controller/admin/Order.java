package com.bookstore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.dto.MyUser;
import com.bookstore.service.OrderService;

@Controller
public class Order {

	@Autowired
	private OrderService orderService;
	
	@GetMapping("/admin/order/list")
	public ModelAndView adminOrderList(@AuthenticationPrincipal MyUser myUser)
	{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/order_list");
		mav.addObject("orderList", orderService.AllOrder());
		mav.addObject("userDetails", myUser);
		return mav;
	}
}
