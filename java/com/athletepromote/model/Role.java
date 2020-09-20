package com.athletepromote.model;

import javax.persistence.*;

@Entity
@Table(name = "role")
public class Role {
	
	 
    public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private long id;
    @Column(name = "role")
    private String role;   

	public Role(long id, String role) {
		super();
		this.id = id;
		this.role = role;
	}

	public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

	@Override
	public String toString() {
		return "Role [id=" + id + ", role=" + role + "]";
	}


}