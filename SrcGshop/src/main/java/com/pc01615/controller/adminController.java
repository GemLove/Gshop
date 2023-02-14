package com.pc01615.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pc01615.entity.Account;
import com.pc01615.entity.Adress;
import com.pc01615.entity.Category;
import com.pc01615.entity.Product;
import com.pc01615.entity.Quantitative;
import com.pc01615.interfacecs.AccountDAO;
import com.pc01615.interfacecs.AdressDAO;
import com.pc01615.interfacecs.CategoryDAO;
import com.pc01615.interfacecs.ProductDAO;
import com.pc01615.interfacecs.QuantitativeDAO;
import com.pc01615.model.Login;
import com.pc01615.model.ProductModel;
import com.pc01615.model.Profile;
import com.pc01615.model.SignUp;
import com.pc01615.model.changePassword;
import com.pc01615.service.CookieService;
import com.pc01615.service.MailerService;
import com.pc01615.service.SessionService;
import com.pc01615.service.ShoppingCartServiceImpl;

@Controller
public class adminController {
	@Autowired
	AccountDAO daoAccount;
	@Autowired
	ProductDAO daoProduct;
	@Autowired
	AdressDAO daoAdress;
	@Autowired
	QuantitativeDAO daoQuantitative;
	@Autowired
	CategoryDAO daoCategory;
	@Autowired
	SessionService session;
	@Autowired
	CookieService cookie;
	@Autowired
	ServletContext context;

	@RequestMapping("/Gshop/quan-li/nguoi-dung")
	public String getAdminUI(Model model, @ModelAttribute("signUp") SignUp user,
			@RequestParam("page") Optional<String> p, @RequestParam("mess") Optional<String> mess) {

		if (mess.isPresent()) {
			String tb = mess.get();
			model.addAttribute("mess", "active");
			model.addAttribute("color", "alert-success");
			if (tb.contains("update")) {
				model.addAttribute("message", "Sửa thành công tài khoản");
			} else if (tb.contains("create")) {
				model.addAttribute("message", "Thêm thành công tài khoản");
			} else if (tb.contains("removeSuccess")) {
				model.addAttribute("message", "Xóa thành công tài khoản");
			} else if (tb.contains("removeFail")) {
				model.addAttribute("color", "alert-danger");
				model.addAttribute("message", "Tài khoản này không xóa được");
			} else {
				model.addAttribute("mess", "un");
			}
		}
		session.remove("updateUser");
		return getPageUser(model, p, "/Gshop/quan-li/nguoi-dung");
	}

	@RequestMapping("/Gshop/quan-li/nguoi-dung/sua")
	public String toHome(Model model, @ModelAttribute("signUp") SignUp user, @RequestParam("page") Optional<String> p) {
		session.remove("updateUser");
		return "redirect:/Gshop/quan-li/nguoi-dung";
	}

	@GetMapping("/Gshop/quan-li/nguoi-dung/them")
	public String getAddUser(Model model, @ModelAttribute("signUp") SignUp user,
			@RequestParam("page") Optional<String> p) {
		return getPageUser(model, p, "/Gshop/quan-li/nguoi-dung/them");
	}

	@PostMapping("/Gshop/quan-li/nguoi-dung/them")
	public String postAddUser(Model model, @Validated @ModelAttribute("signUp") SignUp user, BindingResult Error,
			@Param("admin") Optional<Boolean> admin, @RequestParam("page") Optional<String> p) {
		int loi = 0;
		if (!Error.hasErrors()) {
			if (daoAccount.findByUser(user.getUsername()) != null) {
				model.addAttribute("errorUser", "Tên đăng nhập đã tồn tại");
				loi++;
			}
			if (daoAccount.findByEmailString(user.getEmail()) != null) {
				model.addAttribute("errorEmail", "Email đã tồn tại ");
				loi++;
			}
			if (daoAccount.findByNumberPhone(user.getNumberphone()) != null) {
				model.addAttribute("errorNumber", "Số điện thoại đã tồn tại ");
				loi++;
			}
			if (!user.getPassword().equals(user.getRePassword())) {
				model.addAttribute("errorRePassword", "Nhập lại mật khẩu không đúng ");
				loi++;
			}
			if (loi == 0) {
				Account acc = new Account();
				acc.setUsername(user.getUsername());
				acc.setFullname(user.getFullname());
				acc.setPassword(user.getPassword());
				acc.setNumberphone(user.getNumberphone());
				acc.setEmail(user.getEmail());
				acc.setAdmin(admin.get());
				daoAccount.save(acc);
				return "redirect:/Gshop/quan-li/nguoi-dung?page=" + p.get() + "&mess=createSuccess";
			}
		}
		return getPageUser(model, p, "/Gshop/quan-li/nguoi-dung/them");
	}

