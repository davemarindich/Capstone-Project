package com.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Long> {

}
