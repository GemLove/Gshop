package com.pc01615.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pc01615.entity.Account;
import com.pc01615.entity.Adress;
import com.pc01615.entity.Order;
import com.pc01615.interfacecs.AccountDAO;
import com.pc01615.interfacecs.AdressDAO;
import com.pc01615.interfacecs.OrderDAO;
import com.pc01615.model.Login;
import com.pc01615.model.Profile;
import com.pc01615.model.SignUp;
import com.pc01615.model.changePassword;
import com.pc01615.service.CookieService;
import com.pc01615.service.MailerService;
import com.pc01615.service.SessionService;
import com.pc01615.service.ShoppingCartServiceImpl;

@Controller
public class accountController {
	@Autowired
	AccountDAO daoAccount;
	@Autowired
	AdressDAO daoAdress;
	@Autowired
	OrderDAO daoOrder;
	@Autowired
	SessionService session;
	@Autowired
	CookieService cookie;
	@Autowired
	MailerService mailer;
	@Autowired
	ShoppingCartServiceImpl cart;

	@RequestMapping("/Gshop/dang-nhap")
	public String getDN(Model model, @ModelAttribute("user") Login user) {
		if (cookie.get("remember") != null) {
			model.addAttribute("remember", cookie.getValue("remember"));
		}
		return "/pages/account/login";
	}

	@PostMapping("/Gshop/dang-nhap")
	public String postDN(Model model, @Validated @ModelAttribute("user") Login user, BindingResult Errors) {
		if (cookie.get("remember") != null) {
			model.addAttribute("remember", cookie.getValue("remember"));
		}
		if (!Errors.hasErrors()) {
			try {
				Account acc = daoAccount.getLogin(user.getUsername());
				if (acc == null) {
					model.addAttribute("message", "Bạn đã nhập sai tài khoản hoặc mật khẩu rối đó <3 ");
				} else {
					if (!acc.getPassword().equals(user.getPassword())) {
						model.addAttribute("message", "Sai mật khẩu ");
					} else {
						if (user.isRemember()) {
							cookie.add("userId", acc.getUsername(), 24 * 15);
							cookie.add("remember", "on", 24 * 14);
						} else {
							cookie.remove("userId");
							cookie.add("remember", "caidau", 24 * 14);
						}
						String uri = session.get("security-uri");
						if (uri == null || uri.contains("doi-mk")) {
							uri = "/Gshop/trang-chu";
						}
						session.set("account", acc);
						return "redirect:" + uri;
					}
				}
			} catch (Exception e) {
				model.addAttribute("message", "Tên đăng nhập không tồn tại ");
			}
		}
		return "/pages/account/login";
	}

	@RequestMapping("/Gshop/dang-xuat")
	public String getDX(Model model) {
		session.remove("account");
		cookie.remove("userId");
		return "redirect:/Gshop/trang-chu";
	}

	@RequestMapping("/Gshop/dang-ky")
	public String getDK(Model model, @ModelAttribute("signUp") SignUp user) {
		return "/pages/account/signUp";
	}

	@PostMapping("/Gshop/dang-ky")
	public String postDK(Model model, @Validated @ModelAttribute("signUp") SignUp user, BindingResult Errors) {
		int loi = 0;
		if (!Errors.hasErrors()) {
			try {
				daoAccount.findById(user.getUsername()).get();
				model.addAttribute("errorUser", "Tên đăng nhập đã tồn tại ");
				loi++;
			} catch (Exception e) {
				// TODO: handle exception
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
				daoAccount.save(acc);
				return "redirect:/Gshop/dang-nhap?alert=signUpSuccess";
			}
		}
		return "/pages/account/signUp";
	}

	@RequestMapping("/Gshop/doi-mk")
	public String getDoiMK(Model model, @ModelAttribute("changePassword") changePassword user) {
		return "/pages/account/changePassword";
	}

