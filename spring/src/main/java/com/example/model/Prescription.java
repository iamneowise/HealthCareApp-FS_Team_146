package com.example.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Prescription {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String pat_name;
	private String pat_email;
	private String doc_name;
	private String doc_email;
	private String dose;
	private String medicine_name;
	private String morning;
	private String afternoon;
	private String night;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPat_name() {
		return pat_name;
	}
	public void setPat_name(String pat_name) {
		this.pat_name = pat_name;
	}
	public String getPat_email() {
		return pat_email;
	}
	public void setPat_email(String pat_email) {
		this.pat_email = pat_email;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_email() {
		return doc_email;
	}
	public void setDoc_email(String doc_email) {
		this.doc_email = doc_email;
	}
	
	public String getDose() {
		return dose;
	}
	public void setDose(String dose) {
		this.dose = dose;
	}
	public String getMedicine_name() {
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
	public String getMorning() {
		return morning;
	}
	public void setMorning(String morning) {
		this.morning = morning;
	}
	public String getAfternoon() {
		return afternoon;
	}
	public void setAfternoon(String afternoon) {
		this.afternoon = afternoon;
	}
	public String getNight() {
		return night;
	}
	public void setNight(String night) {
		this.night = night;
	}
	@Override
	public String toString() {
		return "Prescription [id=" + id + ", pat_name=" + pat_name + ", pat_email=" + pat_email + ", doc_name="
				+ doc_name + ", doc_email=" + doc_email + ", dose=" + dose + ", medicine_name=" + medicine_name
				+ ", morning=" + morning + ", afternoon=" + afternoon + ", night=" + night + ", getId()=" + getId()
				+ ", getPat_name()=" + getPat_name() + ", getPat_email()=" + getPat_email() + ", getDoc_name()="
				+ getDoc_name() + ", getDoc_email()=" + getDoc_email() + ", getDose()=" + getDose()
				+ ", getMedicine_name()=" + getMedicine_name() + ", getMorning()=" + getMorning() + ", getAfternoon()="
				+ getAfternoon() + ", getNight()=" + getNight() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
