package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddStudent {
	@JsonProperty("STUID")
	private int stu_id;
	@JsonProperty("STUFIRSTNAME")
	private String stu_firstname;
	@JsonProperty("STULASTNAME")
	private String stu_lastname;
	@JsonProperty("STUGENDER")
	private char stu_gender;
	@JsonProperty("STUDOB")
	private Date stu_dob;
	@JsonProperty("STUADDRESS")
	private String stu_address;
	@JsonProperty("STUPHONE")
	private String stu_phone;
	@JsonProperty("STUNATIONALITY")
	private String stu_nationality;
	@JsonProperty("STUSOCIALID")
	private String stu_social_id;
	@JsonProperty("STUAVATAR")
	private String stu_avatar;
	@JsonProperty("STUFATHERNAME")
	private String stu_fathername;
	@JsonProperty("STUFATHERPHONE")
	private String stu_father_phone;
	@JsonProperty("STUFATHERJOB")
	private String stu_father_job;
	@JsonProperty("STUMOTHERNAME")
	private String stu_mothername;
	@JsonProperty("STUMOTHERPHONE")
	private String stu_mother_phone;
	@JsonProperty("STUMOTHERJOB")
	private String stu_mother_job;
	@JsonProperty("STUSTATUS")
	private String stu_status;
	@JsonProperty("GENID")
	private int gen_id;
	
	public int getStu_id() {
		return stu_id;
	}
	public String getStu_firstname() {
		return stu_firstname;
	}
	public String getStu_lastname() {
		return stu_lastname;
	}
	public char getStu_gender() {
		return stu_gender;
	}
	public Date getStu_dob() {
		return stu_dob;
	}
	public String getStu_address() {
		return stu_address;
	}
	public String getStu_phone() {
		return stu_phone;
	}
	public String getStu_nationality() {
		return stu_nationality;
	}
	public String getStu_social_id() {
		return stu_social_id;
	}
	public String getStu_avatar() {
		return stu_avatar;
	}
	public String getStu_fathername() {
		return stu_fathername;
	}
	public String getStu_father_phone() {
		return stu_father_phone;
	}
	public String getStu_father_job() {
		return stu_father_job;
	}
	public String getStu_mothername() {
		return stu_mothername;
	}
	public String getStu_mother_phone() {
		return stu_mother_phone;
	}
	public String getStu_mother_job() {
		return stu_mother_job;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public void setStu_firstname(String stu_firstname) {
		this.stu_firstname = stu_firstname;
	}
	public void setStu_lastname(String stu_lastname) {
		this.stu_lastname = stu_lastname;
	}
	public void setStu_gender(char stu_gender) {
		this.stu_gender = stu_gender;
	}
	public void setStu_dob(Date stu_dob) {
		this.stu_dob = stu_dob;
	}
	public void setStu_address(String stu_address) {
		this.stu_address = stu_address;
	}
	public void setStu_phone(String stu_phone) {
		this.stu_phone = stu_phone;
	}
	public void setStu_nationality(String stu_nationality) {
		this.stu_nationality = stu_nationality;
	}
	public void setStu_social_id(String stu_social_id) {
		this.stu_social_id = stu_social_id;
	}
	public void setStu_avatar(String stu_avatar) {
		this.stu_avatar = stu_avatar;
	}
	public void setStu_fathername(String stu_fathername) {
		this.stu_fathername = stu_fathername;
	}
	public void setStu_father_phone(String stu_father_phone) {
		this.stu_father_phone = stu_father_phone;
	}
	public void setStu_father_job(String stu_father_job) {
		this.stu_father_job = stu_father_job;
	}
	public void setStu_mothername(String stu_mothername) {
		this.stu_mothername = stu_mothername;
	}
	public void setStu_mother_phone(String stu_mother_phone) {
		this.stu_mother_phone = stu_mother_phone;
	}
	public void setStu_mother_job(String stu_mother_job) {
		this.stu_mother_job = stu_mother_job;
	}
	public String getStu_status() {
		return stu_status;
	}
	public void setStu_status(String stu_status) {
		this.stu_status = stu_status;
	}
	public int getGen_id() {
		return gen_id;
	}
	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}
}
