package com.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.model.Products;

public interface ProductRepository extends JpaRepository<Products, Long> {

}
