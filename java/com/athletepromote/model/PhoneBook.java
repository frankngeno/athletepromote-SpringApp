package com.athletepromote.model;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="phone_book")
public class PhoneBook {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
	private String tel;
	private String type;
	
	@JsonIgnore
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="users_id")
	private Users user;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "PhoneBook [id=" + id + ", tel=" + tel + ", type=" + type + ", user=" + user + "]";
	}
	
	
	

}
