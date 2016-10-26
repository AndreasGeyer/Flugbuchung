package flugsuche.bean;

import java.io.Serializable;

public class Flughafen implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String ort;
	private String kuerzel;
	private double zeitzone;
	
	
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getOrt() {
		return ort;
	}
	public void setOrt(String ort) {
		this.ort = ort;
	}
	public String getKuerzel() {
		return kuerzel;
	}
	public void setKuerzel(String kuerzel) {
		this.kuerzel = kuerzel;
	}
	public double getZeitzone() {
		return zeitzone;
	}
	public void setZeitzone(double zeitzone) {
		this.zeitzone = zeitzone;
	}
	
	
	
}
