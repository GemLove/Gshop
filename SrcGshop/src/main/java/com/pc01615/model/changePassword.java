package com.pc01615.model;

import javax.validation.constraints.*;

import com.pc01615.entity.Account;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class changePassword {
	String passwordSrc;
	@NotBlank
	String password;
	@NotBlank
	String rePassword;

}
