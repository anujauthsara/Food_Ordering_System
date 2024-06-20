package com.customer;

public class Customer {
	

		private String email;
	    private String houseNo;
	    private String lane;
	    private String subCity;
	    private String City;
	    private String district;
	    
	    
	 	public Customer(String email, String houseNo, String lane, String subCity, String city, String district) {
		super();
		this.email = email;
		this.houseNo = houseNo;
		this.lane = lane;
		this.subCity = subCity;
		City = city;
		this.district = district;
	}


		public String getEmail() {
			return email;
		}



		public String getHouseNo() {
			return houseNo;
		}

		public String getLane() {
			return lane;
		}

		public String getSubCity() {
			return subCity;
		}


		public String getCity() {
			return City;
		}


		public String getDistrict() {
			return district;
		}


	

}
