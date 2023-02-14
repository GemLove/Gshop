package com.pc01615.interfacecs;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pc01615.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {


}
