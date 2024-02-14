package com.USER;

public class UserDetails {
	private int id;
       private String name;
       private String email;
       private String mobile;
       private String password;
       private String secque;
       private String secans;
	public UserDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserDetails(int id,String name, String email,String mobile, String password,String secque,String secans) {
		super();
		this.id=id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.secque=secque;
		this.secans=secans;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSecque() {
		return secque;
	}
	public void setSecque(String secque) {
		this.secque = secque;
	}
	public String getSecans() {
		return secans;
	}
	public void setSecans(String secans) {
		this.secans = secans;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
       
}
