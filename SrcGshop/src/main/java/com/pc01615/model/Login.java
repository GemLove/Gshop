package com.pc01615.model;

import javax.validation.constraints.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Login {
	@NotBlank
	String username;
	@NotBlank
	String password;
	boolean remember;
}
