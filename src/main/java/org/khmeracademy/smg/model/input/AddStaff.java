package org.khmeracademy.smg.model.input;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddStaff {
	@JsonProperty("STAID")
	private int sta_id;
	@JsonProperty("STAFIRSTNAME")
	private String sta_firstname;
	@JsonProperty("STALASTNAME")
	private String sta_lastname;
	@JsonProperty("STAGENDER")
	private char sta_gender;
	@JsonProperty("STAPHONE")
	private String sta_phone;
	@JsonProperty("STAAVATAR")
	private String sta_avatar;
	@JsonProperty("STASTATUS")
	private String sta_status;
	private AddEnrollStaff studyProcess;
	private AddClass clas;
	private AddSubject subject;
	
	public AddEnrollStaff getStudyProcess() {
		return studyProcess;
	}
	public AddClass getClas() {
		return clas;
	}
	public AddSubject getSubject() {
		return subject;
	}
	public void setStudyProcess(AddEnrollStaff studyProcess) {
		this.studyProcess = studyProcess;
	}
	public void setClas(AddClass clas) {
		this.clas = clas;
	}
	public void setSubject(AddSubject subject) {
		this.subject = subject;
	}
	public int getSta_id() {
		return sta_id;
	}
	public String getSta_firstname() {
		return sta_firstname;
	}
	public String getSta_lastname() {
		return sta_lastname;
	}
	public char getSta_gender() {
		return sta_gender;
	}
	public String getSta_phone() {
		return sta_phone;
	}
	public String getSta_avatar() {
		return sta_avatar;
	}
	public String getSta_status() {
		return sta_status;
	}
	public void setSta_id(int sta_id) {
		this.sta_id = sta_id;
	}
	public void setSta_firstname(String sta_firstname) {
		this.sta_firstname = sta_firstname;
	}
	public void setSta_lastname(String sta_lastname) {
		this.sta_lastname = sta_lastname;
	}
	public void setSta_gender(char sta_gender) {
		this.sta_gender = sta_gender;
	}
	public void setSta_phone(String sta_phone) {
		this.sta_phone = sta_phone;
	}
	public void setSta_avatar(String sta_avatar) {
		this.sta_avatar = sta_avatar;
	}
	public void setSta_status(String sta_status) {
		this.sta_status = sta_status;
	}
}
