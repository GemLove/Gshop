package com.pc01615.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.pc01615.entity.Account;
import com.pc01615.service.SessionService;

@Service
public class OtpInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String otp = session.get("otp");
		String uri = request.getRequestURI();
		String userId = session.get("userId");
		if (otp == null && userId == null) {
			response.sendRedirect("/Gshop/dang-nhap");
		} else if (uri.contains("-otp") && otp != null) {
			response.sendRedirect("/Gshop/otp");
		} else if (uri.contains("/otp") && otp == null && userId != null) {
			response.sendRedirect("/Gshop/doi-mk-otp");
		}
		return true;
	}
}
