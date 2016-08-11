package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddSubject {
	@JsonProperty("SUBID")
	private int sub_id;
	@JsonProperty("SUBNAME")
	private String sub_name;
	@JsonProperty("SUBDESC")
	private String sub_description;
	@JsonProperty("SUBACTIVE")
	private boolean sub_active;
	@JsonProperty("SUBDATE")
	private Date sub_date;
	
	public int getSub_id() {
		return sub_id;
	}
	public String getSub_name() {
		return sub_name;
	}
	public String getSub_description() {
		return sub_description;
	}
	public boolean isSub_active() {
		return sub_active;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public void setSub_description(String sub_description) {
		this.sub_description = sub_description;
	}
	public void setSub_active(boolean sub_active) {
		this.sub_active = sub_active;
	}
	public Date getSub_date() {
		return sub_date;
	}
	public void setSub_date(Date sub_date) {
		this.sub_date = sub_date;
	}
}
