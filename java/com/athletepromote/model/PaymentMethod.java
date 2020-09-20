package com.athletepromote.model;

import javax.persistence.*;

@Entity
@Table(name="paymethod")
public class PaymentMethod {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;	
	private String expiry;
	private String cardno;
	private String secode;
	private String type;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="users_id")
	private Users user;
	
	public PaymentMethod() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getExpiry() {
		return expiry;
	}
	public void setExpiry(String expiry) {
		this.expiry = expiry;
	}
	public String getCardno() {
		return cardno;
	}
	public void setCardno(String cardno) {
		this.cardno = cardno;
	}
	public String getSecode() {
		return secode;
	}
	public void setSecode(String secode) {
		this.secode = secode;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "PaymentMethod [id=" + id + ", expiry=" + expiry + ", cardno=" + cardno + ", secode=" + secode
				+ ", type=" + type + ", user=" + user + "]";
	}
	
	
	
	
}
