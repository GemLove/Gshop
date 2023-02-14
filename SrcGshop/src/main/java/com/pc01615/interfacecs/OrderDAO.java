package com.pc01615.interfacecs;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pc01615.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long> {
	@Query("SELECT o FROM Order o WHERE o.account.username = ?1")
	List<Order> findAllByUsername(String keywords);
}
