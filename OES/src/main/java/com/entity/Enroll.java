package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;  // Update to jakarta.validation


@Entity
@Table(name = "enrollTable")
public class Enroll {
	@Id
	@NotNull
	@Column(name = "enrollid")
	private String enrollid;
	
	@NotNull
	@Column(name = "addedby")
	private String addedby;

	@NotNull
	@Column(name = "enexamid" )
	private String enexamid;

	@NotNull
	@Column(name = "enbatchid")
	private String enbatchid;
	
	@NotNull
	@Column(name = "enstatus")
	private String enstatus;

	public String getEnrollid() {
		return enrollid;
	}

	public void setEnrollid(String enrollid) {
		this.enrollid = enrollid;
	}

	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public String getEnexamid() {
		return enexamid;
	}

	public void setEnexamid(String enexamid) {
		this.enexamid = enexamid;
	}

	public String getEnbatchid() {
		return enbatchid;
	}

	public void setEnbatchid(String enbatchid) {
		this.enbatchid = enbatchid;
	}

	public String getEnstatus() {
		return enstatus;
	}

	public void setEnstatus(String enstatus) {
		this.enstatus = enstatus;
	}

	public Enroll(String enrollid, String addedby, String enexamid, String enbatchid, String enstatus) {
		super();
		this.enrollid = enrollid;
		this.addedby = addedby;
		this.enexamid = enexamid;
		this.enbatchid = enbatchid;
		this.enstatus = enstatus;
	}

	public Enroll() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
