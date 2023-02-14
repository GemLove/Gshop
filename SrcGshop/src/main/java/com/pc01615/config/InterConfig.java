package com.pc01615.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.pc01615.interceptor.AuthInterceptor;
import com.pc01615.interceptor.GlobalInterceptor;
import com.pc01615.interceptor.LoginInterceptor;
import com.pc01615.interceptor.OtpInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	GlobalInterceptor global;
	@Autowired
	AuthInterceptor auth;

	@Autowired
	LoginInterceptor login;
	@Autowired
	OtpInterceptor otp;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/Gshop/**").excludePathPatterns("/assets/**");

		registry.addInterceptor(auth).addPathPatterns("/Gshop/gio-hang", "/Gshop/mua-ngay", "/Gshop/doi-mk",
				"/Gshop/thong-tin", "/Gshop/quan-li/*", "/Gshop/add/**").excludePathPatterns("/assets/**");

		registry.addInterceptor(login).addPathPatterns("/Gshop/dang-nhap", "/Gshop/dang-ky")
				.excludePathPatterns("/assets/**");

		registry.addInterceptor(otp).addPathPatterns("/Gshop/otp", "/Gshop/doi-mk-otp")
				.excludePathPatterns("/assets/**");
	}
}