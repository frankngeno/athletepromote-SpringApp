package com.athletepromote.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.athletepromote.model.AthleteStats;


@Repository
public interface AthleteStatsRespository extends JpaRepository<AthleteStats, Long> {
	
	@Query("FROM AthleteStats a WHERE a.sportType=?1 OR a.races=?1 OR a.loc=?1")
	Page<AthleteStats> seachbyRaces(String keyword, Pageable pageable);
	
	@Query("FROM AthleteStats a WHERE a.races=?1")
	Page<AthleteStats> seachRace(String keyword, Pageable pageable);
	
}
