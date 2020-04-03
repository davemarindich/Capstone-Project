package com.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.model.ShppingCart;

public interface ShppingCartRepository extends JpaRepository<ShppingCart, Long> {

	@Query("from ShppingCart where sid = ?1")
	List<ShppingCart> getCart(String cartsession);
}