	@GetMapping("/Gshop/quan-li/nguoi-dung/sua/{id}")
	public String getUpdateUser(Model model, @PathVariable("id") Optional<String> userID,
			@ModelAttribute("signUp") SignUp user, @RequestParam("page") Optional<String> p) {
		try {
			Account acc = daoAccount.getById(userID.get());
			user.setEmail(acc.getEmail());
			user.setUsername(acc.getUsername());
			user.setNumberphone(acc.getNumberphone());
			user.setActive(acc.isActive());
			user.setAdmin(acc.isAdmin());
			user.setFullname(acc.getFullname());
			session.set("updateUser", acc);
		} catch (Exception e) {
			return "redirect:/Gshop/quan-li/nguoi-dung?page=0";
		}
		return getPageUser(model, p, "/Gshop/quan-li/nguoi-dung/" + userID.get());
	}

	@PostMapping("/Gshop/quan-li/nguoi-dung/sua/{id}")
	public String postUpdateUser(Model model, @PathVariable("id") Optional<String> userID,
			@Validated @ModelAttribute("signUp") Profile user, BindingResult Error,
			@RequestParam("page") Optional<String> p) {
		int loi = 0;
		List<Account> list = daoAccount.findAll();
		Account acc = session.get("updateUser");
		Account login = session.get("account");
		if (acc == null) {
			return "redirect:/Gshop/quan-li/nguoi-dung?page=0";
		}
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		if (!Error.hasErrors()) {
			user.setUsername(acc.getUsername());
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getEmail().equals(user.getEmail())
						&& !list.get(i).getUsername().equals(acc.getUsername())) {
					model.addAttribute("errorEmail", "Email đã tồn ");
					loi++;
				}
				if (list.get(i).getNumberphone().equals(user.getNumberphone())
						&& !list.get(i).getUsername().equals(acc.getUsername())) {
					model.addAttribute("errorNumber", "Số điện thoại đã tồn tại");
					loi++;
				}
			}
			if (!user.getPassword().equals(user.getRePassword())) {
				model.addAttribute("errorRePassword", "Nhập lại mật khẩu không đúng ");
				loi++;
			}
			if (loi == 0) {
				acc.setFullname(user.getFullname());
				acc.setNumberphone(user.getNumberphone());
				acc.setEmail(user.getEmail());
				if (!user.getPassword().isBlank() && !user.getRePassword().isBlank()) {
					acc.setPassword(user.getPassword());
				}
				if (!login.getUsername().equals(acc.getUsername())) {
					acc.setActive(user.isActive());
					acc.setAdmin(user.isAdmin());
				}
				daoAccount.save(acc);
				return "redirect:/Gshop/quan-li/nguoi-dung?page=" + p.get() + "&mess=updateSuccess";
			}
		}
		return getPageUser(model, p, "/Gshop/quan-li/nguoi-dung/" + userID.get());
	}

	@RequestMapping("/Gshop/quan-li/nguoi-dung/xoa/{id}")
	public String removeUser(Model model, @PathVariable("id") Optional<String> userID,
			@ModelAttribute("signUp") SignUp user, @RequestParam("page") Optional<String> p) {
		Account acc = daoAccount.findByUser(userID.get());
		if (acc != null) {
			if (acc.getOrders().isEmpty()) {
				daoAccount.delete(acc);
				return "redirect:/Gshop/quan-li/nguoi-dung?page=" + p.get() + "&mess=removeSuccess";
			} else {
				return "redirect:/Gshop/quan-li/nguoi-dung?page=" + p.get() + "&mess=removeFail";
			}
		}
		return "redirect:/Gshop/quan-li/nguoi-dung?page=" + p.get();
	}

	@RequestMapping("/Gshop/quan-li/san-pham")
	public String getPUI(Model model, @ModelAttribute("product") ProductModel product,
			@RequestParam("page") Optional<String> p, @RequestParam("mess") Optional<String> mess) {
		session.remove("loadImg");
		session.remove("updateProduct");
		if (mess.isPresent()) {
			String tb = mess.get();
			model.addAttribute("mess", "active");
			model.addAttribute("color", "alert-success");
			if (tb.contains("update")) {
				model.addAttribute("message", "Sửa sản phẩm thành công");
			} else if (tb.contains("create")) {
				model.addAttribute("message", "Thêm sản phẩm thành công");
			} else if (tb.contains("removeSuccess")) {
				model.addAttribute("message", "Xóa sản phẩm thành công");
			} else if (tb.contains("removeFail")) {
				model.addAttribute("color", "alert-danger");
				model.addAttribute("message", "Sản phẩm này không xóa được");
			} else {
				model.addAttribute("mess", "un");
			}
		}
		return getPageProduct(model, p, "/Gshop/quan-li/san-pham");
	}

	@GetMapping("/Gshop/quan-li/san-pham/them")
	public String getAddProduct(Model model, @ModelAttribute("product") ProductModel product,
			@RequestParam("page") Optional<String> p) {
		ProductModel pros = session.get("productCreate");
		if (pros != null) {
			product.setName(pros.getName());
			product.setCategory(pros.getCategory());
			product.setPrice(pros.getPrice());
			product.setSale(pros.getSale());
			product.setQuantity(pros.getQuantity());
			product.setQuantitative(pros.getQuantitative());
			product.setDescription(pros.getDescription());
			session.remove("productCreate");
		}
		return getPageProduct(model, p, "/Gshop/quan-li/san-pham");
	}

	@PostMapping("/Gshop/quan-li/san-pham/them")
	public String postAddProduct(Model model, @Validated @ModelAttribute("product") ProductModel product,
			BindingResult Error, @RequestParam("page") Optional<String> p) {
		if (!Error.hasErrors()) {
			Double giamGia = Double.parseDouble(product.getSale());
			giamGia = (double) Math.round(giamGia * 100) / 100;
			Optional<Category> cate = daoCategory.findById(product.getCategory());
			Optional<Quantitative> quan = daoQuantitative.findById(product.getQuantitative());
			Product addPro = new Product();
			addPro.setName(product.getName());
			if (session.get("loadImg") == null) {
				addPro.setImage("none-image.jpg");
			} else {
				addPro.setImage(session.get("loadImg"));
			}
			addPro.setPrice(Double.parseDouble(product.getPrice()));
			addPro.setDescription(product.getDescription());
			addPro.setSale(giamGia);
			addPro.setQuantity(Integer.parseInt(product.getQuantity()));
			addPro.setCategory(cate.get());
			addPro.setQuantitative(quan.get());
			daoProduct.save(addPro);
			return "redirect:/Gshop/quan-li/san-pham?page=" + p.get() + "&mess=create";
		}
		return getPageProduct(model, p, "/Gshop/quan-li/san-pham");
	}

	@GetMapping("/Gshop/quan-li/san-pham/sua/{id}")
	public String getUpdateProduct(Model model, @PathVariable("id") Optional<String> productID,
			@ModelAttribute("product") ProductModel product, @RequestParam("page") Optional<String> p) {
		if (productID.isPresent()) {
			try {
				Optional<Product> pro = daoProduct.findById(Integer.parseInt(productID.get()));
				ProductModel pros = session.get("productCreate");
				if (pros != null) {
					product.setName(pros.getName());
					product.setCategory(pros.getCategory());
					product.setPrice(pros.getPrice());
					product.setSale(pros.getSale());
					product.setQuantity(pros.getQuantity());
					product.setQuantitative(pros.getQuantitative());
					product.setDescription(pros.getDescription());
					product.setAvailable(pros.getAvailable());
					session.remove("productCreate");
				} else {
					if (pro.isPresent()) {
						product.setName(pro.get().getName());
						product.setCategory(pro.get().getCategory().getId());
						product.setPrice(pro.get().getPrice() + "");
						product.setSale(pro.get().getSale() + "");
						product.setQuantity(pro.get().getQuantity() + "");
						product.setQuantitative(pro.get().getQuantitative().getId());
						session.set("loadImg", pro.get().getImage());
						product.setAvailable(pro.get().getAvailable());
						product.setDescription(pro.get().getDescription());
						session.set("updateProduct", pro.get());
					}
				}
			} catch (Exception e) {
				return "redirect:/Gshop/quan-li/san-pham?page=0";
			}
		}
		return getPageProduct(model, p, "/Gshop/quan-li/san-pham/" + productID.get());
	}

	@PostMapping("/Gshop/quan-li/san-pham/sua/{id}")
	public String postUpdateProduct(Model model, @PathVariable("id") Optional<String> productID,
			@ModelAttribute("product") ProductModel product, BindingResult Error,
			@RequestParam("page") Optional<String> p) {
		if (!Error.hasErrors()) {
			Double giamGia = Double.parseDouble(product.getSale());
			giamGia = (double) Math.round(giamGia * 100) / 100;
			Optional<Category> cate = daoCategory.findById(product.getCategory());
			Optional<Quantitative> quan = daoQuantitative.findById(product.getQuantitative());
			Product addPro = session.get("updateProduct");
			addPro.setName(product.getName());
			if (session.get("loadImg") == null) {
				addPro.setImage("none-image.jpg");
			} else {
				addPro.setImage(session.get("loadImg"));
			}
			addPro.setPrice(Double.parseDouble(product.getPrice()));
			addPro.setDescription(product.getDescription());
			addPro.setSale(giamGia);
			addPro.setQuantity(Integer.parseInt(product.getQuantity()));
			addPro.setCategory(cate.get());
			addPro.setQuantitative(quan.get());
			addPro.setAvailable(product.getAvailable());
			daoProduct.save(addPro);
			return "redirect:/Gshop/quan-li/san-pham?page=" + p.get() + "&mess=update";
		}
		return getPageProduct(model, p, "/Gshop/quan-li/san-pham");
	}

	@RequestMapping("/Gshop/quan-li/san-pham/xoa/{id}")
	public String removeProduct(Model model, @PathVariable("id") Optional<String> productID,
			@RequestParam("page") Optional<String> p) {
		if (productID.isPresent()) {
			try {
				Optional<Product> pro = daoProduct.findById(Integer.parseInt(productID.get()));
				if (pro.isPresent()) {
					if (pro.get().getOrderDetails().isEmpty()) {
						daoProduct.delete(pro.get());
						return "redirect:/Gshop/quan-li/san-pham?page=" + p.get() + "&mess=removeSuccess";
					} else {
						return "redirect:/Gshop/quan-li/san-pham?page=" + p.get() + "&mess=removeFail";
					}
				}
			} catch (NumberFormatException e) {

			}
		}
		return "redirect:/Gshop/quan-li/san-pham?page=" + p.get() + "&mess=removeFail";
	}

	@RequestMapping("/Gshop/quan-li/san-pham/anh")
	public String addPicture(Model model, @ModelAttribute("product") ProductModel product, BindingResult Error,
			@RequestParam("page") Optional<String> p, @RequestParam("load") Optional<String> load,
			@RequestParam("product-img") Optional<MultipartFile> attach) throws IllegalStateException, IOException {
		if (attach.isPresent()) {
			MultipartFile upload = attach.get();
			File fileAttach = new File(context.getRealPath("/assets/img/product"));
			String namefileOrgin = upload.getOriginalFilename();
			int index = namefileOrgin.lastIndexOf(".");
			String rename = "product" + "-" + (new Date()).getTime() + "." + namefileOrgin.substring(index + 1);
			File newImg = new File(fileAttach + "/" + rename);
			upload.transferTo(newImg);
			session.set("loadImg", rename);
		}
		if (load.isPresent()) {
			if (load.get().equals("them")) {
				session.set("productCreate", product);
				return "redirect:/Gshop/quan-li/san-pham/them?page=" + p.get();
			} else if (load.get().contains("sua")) {
				session.set("productCreate", product);
				String koko = load.get();
				koko = koko.substring(koko.indexOf("sua"), koko.length());
				return "redirect:/Gshop/quan-li/san-pham/" + koko + "?page=" + p.get();
			}
		}
		return "redirect:/Gshop/quan-li/san-pham/them?page=" + p.get();
	}

	@ModelAttribute("link")
	public String getLink(HttpServletRequest req) {
		return req.getRequestURI();
	}

	@ModelAttribute("listQuantitative")
	public List<Quantitative> getListQuantitative() {
		List<Quantitative> list = daoQuantitative.findAll();
		return list;
	}

	@ModelAttribute("listCategory")
	public List<Category> getListCategory() {
		List<Category> list = daoCategory.findAll();
		return list;
	}

	public String getPageUser(Model model, @RequestParam("page") Optional<String> p, String link) {
		int pag = 0;
		Pageable pageable = PageRequest.of(0, 5);
		Page<Account> page = daoAccount.findAll(pageable);
		if (p.isPresent()) {
			try {
				pag = Integer.parseInt(p.orElse("0"));
				if (pag < 0) {
					return "redirect:" + link + "?page=0";
				} else if (pag >= page.getTotalPages()) {
					return "redirect:" + link + "?page=" + (page.getTotalPages() - 1);
				}
				pageable = PageRequest.of(pag, 5);
				page = daoAccount.findAll(pageable);
				model.addAttribute("listUser", page);
			} catch (NumberFormatException e) {
				return "redirect:" + link + "?page=0";
			}
		} else {
			return "redirect:" + link + "?page=0";
		}
		return "user";
	}

	public String getPageProduct(Model model, @RequestParam("page") Optional<String> p, String link) {
		int pag = 0;
		Pageable pageable = PageRequest.of(0, 5);
		Page<Product> page = daoProduct.findAll(pageable);
		if (p.isPresent()) {
			try {
				pag = Integer.parseInt(p.orElse("0"));
				if (pag < 0) {
					return "redirect:" + link + "?page=0";
				} else if (pag >= page.getTotalPages()) {
					return "redirect:" + link + "?page=0";
				}
				pageable = PageRequest.of(pag, 5);
				page = daoProduct.findAll(pageable);
				model.addAttribute("listProduct", page);
			} catch (NumberFormatException e) {
				return "redirect:" + link + "?page=0";
			}
		} else {
			return "redirect:" + link + "?page=0";
		}
		return "product";
	}
}
