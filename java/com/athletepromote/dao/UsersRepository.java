package com.athletepromote.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.athletepromote.model.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {
  
	String search="SELECT u FROM Users u WHERE u.email =:email AND " +
	  		  "u.fname LIKE (CONCAT('%',:name, '%')) OR u.lname =:name";
	
	@Query("FROM Users WHERE email=?1 AND password=?2 ")
	Optional<Users> login(String email, String password);
	
	Optional<Users> findUserByEmail(String email);
	
	@Query("FROM Users WHERE email=?1 OR fname=?1 OR lname=?1")
	List<Users> seachUser(String keyword);
	
	@Query(search)
	List<Users> customeseachUser(@Param("name") String name, @Param("email") String email);
	
	@Query(search)
	Page<Users> customeseacher(@Param("name") String name, @Param("email") String email, Pageable pageable);
	
	Page<Users> findAll(Pageable pageable);
}
