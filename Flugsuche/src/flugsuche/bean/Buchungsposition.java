package flugsuche.bean;

import java.io.Serializable;

public class Buchungsposition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6185818744545581127L;
	
	private int id;
	private Buchung buchung;
	private Zusatzleistung zusatzleistung;
	private Sitzplatz sitzplatz;
	private double preis;
	
	
	
	public Buchungsposition() {
		super();
	}
	public Buchungsposition(Buchung buchung, Zusatzleistung zusatzleistung, Sitzplatz sitzplatz, double preis) {
		super();
		this.buchung = buchung;
		this.zusatzleistung = zusatzleistung;
		this.sitzplatz = sitzplatz;
		this.preis = preis;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Buchung getBuchung() {
		return buchung;
	}
	public void setBuchung(Buchung buchung) {
		this.buchung = buchung;
	}
	public Zusatzleistung getZusatzleistung() {
		return zusatzleistung;
	}
	public void setZusatzleistung(Zusatzleistung zusatzleistung) {
		this.zusatzleistung = zusatzleistung;
	}
	public Sitzplatz getSitzplatz() {
		return sitzplatz;
	}
	public void setSitzplatz(Sitzplatz sitzplatz) {
		this.sitzplatz = sitzplatz;
	}
	public double getPreis() {
		return preis;
	}
	public void setPreis(double preis) {
		this.preis = preis;
	}
	
	

}
