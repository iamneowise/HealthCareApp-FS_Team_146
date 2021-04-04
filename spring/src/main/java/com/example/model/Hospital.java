package com.example.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Hospital {

		@Id
		private int id;
		private String email;
		private String special;
		private String hos_name;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getSpecial() {
			return special;
		}
		public void setSpecial(String special) {
			this.special = special;
		}
		public String getHos_name() {
			return hos_name;
		}
		public void setHos_name(String hos_name) {
			this.hos_name = hos_name;
		}
		@Override
		public String toString() {
			return "Hospital [id=" + id + ", email=" + email + ", special=" + special + ", hos_name=" + hos_name + "]";
		}
		
		
		
}
