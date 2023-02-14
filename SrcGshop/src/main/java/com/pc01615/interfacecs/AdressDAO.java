package com.pc01615.interfacecs;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pc01615.entity.Account;
import com.pc01615.entity.Adress;

public interface AdressDAO extends JpaRepository<Adress, Integer> {
	List<Adress> findByAccountLike(Account acc);
}
