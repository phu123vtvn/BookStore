package com.bookstore.controller.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bookstore.dto.MyUser;
import com.bookstore.entity.OrderDetailEntity;
import com.bookstore.entity.OrderEntity;
import com.bookstore.entity.ProductEntity;
import com.bookstore.repository.OrderDetailsRepository;
import com.bookstore.service.CategoryService;
import com.bookstore.service.OrderService;
import com.bookstore.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailsRepository orderDetailsRepository;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/home")
	public String HomePage(Model model) {

		model.addAttribute("twlveproducts",productService.TwelveProduct());
		model.addAttribute("categories", categoryService.AllCategory());
		return "web/home";
	}
	@GetMapping("/all-product/{id}")
	public String AllProductPage(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("products", productService.AllProductByCategoryId(id));
		return "web/all-product";
	}
	@GetMapping("/checkout")
	public ModelAndView CheckoutPage() {
		ModelAndView mav = new ModelAndView("web/checkout");
		mav.addObject("checkout", new OrderEntity());
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart")
	public String viewCart(ModelMap mm, HttpSession session) {
        HashMap<Long, OrderDetailEntity> cartItems = (HashMap<Long, OrderDetailEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if(session.getAttribute("myCartTotal")==null)
        {
        	 session.setAttribute("myCartTotal", 0);
        }
        session.setAttribute("myCartItems", cartItems);
        return "web/shoping-cart";
    }
	
	@SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart/add/{productId}")
	public String CartAdd(ModelMap mm, HttpSession session,@PathVariable("productId") long productId) {
		HashMap<Long, OrderDetailEntity> cartItems = (HashMap<Long, OrderDetailEntity>) session.getAttribute("myCartItems");
		if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        ProductEntity product = productService.findOne(productId);
        if (product != null) {
            if (cartItems.containsKey(productId)) {
            	OrderDetailEntity item = cartItems.get(productId);
                item.setProductEntity(product);
                item.setQuantity(item.getQuantity() + 1);
                item.setAmount(item.getProductEntity().getPrice()*item.getQuantity());
                cartItems.put(productId, item);
            } else {
            	OrderDetailEntity item = new OrderDetailEntity();
            	item.setProductEntity(product);
                item.setQuantity(1);
                item.setAmount(item.getProductEntity().getPrice()*item.getQuantity());
                cartItems.put(productId, item);
            }
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/home";
    }
	

    @SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart/sub/{productId}")
    public String viewUpdate(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
		HashMap<Long, OrderDetailEntity> cartItems = (HashMap<Long, OrderDetailEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        session.setAttribute("myCartItems", cartItems);
        return "web/shoping-cart";
    }

	@SuppressWarnings("unchecked")
	@GetMapping("/shoping-cart/remove/{productId}")
    public String viewRemove(ModelMap mm, HttpSession session, @PathVariable("productId") long productId) {
        HashMap<Long, OrderDetailEntity> cartItems = (HashMap<Long, OrderDetailEntity>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/shoping-cart";
    }
	
	@SuppressWarnings("unchecked")
	@PostMapping("/order")
	public String ordert(@ModelAttribute("checkout") OrderEntity entity, HttpSession session, Model model, @AuthenticationPrincipal MyUser myUser) {
		HashMap<Long, OrderDetailEntity> cartItems = (HashMap<Long, OrderDetailEntity>) session.getAttribute("myCartItems");
		UUID uuid = UUID.randomUUID();
		entity.setCode(uuid.toString());
		entity.setTotal(Float.parseFloat(session.getAttribute("myCartTotal").toString()));
		orderService.save(entity);
		OrderEntity order=orderService.findOneByCode(uuid.toString());
		OrderDetailEntity detailentity = null;
		for (Long key : cartItems.keySet()) {
			//ProductEntity product = productService.findOne(key);
			detailentity = new OrderDetailEntity();
			detailentity.setPrice(cartItems.get(key).getProductEntity().getPrice());
			detailentity.setQuantity(cartItems.get(key).getQuantity());
			detailentity.setAmount(cartItems.get(key).getAmount());
			detailentity.setProductEntity(cartItems.get(key).getProductEntity());
			detailentity.setOrderEntity(order);
			orderDetailsRepository.save(detailentity);
		}
		session.removeAttribute("myCartItems");
		session.removeAttribute("myCartTotal");
		session.removeAttribute("myCartNum");
		return "redirect:/shoping-cart";
	}
	
	public double totalPrice(HashMap<Long, OrderDetailEntity> cartItems) {
        int count = 0;
        for (Map.Entry<Long, OrderDetailEntity> list : cartItems.entrySet()) {
            count += list.getValue().getProductEntity().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }
}