	@PostMapping("/Gshop/doi-mk")
	public String postDoiMK(Model model, @Validated @ModelAttribute("changePassword") changePassword user,
			BindingResult Errors) {
		int loi = 0;
		Account acc = session.get("account");
		if (acc != null) {
			if (!acc.getPassword().equals(user.getPasswordSrc())) {
				model.addAttribute("errorPasswordSrc", "Mật khẩu không đúng ");
				loi++;
			}

			if (!Errors.hasErrors()) {
				if (!user.getPassword().equals(user.getRePassword())) {
					model.addAttribute("errorPassword", "Nhập lại mật khẩu không đúng ");
					loi++;
				}
				if (loi == 0) {
					if (acc != null) {
						acc.setPassword(user.getPassword());
						daoAccount.save(acc);
						return "redirect:/Gshop/thong-tin";
					}
				}
			}
		}
		return "/pages/account/changePassword";
	}

	@RequestMapping("/Gshop/quen-mk")
	public String getQuenMK(Model model) {
		return "/pages/account/remember";
	}

	@PostMapping("/Gshop/quen-mk")
	public String postQuenMK(Model model, @Param("email") String email) {
		int loi = 0;
		Account acc = session.get("account");
		if (acc == null) {
			acc = daoAccount.findByEmail(email);
			if (acc == null) {
				model.addAttribute("errorEmail", "Email không tồn tại");
				loi++;
			}
		} else {
			if (!acc.getEmail().equals(email)) {
				model.addAttribute("errorEmail", "Email không đúng");
				loi++;
			}
		}
		if (loi == 0) {
			Random rnd = new Random();
			int number = rnd.nextInt(999999);
			String maXN = String.format("%06d", number);
			session.set("otp", maXN);
			session.set("userId", acc.getUsername());
			try {
				mailer.send(email, "Mã khôi phục mật khẩu", "Đây là mã khôi phục mật khẩu của khách hàng : " + maXN);
				return "redirect:/Gshop/otp";
			} catch (MessagingException e) {
			}
		}
		return "/pages/account/remember";
	}

	@RequestMapping("/Gshop/otp")
	public String getOTP(Model model) {
		return "/pages/account/OTP";
	}

	@PostMapping("/Gshop/otp")
	public String post(Model model, @Param("otp") String otp) {
		String maXN = session.get("otp");
		if (maXN.equals(otp)) {
			session.remove("otp");
			return "redirect:/Gshop/doi-mk-otp";
		} else {
			model.addAttribute("message", "Mã OTP sai");
		}
		return "/pages/account/OTP";

	}

	@RequestMapping("/Gshop/doi-mk-otp")
	public String getDoiMKnot(Model model, @ModelAttribute("changePassword") changePassword user) {
		return "/pages/account/changePasswordOTP";
	}

	@PostMapping("/Gshop/doi-mk-otp")
	public String postDoiMKOTP(Model model, @Validated @ModelAttribute("changePassword") changePassword user,
			BindingResult Errors) {
		int loi = 0;
		Account acc = daoAccount.findById(session.get("userId")).get();
		if (!Errors.hasErrors()) {
			if (!user.getPassword().equals(user.getRePassword())) {
				model.addAttribute("errorPassword", "Nhập lại mật khẩu không đúng ");
				loi++;
			}
			if (loi == 0) {
				acc.setPassword(user.getPassword());
				daoAccount.save(acc);
				session.remove("userId");
				if (session.get("account") == null) {
					return "redirect:/Gshop/dang-nhap";
				} else {
					return "redirect:/Gshop/trang-chu";
				}
			}
		}

		return "/pages/account/changePasswordOTP";
	}

