package com.pc01615.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

@Configuration
public class ValidateConfig {
	@Bean("messageSource")
	public MessageSource getMessageSource() {
		ReloadableResourceBundleMessageSource ms = new ReloadableResourceBundleMessageSource();
		ms.setBasenames("classpath:messages/login", "classpath:messages/signUp", "classpath:messages/changePassword",
				"classpath:messages/profile", "classpath:messages/productModel");
		ms.setDefaultEncoding("utf-8");
		return ms;
	}

}
