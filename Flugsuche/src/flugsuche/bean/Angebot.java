package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;

@table(name="angebot")
public class Angebot implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4313550107922281008L;

	
	@column(name="angebotid")
	private int id;
	@column(name="bezeichnung")
	private String bezeichnung;
	@column(name="beschreibung")
	private String beschreibung;
	@column(name="bild")
	private byte[] bild;
	@column(name="angebotspreis")
	private double preis;
	@fkColumn(nameFK = "fk_flug", referenceColumnName = "flugid", referenceTable = "flug")
	private Flug flug;
	
	
	public Angebot() {
		super();
	}


	public Angebot(String bezeichnung, String beschreibung, byte[] bild, double preis, Flug flug) {
		super();
		this.bezeichnung = bezeichnung;
		this.beschreibung = beschreibung;
		this.bild = bild;
		this.preis = preis;
		this.flug = flug;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getBezeichnung() {
		return bezeichnung;
	}


	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}


	public String getBeschreibung() {
		return beschreibung;
	}


	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}


	public byte[] getBild() {
		return bild;
	}


	public void setBild(byte[] bild) {
		this.bild = bild;
	}


	public double getPreis() {
		return preis;
	}


	public void setPreis(double preis) {
		this.preis = preis;
	}


	public Flug getFlug() {
		return flug;
	}


	public void setFlug(Flug flug) {
		this.flug = flug;
	}
	
	
	 

}
