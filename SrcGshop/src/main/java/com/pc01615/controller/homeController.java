package com.pc01615.controller;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pc01615.entity.Account;
import com.pc01615.entity.Adress;
import com.pc01615.entity.Category;
import com.pc01615.entity.Order;
import com.pc01615.entity.OrderDetail;
import com.pc01615.entity.Product;
import com.pc01615.interfacecs.AdressDAO;
import com.pc01615.interfacecs.CategoryDAO;
import com.pc01615.interfacecs.OrderDAO;
import com.pc01615.interfacecs.OrderDetailDAO;
import com.pc01615.interfacecs.ProductDAO;
import com.pc01615.model.Item;
import com.pc01615.service.SessionService;
import com.pc01615.service.ShoppingCartServiceImpl;

@Controller
public class homeController {
	@Autowired
	ProductDAO daoProduct;

	@Autowired
	CategoryDAO daoCategory;

	@Autowired
	AdressDAO daoAdress;

	@Autowired
	ShoppingCartServiceImpl cart;

	@Autowired
	SessionService session;

	@Autowired
	OrderDAO daoOrder;

	@Autowired
	OrderDetailDAO daoOrderDetail;

	@RequestMapping("/Gshop/trang-chu")
	public String getHome(Model model) {
		model.addAttribute("tt", "home");
		List<Product> list = daoProduct.findAllSale();
		Collections.shuffle(list);
		model.addAttribute("listSale", list);
		return "home/index";
	}

	@RequestMapping("/Gshop/san-pham")

	public String getSP(Model model, @RequestParam("filter") Optional<String> fil) {
		Pageable pageable = PageRequest.of(0, 100);
		Page<Product> page = daoProduct.findAll(pageable);
		if (fil.isPresent()) {
			try {

				int ma = Integer.parseInt(fil.get());
				page = daoCategory.findById1(ma, pageable);
			} catch (NumberFormatException e) {
				return "redirect:/Gshop/san-pham";
			}
		}
		if (page.getContent().size() == 0) {
			page = daoProduct.findAll(pageable);
			return "redirect:/Gshop/san-pham";
		}
		model.addAttribute("listProduct", page.getContent());
		model.addAttribute("tt", "product");
		return "home/product";
	}

	@RequestMapping("/Gshop/san-pham/{product}")
	public String getSPD(Model model, @PathVariable("product") String product) {
		try {
			int productId = Integer.parseInt(product);
			Optional<Product> pro = daoProduct.findById(productId);
			if (pro.isPresent()) {
				Product prod = pro.get();
				model.addAttribute("item", prod);
			} else {
				return "forward:/Gshop/error";
			}
		} catch (NumberFormatException e) {
			return "forward:/Gshop/error";
		}
		List<Product> list = daoProduct.findAll();
		Collections.shuffle(list);
		model.addAttribute("list", list);
		model.addAttribute("tt", "productDetail");
		return "home/details";
	}

	@RequestMapping("/Gshop/lien-he")
	public String getLH(Model model) {
		model.addAttribute("tt", "contact");
		return "home/contact";
	}

	@RequestMapping("/Gshop/add/{id}")
	public String add(@PathVariable("id") Integer id, @RequestParam("link") Optional<String> link,
			@RequestParam("quantitys") Optional<Integer> quantity) {
		int so = quantity.orElse(1);
		if (so <= 0) {
			so = 1;
		}
		cart.add(id, daoProduct.findById(id).get(), so);
		if (link.isPresent()) {
			if (link.get().equals("details")) {
				return "redirect:/Gshop/san-pham/" + id;
			} else if (link.get().equals("cart")) {
				return "redirect:/Gshop/gio-hang";
			} else if (link.get().equals("product")) {
				return "redirect:/Gshop/san-pham";
			}
		}
		return "redirect:/Gshop/trang-chu";
	}

	@RequestMapping("/Gshop/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("link") Optional<String> link,
			@RequestParam("quantitys") Optional<Integer> quantity) {
		int so = quantity.orElse(1);
		if (so <= 0) {
			so = 1;
		}
		cart.update(id, so);
		return "redirect:/Gshop/gio-hang";
	}

	@RequestMapping("/Gshop/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/Gshop/gio-hang";
	}

	@RequestMapping("/Gshop/gio-hang")
	public String getGH(Model model, @RequestParam("error") Optional<String> message) {
		model.addAttribute("listAdress", daoAdress.findByAccountLike(session.get("account")));
		if (message.isPresent() && message.get().equals("not-adress")) {
			model.addAttribute("errorAdress", "Vui lòng nhập địa chỉ");
		}
		model.addAttribute("count", cart.getCount());
		model.addAttribute("tt", "");
		return "home/cart";
	}

	@GetMapping("/Gshop/thanh-toan")
	public String getTT(Model model) {
		Account acc = session.get("account");
		if (acc == null) {
			session.set("security-uri", "/Gshop/gio-hang");
			return "redirect:/Gshop/dang-nhap";
		}
		return "redirect:/Gshop/trang-chu";
	};

	@PostMapping("/Gshop/thanh-toan")
	public String postTT(Model model, @RequestParam("adress") Optional<String> adress) {
		Adress adr = null;
		if (adress.isPresent() && !adress.get().isBlank()) {
			Account acc = session.get("account");
			List<Adress> listAdress = daoAdress.findByAccountLike(acc);
			Order order = new Order();
			order.setAccount(acc);
			if (listAdress.size() == 0) {
				order.setAdress(adress.get());
				adr = new Adress();
				adr.setAdress(adress.get());
				adr.setAccount(acc);
				daoAdress.save(adr);
			} else {
				int id = Integer.parseInt(adress.get());
				adr = daoAdress.findById(id).get();
				order.setAdress(adr.getAdress());
			}
			daoOrder.save(order);
			for (Item item : cart.getItems()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(daoOrder.findById(order.getId()).get());
				orderDetail.setPrice(item.getPrice());
				orderDetail.setProduct(daoProduct.findById(item.getId()).get());
				orderDetail.setQuantity(item.getQuantitys());
				daoOrderDetail.save(orderDetail);
			}
			cart.clear();
		} else {
			return "redirect:/Gshop/gio-hang?error=not-adress";
		}
		return "redirect:/Gshop/thong-tin";
	}

	@RequestMapping("/Gshop/error")
	public String getError(Model model) {
		model.addAttribute("tt", "");
		return "home/404";
	}

	@ModelAttribute("listProduct")
	public List<Product> getList() {
		List<Product> list = daoProduct.findAll();
		return list;
	}

	@ModelAttribute("listCategory")
	public List<Category> getListcat() {
		List<Category> list = daoCategory.findAll();
		return list;
	}

	@ModelAttribute("listCart")
	public ShoppingCartServiceImpl getListCart() {
		return cart;
	}

}
