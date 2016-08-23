package org.khmeracademy.smg.model.input;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Month {
	@JsonProperty("MONID")
	private int mon_id;
	@JsonProperty("MONNAME")
	private String mon_name;
	public int getMon_id() {
		return mon_id;
	}
	public String getMon_name() {
		return mon_name;
	}
	public void setMon_id(int mon_id) {
		this.mon_id = mon_id;
	}
	public void setMon_name(String mon_name) {
		this.mon_name = mon_name;
	}
}
