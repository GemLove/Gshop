package com.pc01615.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pc01615.entity.Account;
import com.pc01615.service.SessionService;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		Account user = session.get("account");
		String error = "";
		if (user == null) {
			error = "Not logged in";
			session.set("security-uri", uri);
			response.sendRedirect("/Gshop/dang-nhap?loi=" + error);
			return false;
		} else if (!user.isAdmin() && uri.contains("quan-li")) {
			error = "Not admin";
			session.set("security-uri", uri);
			response.sendRedirect("/Gshop/trang-chu");
			return false;
		}
		return true;
	}
}
