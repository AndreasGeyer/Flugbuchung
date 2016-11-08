package flugsuche.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;

@table(name = "buchung")
public class Buchung implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5215563400773342405L;
	
	@column(name = "buchungid")
	private int id;
	@column(name = "zeitstempel")
	private Timestamp timestamp;
	@column(name = "preis")
	private double preis;
	@fkColumn(nameFK = "fk_flug", referenceColumnName = "flugid", referenceTable = "flug")
	private Flug flug;
	private List<Buchung> buchung = new ArrayList<>();
	@fkColumn(nameFK = "fk_kunde", referenceColumnName = "kundeid", referenceTable = "kunde")
	private Kunde kunde;
	

	
	

}
