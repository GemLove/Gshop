package com.pc01615.service;

import java.util.Collection;

import com.pc01615.entity.Product;
import com.pc01615.model.Item;

public interface ShoppingCartService {
	Item add(Integer id, Product pro, int qty);

	void remove(Integer id);

	Item update(Integer id, int qty);

	void clear();

	Collection<Item> getItems();

	int getCount();

	double getAmount();

}
