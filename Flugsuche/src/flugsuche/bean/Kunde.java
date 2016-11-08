package flugsuche.bean;

import java.io.Serializable;
import java.sql.Date;
import flugsuche.annotation.*;

@table(name="kunde")
public class Kunde  implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 8270177403462569423L;

	@column(name="kundeid")
    private int id;
	
	@column(name="anrede")
	private String anrede;
	
	@column(name="titel")
	private String titel;
	
	@column(name="vorname")
	private String vorname;
	
	@column(name="nachname")
	private String nachname;
	
	@column(name="geburtsdatum")
	private Date geburtsdatum;
	
	@column(name="email")
	private String mail;
	
	@column(name="passwort")
	private byte passwort;
	
	@column(name="strasse")
	private String strasse;
	
	@column(name="hausnummer")
	private String hausnummer;
		
	@column(name="postleitzahl")
	private String PLZ;
	
	@column(name="ort")
	private String Ort;
	
	@column(name="nutzerbild")
	private byte[] bild;
	
	@column(name="istPremium")
	private boolean isPremium;
	
	public Kunde(){
		
	}

	public Kunde(String anrede, String titel, String vorname, String nachname, Date geburtsdatum, String mail,
			byte passwort, String strasse, String hausnummer, String pLZ, String ort, byte[] bild, boolean isPremium) {
		super();
		this.anrede = anrede;
		this.titel = titel;
		this.vorname = vorname;
		this.nachname = nachname;
		this.geburtsdatum = geburtsdatum;
		this.mail = mail;
		this.passwort = passwort;
		this.strasse = strasse;
		this.hausnummer = hausnummer;
		PLZ = pLZ;
		Ort = ort;
		this.bild = bild;
		this.isPremium = isPremium;
	}

	public String getAnrede() {
		return anrede;
	}

	public void setAnrede(String anrede) {
		this.anrede = anrede;
	}

	public String getTitel() {
		return titel;
	}

	public void setTitel(String titel) {
		this.titel = titel;
	}

	public String getVorname() {
		return vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}

	public String getNachname() {
		return nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}

	public Date getGeburtsdatum() {
		return geburtsdatum;
	}

	public void setGeburtsdatum(Date geburtsdatum) {
		this.geburtsdatum = geburtsdatum;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public byte getPasswort() {
		return passwort;
	}

	public void setPasswort(byte passwort) {
		this.passwort = passwort;
	}

	public String getStrasse() {
		return strasse;
	}

	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getHausnummer() {
		return hausnummer;
	}

	public void setHausnummer(String hausnummer) {
		this.hausnummer = hausnummer;
	}

	public String getPLZ() {
		return PLZ;
	}

	public void setPLZ(String pLZ) {
		PLZ = pLZ;
	}

	public String getOrt() {
		return Ort;
	}

	public void setOrt(String ort) {
		Ort = ort;
	}

	public byte[] getBild() {
		return bild;
	}

	public void setBild(byte[] bild) {
		this.bild = bild;
	}

	public boolean isPremium() {
		return isPremium;
	}

	public void setPremium(boolean isPremium) {
		this.isPremium = isPremium;
	}

	public int getId() {
		return id;
	}
	
	
	

}
