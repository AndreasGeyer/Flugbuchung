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
	

	private int id;

	private Timestamp timestamp;

	private List<Buchungsposition> positionen = new ArrayList<>();

	private Kunde kunde;
	private String zahlungsart;
	private String zahlungsnummer;
	private double gesamtPreis;

	

	
	//Hilfsvariablen
	private Flug hinflug;
	private Flug rueckflug;






	public double getGesamtPreis() {
		return gesamtPreis;
	}


	public void setGesamtPreis(double gesamtPreis) {
		this.gesamtPreis = gesamtPreis;
	}


	public Buchung() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Timestamp getTimestamp() {
		return timestamp;
	}


	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}


	public List<Buchungsposition> getPositionen() {
		return positionen;
	}


	public void setPositionen(List<Buchungsposition> positionen) {
		this.positionen = positionen;
	}


	public Kunde getKunde() {
		return kunde;
	}


	public void setKunde(Kunde kunde) {
		this.kunde = kunde;
	}


	public String getZahlungsart() {
		return zahlungsart;
	}


	public void setZahlungsart(String zahlungsart) {
		this.zahlungsart = zahlungsart;
	}


	public String getZahlungsnummer() {
		return zahlungsnummer;
	}


	public void setZahlungsnummer(String zahlungsnummer) {
		this.zahlungsnummer = zahlungsnummer;
	}


	
	public double getGesamtpreis(){
		double preis = 0;
		for(Buchungsposition pos: positionen){
			preis = preis+pos.getPreis();
		}
		return preis;

	}


	public Flug getHinflug() {
		return hinflug;
	}


	public void setHinflug(Flug hinflug) {
		this.hinflug = hinflug;
	}


	public Flug getRueckflug() {
		return rueckflug;
	}


	public void setRueckflug(Flug rueckflug) {
		this.rueckflug = rueckflug;

	}

	
	

}
