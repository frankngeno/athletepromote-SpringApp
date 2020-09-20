package com.athletepromote.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.athletepromote.model.PhoneBook;

public interface PhoneBookRepository extends JpaRepository<PhoneBook, Long> {

}
