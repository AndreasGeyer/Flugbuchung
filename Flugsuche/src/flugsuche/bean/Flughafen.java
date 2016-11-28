package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.table;

@table(name = "flughafen")
public class Flughafen implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 8082168128863727641L;
	
	@column(name = "flughafenid")
	private int id;
	
	@column(name = "ort")
	private String ort;
	
	@column(name = "kuerzel")
	private String kuerzel;
	
	@column(name = "zeitzone")
	private double zeitzone;
	
	@column(name = "land")
	private String land;
	
	public  Flughafen(){
		super();
	}
	
	
	public Flughafen(String ort, String kuerzel, double zeitzone, String land) {
		super();
		this.ort = ort;
		this.kuerzel = kuerzel;
		this.zeitzone = zeitzone;
		this.land = land;
	}
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


	public String getLand() {
		return land;
	}


	public void setLand(String land) {
		this.land = land;
	}
	
	
	
}