	@PostMapping("/Gshop/thong-tin")
	public String postProfile(Model model, @Validated @ModelAttribute("profile") Profile user, BindingResult Error) {
		int loi = 0;
		List<Account> list = daoAccount.findAll();
		Account acc = session.get("account");
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		if (!Error.hasErrors()) {
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
					break;
				}
			}
			if (loi == 0) {
				acc.setFullname(user.getFullname());
				acc.setNumberphone(user.getNumberphone());
				acc.setEmail(user.getEmail());
				daoAccount.save(acc);
			}

		}
		return "home/profile";
	}

	@RequestMapping("/Gshop/thong-tin")
	public String getProfile(Model model, @ModelAttribute("profile") Profile user) {
		Account acc = session.get("account");
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		return "home/profile";
	}

	@GetMapping("/Gshop/dia-chi")
	public String getDiaChi(Model model, @ModelAttribute("profile") Profile user,
			@RequestParam("set") Optional<String> adress, @RequestParam("id") Optional<String> id) {
		Account acc = session.get("account");
		List<Adress> list = daoAccount.findAllAdress(acc.getUsername());
		model.addAttribute("listAdress", list);
		String set = adress.get();
		if (set.equals("delete") && list.size() > 1) {
			String so = id.get();
			try {
				Optional<Adress> adr = daoAdress.findById(Integer.parseInt(so));
				if (adr.isPresent()) {
					daoAdress.delete(adr.get());
					return "redirect:/Gshop/thong-tin";
				} else {
					return "redirect:/Gshop/thong-tin?loi=ErrorId";
				}
			} catch (NumberFormatException e) {
				return "redirect:/Gshop/thong-tin?loi=deleteError";
			}
		}
		return "redirect:/Gshop/thong-tin";
	}

	@PostMapping("/Gshop/dia-chi")
	public String postDiaChi(Model model, @ModelAttribute("profile") Profile user, @Param("adress") String adress,
			@RequestParam("link") Optional<String> link) {
		Account acc = session.get("account");
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		if (adress.isEmpty()) {
			model.addAttribute("errorAdress", "Không bỏ trống địa chỉ");
			if (link.isPresent()) {
				return "redirect:/Gshop/gio-hang";
			}
		} else {
			Adress adr = new Adress();
			adr.setAdress(adress);
			adr.setAccount(session.get("account"));
			daoAdress.save(adr);
			if (link.isPresent()) {
				return "redirect:/Gshop/gio-hang";
			} else {
				return "redirect:/Gshop/thong-tin";
			}

		}
		return "home/profile";
	}

	@GetMapping("/Gshop/dia-chi/{ma}")
	public String getUpDiaChi(Model model, @ModelAttribute("profile") Profile user, @Param("adress") String adress,
			@PathVariable("ma") String id) {
		Account acc = session.get("account");
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		try {
			Optional<Adress> adr = daoAdress.findById(Integer.parseInt(id));
			if (adr.isPresent()) {
				model.addAttribute("diaChi", adr.get().getAdress());
			} else {
				return "redirect:/Gshop/thong-tin?loi=ErrorId";
			}
		} catch (NumberFormatException e) {
			return "redirect:/Gshop/thong-tin?loi=UpdateError";
		}
		model.addAttribute("set", "update");
		return "home/profile";
	}

	@PostMapping("/Gshop/dia-chi/{ma}")
	public String postUpDiaChi(Model model, @ModelAttribute("profile") Profile user, @Param("adress") String adress,
			@PathVariable("ma") String id) {
		Account acc = session.get("account");
		model.addAttribute("listAdress", daoAccount.findAllAdress(acc.getUsername()));
		try {
			Optional<Adress> adr = daoAdress.findById(Integer.parseInt(id));
			if (adr.isPresent()) {
				if (adress.isEmpty()) {
					model.addAttribute("errorAdress", "Không bỏ trống địa chỉ");
				} else {
					adr.get().setAdress(adress);
					daoAdress.save(adr.get());
					return "redirect:/Gshop/thong-tin";
				}
			} else {
				return "redirect:/Gshop/thong-tin?loi=ErrorId";
			}
		} catch (NumberFormatException e) {
			System.out.println(id);
			return "redirect:/Gshop/thong-tin?loi=UpdateError";
		}

		return "home/profile";
	}

	@ModelAttribute("profile")
	public void add(@ModelAttribute("profile") Profile user) {
		Account acc = session.get("account");
		if (acc != null) {
			user.setFullname(acc.getFullname());
			user.setEmail(acc.getEmail());
			user.setNumberphone(acc.getNumberphone());
		}

	}

	@ModelAttribute("listOrder")
	public List<Order> listOrder() {
		Account acc = session.get("account");
		List<Order> list = null;
		if (acc != null) {
			list = daoOrder.findAllByUsername(acc.getUsername());
		}
		return list;
	}
}
