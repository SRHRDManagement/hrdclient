package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddClass {
	@JsonProperty("CLAID")
	private int cla_id;
	@JsonProperty("CLANAME")
	private String cla_name;
	@JsonProperty("COUID")
	private int cou_id;
	@JsonProperty("CLAACTIVE")
	private boolean cla_active;
	@JsonProperty("CLADATE")
	private Date cla_date;
	
	public int getCla_id() {
		return cla_id;
	}
	public String getCla_name() {
		return cla_name;
	}
	public int getCou_id() {
		return cou_id;
	}
	public boolean isCla_active() {
		return cla_active;
	}
	public void setCla_id(int cla_id) {
		this.cla_id = cla_id;
	}
	public void setCla_name(String cla_name) {
		this.cla_name = cla_name;
	}
	public void setCou_id(int cou_id) {
		this.cou_id = cou_id;
	}
	public void setCla_active(boolean cla_active) {
		this.cla_active = cla_active;
	}
	public Date getCla_date() {
		return cla_date;
	}
	public void setCla_date(Date cla_date) {
		this.cla_date = cla_date;
	}
}
