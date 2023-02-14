package com.pc01615.model;

import java.io.File;
import java.util.Date;

import javax.validation.constraints.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel {
	@NotBlank
	String name;
	@Pattern(regexp = "[0-9]*")
	@Min(value = 500)
	String price;
	String description;
	Date createDate = new Date();
	Boolean available = true;
	Integer category;
	@Pattern(regexp = "([0-9]*)|[0-9]+(.){1}+[0-9]*")
	@Min(value = 0)
	@Max(value = 100)
	String sale = "0";
	@Pattern(regexp = "[0-9]*")
	@Min(value = 1)
	String quantity = "1";
	Integer quantitative;
}