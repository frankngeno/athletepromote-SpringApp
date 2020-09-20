package com.athletepromote.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.athletepromote.model.ImageFiles;


@Repository
public interface ImageRepository extends JpaRepository<ImageFiles, Long> {

}
