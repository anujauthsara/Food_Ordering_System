package com.driver;



public class Driver {
	
	private String first_name;
    private String last_name;
    private String mobile;
    private String email;
    private String birthday;
    private String password;
    
    
	
	public Driver(String first_name, String last_name, String mobile, String email, String birthday, String password) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.mobile = mobile;
		this.email = email;
		this.birthday = birthday;
		this.password = password;
	}
	
	public String getFirst_name() {
		return first_name;
	}

	
	public String getLast_name() {
		return last_name;
	}

	public String getMobile() {
		return mobile;
	}

	
	public String getEmail() {
		return email;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
	public String getPassword() {
		return password;
	}
	
}














