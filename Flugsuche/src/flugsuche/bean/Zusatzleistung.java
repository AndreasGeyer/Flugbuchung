package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;


@table(name = "zusatzleistung")
public class Zusatzleistung implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -587627524333866588L;


	
	@column(name = "zusatzleistungid")
	private int id;
	
	@column(name = "bezeichnung")
	private String bezeichnung;
	
	@column(name = "beschreibung")
	private String beschreibung;
	
	@column(name = "preis")
	private double preis;
	
	@fkColumn(nameFK = "fk_flugzeugtyp", referenceColumnName = "flugzeugtypid", referenceTable = "flugzeugtyp")
	private Flugzeugtyp flugzeugtyp;
	
	private String art;

	public Zusatzleistung() {
		super();
	}

	public Zusatzleistung(String bezeichnung, String beschreibung, double preis, Flugzeugtyp flugzeugtyp) {
		super();
		this.bezeichnung = bezeichnung;
		this.beschreibung = beschreibung;
		this.preis = preis;
		this.flugzeugtyp = flugzeugtyp;
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

	public double getPreis() {
		return preis;
	}

	public void setPreis(double preis) {
		this.preis = preis;
	}

	public Flugzeugtyp getFlugzeugtyp() {
		return flugzeugtyp;
	}

	public void setFlugzeugtyp(Flugzeugtyp flugzeugtyp) {
		this.flugzeugtyp = flugzeugtyp;
	}

	public String getArt() {
		return art;
	}

	public void setArt(String art) {
		this.art = art;
	}
	
	
	
	
}
