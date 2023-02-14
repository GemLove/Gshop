package com.pc01615.interfacecs;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pc01615.entity.Category;
import com.pc01615.entity.Product;

public interface CategoryDAO extends JpaRepository<Category, Integer> {
	@Query("SELECT o.products FROM Category o WHERE o.name LIKE ?1")
	Page<Product> findById(String keywords, Pageable pageable);

	@Query("SELECT o.products FROM Category o WHERE o.id like ?1")
	Page<Product> findById1(Integer keywords, Pageable pageable);
}
