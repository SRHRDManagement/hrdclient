package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddAttendance {
	@JsonProperty("ATTID")
	private int att_id;
	@JsonProperty("ATTDATE")
	private Date att_date;
	@JsonProperty("ATTSHIFT")
	private String att_shift;
	@JsonProperty("STUID")
	private int stu_id;
	@JsonProperty("ATTREASON")
	private String att_reason;
	@JsonProperty("ABSID")
	private int abs_id;
	
	public int getAtt_id() {
		return att_id;
	}
	public Date getAtt_date() {
		return att_date;
	}
	public String getAtt_shift() {
		return att_shift;
	}
	public int getStu_id() {
		return stu_id;
	}
	public String getAtt_reason() {
		return att_reason;
	}
	public int getAbs_id() {
		return abs_id;
	}
	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}
	public void setAtt_date(Date att_date) {
		this.att_date = att_date;
	}
	public void setAtt_shift(String att_shift) {
		this.att_shift = att_shift;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public void setAtt_reason(String att_reason) {
		this.att_reason = att_reason;
	}
	public void setAbs_id(int abs_id) {
		this.abs_id = abs_id;
	}
}
