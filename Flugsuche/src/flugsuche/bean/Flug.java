package flugsuche.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;

@table(name = "flug")
public class Flug implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7318648102198792109L;


	@column(name = "flugid")
	private int id;
	@column(name = "abflugzeit")
	private Date abflugzeit;
	@column(name = "fugdauer")
	private Time flugdauer;
	@column(name = "preis")
	private double preis;
	@fkColumn(nameFK = "fk_abflughafen", referenceColumnName = "flughafenid", referenceTable = "flughafen")
	private Flughafen abFlughafen;
	@fkColumn(nameFK = "fk_anflughafen", referenceColumnName = "flughafenid", referenceTable = "flughafen")

	private Flughafen anFlughafen;
	@fkColumn(nameFK = "fk_flugzeugtyp", referenceColumnName = "flugzeugtypid", referenceTable = "flugzeugtyp")
	private Flugzeugtyp flugzeugtyp;
	
	private List<Angebot> angebotListe = new ArrayList<>();
	
	public Flug(Date abflugzeit, Time flugdauer, double preis, Flughafen abFlughafen, Flughafen anFlughafen,
			Flugzeugtyp flugzeugtyp) {
		super();
		this.abflugzeit = abflugzeit;
		this.flugdauer = flugdauer;
		this.preis = preis;
		this.abFlughafen = abFlughafen;
		this.anFlughafen = anFlughafen;
		this.flugzeugtyp = flugzeugtyp;
	}
	public Flug() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Time getFlugdauer() {
		return flugdauer;
	}
	public void setFlugdauer(Time flugdauer) {
		this.flugdauer = flugdauer;
	}
	public double getPreis() {
		return preis;
	}
	public void setPreis(double preis) {
		this.preis = preis;
	}
	public Flughafen getAbFlughafen() {
		return abFlughafen;
	}
	public void setAbFlughafen(Flughafen abFlughafen) {
		this.abFlughafen = abFlughafen;
	}
	public Flughafen getAnFlughafen() {
		return anFlughafen;
	}
	public void setAnFlughafen(Flughafen anFlughafen) {
		this.anFlughafen = anFlughafen;
	}
	public Flugzeugtyp getFlugzeugtyp() {
		return flugzeugtyp;
	}
	public void setFlugzeugtyp(Flugzeugtyp flugzeugtyp) {
		this.flugzeugtyp = flugzeugtyp;
	}
	
	

}
