package com.pc01615.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Accounts", uniqueConstraints = { @UniqueConstraint(columnNames = { "email", "numberphone" }) })
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account {
	@Id
	String username;
	String password;
	String numberphone;
	String email;
	String fullname;
	String photo = "none-photo.jpg";
	boolean active = true;
	boolean admin = false;

	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;

	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Adress> adr;
}
