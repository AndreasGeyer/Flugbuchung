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

	/**
	zusatzleistungid integer primary key auto_increment,
    bezeichnung varchar(255),
    beschreibung blob,
    preis decimal(10,2),
    fk_flugzeugtyp integer,
    constraint fk_zusatzleistung_flugzeugtyp
		foreign key (fk_flugzeugtyp)
        references flugzeugtyp(flugzeugtypid)
        on delete cascade
        on update cascade*/
	
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
	
	
	
	
}
