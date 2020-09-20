package com.athletepromote.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.athletepromote.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {

}
