package com.athletepromote.model;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="athlete_stats")
public class AthleteStats {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String sportType;
	private Integer goals;
	private String races;
	private String gender;
	private Integer position;
	
	private String timetaken;
	private String loc;
	
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

	public String getSportType() {
		return sportType;
	}

	public void setSportType(String sportType) {
		this.sportType = sportType;
	}

	public Integer getGoals() {
		return goals;
	}

	public void setGoals(Integer goals) {
		this.goals = goals;
	}

	public String getRaces() {
		return races;
	}

	public void setRaces(String races) {
		this.races = races;
	}

	public String getTimetaken() {
		return timetaken;
	}

	public void setTimetaken(String timetaken) {
		this.timetaken = timetaken;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}
	
	@Override
	public String toString() {
		return "AthleteStats [id=" + id + ", sportType=" + sportType + ", goals=" + goals + ", races=" + races
				+ ", gender=" + gender + ", position=" + position + ", timetaken=" + timetaken + ", loc=" + loc
				+ ", user=" + user + ", getId()=" + getId() + ", getSportType()=" + getSportType() + ", getGoals()="
				+ getGoals() + ", getRaces()=" + getRaces() + ", getTimetaken()=" + getTimetaken() + ", getLoc()="
				+ getLoc() + ", getUser()=" + getUser() + ", getGender()=" + getGender() + ", getPosition()="
				+ getPosition() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}



	
	
	
}
