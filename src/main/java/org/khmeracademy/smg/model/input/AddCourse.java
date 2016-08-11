package org.khmeracademy.smg.model.input;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AddCourse {
	
	@JsonProperty("COUID")
	private int cou_id;
	
	@JsonProperty("COUNAME")
	private String cou_name;
	
	@JsonProperty("COUSTARTDATE")
	private Date cou_start_date;
	
	@JsonProperty("COUENDDATE")
	private Date cou_end_date;
	
	@JsonProperty("GENID")
	private int gen_id;
	
	@JsonProperty("COUISFINISH")
	private boolean cou_is_finish;

	public int getCou_id() {
		return cou_id;
	}

	public void setCou_id(int cou_id) {
		this.cou_id = cou_id;
	}

	public String getCou_name() {
		return cou_name;
	}

	public void setCou_name(String cou_name) {
		this.cou_name = cou_name;
	}

	public Date getCou_end_date() {
		return cou_end_date;
	}

	public void setCou_end_date(Date cou_end_date) {
		this.cou_end_date = cou_end_date;
	}

	public int getGen_id() {
		return gen_id;
	}

	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}

	public boolean isCou_is_finish() {
		return cou_is_finish;
	}

	public void setCou_is_finish(boolean cou_is_finish) {
		this.cou_is_finish = cou_is_finish;
	}

}
