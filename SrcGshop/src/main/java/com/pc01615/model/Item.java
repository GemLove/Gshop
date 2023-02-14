package com.pc01615.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.pc01615.entity.Category;
import com.pc01615.entity.OrderDetail;
import com.pc01615.entity.Quantitative;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	Integer id;
	String name;
	String image;
	Double price;
	Double sale;
	Integer quantity;
	Quantitative quantitative;
	Integer quantitys = 0;
}
