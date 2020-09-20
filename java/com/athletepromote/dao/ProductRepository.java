package com.athletepromote.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.athletepromote.model.Products;

public interface ProductRepository extends JpaRepository<Products, Long> {

	
}
