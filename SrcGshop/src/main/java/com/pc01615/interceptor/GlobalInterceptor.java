package com.pc01615.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pc01615.entity.Account;
import com.pc01615.entity.Product;
import com.pc01615.interfacecs.AccountDAO;
import com.pc01615.interfacecs.ProductDAO;
import com.pc01615.model.Item;
import com.pc01615.service.CookieService;
import com.pc01615.service.SessionService;

@Service
public class GlobalInterceptor implements HandlerInterceptor {
	@Autowired
	CookieService cookie;
	@Autowired
	AccountDAO daoAccount;
	@Autowired
	SessionService session;

	@Autowired
	ProductDAO dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		if (cookie.get("userId") != null) {
			if (session.get("account") == null) {
				String user = cookie.getValue("userId");
				Account acc = daoAccount.findById(user).get();
				session.set("account", acc);
			}
		}
		int xoa = 0;
		if (uri.contains("otp")) {
			xoa++;
		}
		if (xoa == 0) {
			session.remove("otp");
			session.remove("userId");
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv)
			throws Exception {
	}
}