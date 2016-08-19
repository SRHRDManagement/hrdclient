package org.khmeracademy.smg.model.input;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddEnrollStudent {
	@JsonProperty("SEID")
	private int se_id;
	@JsonProperty("CLAID")
	private int cla_id;
	@JsonProperty("STUID")
	private int stu_id;
	
	public int getSe_id() {
		return se_id;
	}
	public int getCla_id() {
		return cla_id;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setSe_id(int se_id) {
		this.se_id = se_id;
	}
	public void setCla_id(int cla_id) {
		this.cla_id = cla_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
}
