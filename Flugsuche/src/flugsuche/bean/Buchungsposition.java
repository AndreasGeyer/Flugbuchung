package flugsuche.bean;

import java.io.Serializable;
import java.util.Date;

public class Buchungsposition implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6185818744545581127L;
	
	private int positionid;
	private Buchung buchung;
	private Zusatzleistung zusatzleistung;
	private Sitzplatz sitzplatz;
	private Flug flug;
	private String passagierVorname;
	private String passagierNachname;
	private Date geburtsdatum;
	private double preis;
	
	
	
	public Buchungsposition() {
		super();
	}



	public int getPositionid() {
		return positionid;
	}



	public void setPositionid(int positionid) {
		this.positionid = positionid;
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



	public Flug getFlug() {
		return flug;
	}



	public void setFlug(Flug flug) {
		this.flug = flug;
	}



	public String getPassagierVorname() {
		return passagierVorname;
	}



	public void setPassagierVorname(String passagierVorname) {
		this.passagierVorname = passagierVorname;
	}



	public String getPassagierNachname() {
		return passagierNachname;
	}



	public void setPassagierNachname(String passagierNachname) {
		this.passagierNachname = passagierNachname;
	}



	public Date getGeburtsdatum() {
		return geburtsdatum;
	}



	public void setGeburtsdatum(Date geburtsdatum) {
		this.geburtsdatum = geburtsdatum;
	}



	public double getPreis() {
		return preis;
	}



	public void setPreis(double preis) {
		this.preis = preis;
	}


	

}
