package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddGeneration {
	
	@JsonProperty("GENID")
	private int gen_id;
	@JsonProperty("GENNAME")
	private String gen_name;
	@JsonProperty("GENSTARTDATE")
	private Date gen_start_date;
	@JsonProperty("GENENDDATE")
	private Date gen_end_date;
	@JsonProperty("GENISFINISH")
	private boolean gen_is_finish;
	
	public String getGen_name() {
		return gen_name;
	}
	public void setGen_name(String gen_name) {
		this.gen_name = gen_name;
	}
	public Date getGen_start_date() {
		return gen_start_date;
	}
	public void setGen_start_date(Date gen_start_date) {
		this.gen_start_date = gen_start_date;
	}
	public Date getGen_end_date() {
		return gen_end_date;
	}
	public void setGen_end_date(Date gen_end_date) {
		this.gen_end_date = gen_end_date;
	}
	public int getGen_id() {
		return gen_id;
	}
	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}
	public boolean isGen_is_finish() {
		return gen_is_finish;
	}
	public void setGen_is_finish(boolean gen_is_finish) {
		this.gen_is_finish = gen_is_finish;
	}
}
