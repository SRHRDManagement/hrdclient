package org.khmeracademy.smg.model.input;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddScore {
	@JsonProperty("SCOID")
	private int sco_id;
	@JsonProperty("SCOSCORE")
	private int sco_score;
	@JsonProperty("STUID")
	private int stu_id;
	@JsonProperty("SUBID")
	private int sub_id;
	@JsonProperty("MONID")
	private int mon_id;
	
	public int getSco_id() {
		return sco_id;
	}
	public int getSco_score() {
		return sco_score;
	}
	public int getStu_id() {
		return stu_id;
	}
	public int getSub_id() {
		return sub_id;
	}
	public int getMon_id() {
		return mon_id;
	}
	public void setSco_id(int sco_id) {
		this.sco_id = sco_id;
	}
	public void setSco_score(int sco_score) {
		this.sco_score = sco_score;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public void setMon_id(int mon_id) {
		this.mon_id = mon_id;
	}
}
