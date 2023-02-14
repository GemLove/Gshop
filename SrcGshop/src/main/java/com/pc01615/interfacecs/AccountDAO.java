package com.pc01615.interfacecs;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pc01615.entity.Account;
import com.pc01615.entity.Adress;

public interface AccountDAO extends JpaRepository<Account, String> {
	@Query("SELECT o.email FROM Account o WHERE o.email = ?1")
	String findByEmailString(String keywords);

	@Query("SELECT o FROM Account o WHERE o.username = ?1")
	Account findByUser(String keywords);

	@Query("SELECT o FROM Account o WHERE o.username = ?1 AND o.active=true")
	Account getLogin(String keywords);

	@Query("SELECT o.numberphone FROM Account o WHERE o.numberphone = ?1")
	String findByNumberPhone(String keywords);

	Account findByEmail(String keywords);

	@Query("SELECT o.adr FROM Account o WHERE o.username = ?1")
	List<Adress> findAllAdress(String username);

}
