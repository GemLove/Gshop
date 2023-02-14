package com.pc01615.service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;

	public Cookie get(String name) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie;
				}
			}
		}return null;
	}

	public String getValue(String name) {
		Cookie cookie = this.get(name);
		if (cookie.getName().equalsIgnoreCase(name)) {
			String values;
			byte[] decodedBytes = Base64.getDecoder().decode(cookie.getValue());
			values = new String(decodedBytes);
			return values;
		} else {
			return "";
		}

	}

	public Cookie add(String name, String value, int hours) {
		value = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours * 60 * 60);
		cookie.setPath("/");
		response.addCookie(cookie);
		return cookie;
	}

	public void remove(String name) {
		Cookie cookie = add(name, "ok", 0);
	}

}
