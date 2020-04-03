package com.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.model.PhoneBook;

public interface PhoneBookRepository extends JpaRepository<PhoneBook, Long> {

}
