package org.khmeracademy.smg.model.input;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AddUser {
	
	@JsonProperty("ID")
	private int id;
	@JsonProperty("PASSWORD")
	private String password;
	@JsonProperty("EMAIL")
	private String email;
	@JsonProperty("USERNAME")
	private String username;
	@JsonProperty("ROLE_ID")
	private int rol_id;
	@JsonProperty("USRDATE")
	private Date usr_date;
	@JsonProperty("USRFIRSTNAME")
	private String usr_firstname;
	@JsonProperty("USRLASTNAME")
	private String usr_lastname;
	@JsonProperty("USRGENDER")
	private String usr_gender;
	@JsonProperty("USRPHONE")
	private String usr_phone;
	@JsonProperty("USRAVATAR")
	private String usr_avatar;
	@JsonProperty("USRSTATUS")
	private boolean usr_status;
	@JsonProperty("STUID")
	private int stu_id;
	@JsonProperty("STAID")
	private int sta_id;
	
	public String getUsr_firstname() {
		return usr_firstname;
	}
	public String getUsr_lastname() {
		return usr_lastname;
	}
	public String getUsr_gender() {
		return usr_gender;
	}
	public String getUsr_phone() {
		return usr_phone;
	}
	public String getUsr_avatar() {
		return usr_avatar;
	}
	public void setUsr_firstname(String usr_firstname) {
		this.usr_firstname = usr_firstname;
	}
	public void setUsr_lastname(String usr_lastname) {
		this.usr_lastname = usr_lastname;
	}
	public void setUsr_gender(String usr_gender) {
		this.usr_gender = usr_gender;
	}
	public void setUsr_phone(String usr_phone) {
		this.usr_phone = usr_phone;
	}
	public void setUsr_avatar(String usr_avatar) {
		this.usr_avatar = usr_avatar;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String emial) {
		this.email = emial;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getRol_id() {
		return rol_id;
	}
	public void setRol_id(int rol_id) {
		this.rol_id = rol_id;
	}
	public Date getUsr_date() {
		return usr_date;
	}
	public void setUsr_date(Date usr_date) {
		this.usr_date = usr_date;
	}
	public boolean isUsr_status() {
		return usr_status;
	}
	public void setUsr_status(boolean usr_status) {
		this.usr_status = usr_status;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getSta_id() {
		return sta_id;
	}
	public void setSta_id(int sta_id) {
		this.sta_id = sta_id;
	}
	
	

}
