package com.pc01615.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.pc01615.entity.Product;
import com.pc01615.model.Item;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
	Map<Integer, Item> map = new HashMap<>();
	Item product = new Item();

	@Override
	public Item add(Integer id, Product pro, int qty) {
		if (map.containsKey(id)) {
			this.update(id, map.get(id).getQuantitys() + qty);
			return map.get(id);
		} else {
			product = new Item();
			product.setId(pro.getId());
			product.setImage(pro.getImage());
			product.setName(pro.getName());
			product.setPrice(pro.getPrice());
			product.setQuantitative(pro.getQuantitative());
			product.setQuantity(pro.getQuantity());
			product.setSale(pro.getSale());
			product.setQuantitys(qty);
		}
		return map.put(product.getId(), product);
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Item update(Integer id, int qty) {
		map.get(id).setQuantitys(qty);
		return map.get(id);
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<Item> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().size();
	}

	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getQuantitys() * (item.getPrice() - (item.getPrice() * item.getSale()) / 100))
				.sum();
	}

}
