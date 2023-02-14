package com.pc01615.model;

import javax.validation.constraints.*;

import com.pc01615.entity.Account;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUp {
	@NotBlank
	String username;
	@NotBlank
	String password;
	@NotBlank
	String rePassword;
	@NotBlank
	@Pattern(regexp = "({0}|^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$)")
	String numberphone;
	@NotBlank
	@Email
	String email;
	@NotBlank
//	@Pattern(regexp = "[^0-9]+")
	String fullname;
	Boolean active = true;
	Boolean admin = false;
}
