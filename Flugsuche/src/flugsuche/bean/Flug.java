package flugsuche.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

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

	final long hourInMillis = 3600000L;
	@column(name = "flugid")
	private int id;
	@column(name = "abflugzeit")
	private Date abflugzeit;
	@column(name = "fugdauer")
	private Date flugdauer;
	@column(name = "preis")
	private double preis;
	@fkColumn(nameFK = "fk_abflughafen", referenceColumnName = "flughafenid", referenceTable = "flughafen")
	private Flughafen abFlughafen;
	@fkColumn(nameFK = "fk_anflughafen", referenceColumnName = "flughafenid", referenceTable = "flughafen")

	private Flughafen anFlughafen;
	@fkColumn(nameFK = "fk_flugzeugtyp", referenceColumnName = "flugzeugtypid", referenceTable = "flugzeugtyp")
	private Flugzeugtyp flugzeugtyp;

	private List<Angebot> angebotListe = new ArrayList<>();
	private List<Sitzplatz> sitzplatzListe = new ArrayList<>();
	private List<Zusatzleistung> zusatzleistungList = new ArrayList<>();

	public Flug(Date abflugzeit, Date flugdauer, double preis, Flughafen abFlughafen, Flughafen anFlughafen,
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

	public Date getFlugdauer() {
		return flugdauer;
	}

	public void setFlugdauer(Date flugdauer) {
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

	public Date getAbflugzeit() {
		return abflugzeit;
	}

	public void setAbflugzeit(Date abflugzeit) {
		this.abflugzeit = abflugzeit;
	}

	public List<Angebot> getAngebotListe() {
		return angebotListe;
	}

	public void setAngebotListe(List<Angebot> angebotListe) {
		this.angebotListe = angebotListe;
	}

	public List<Sitzplatz> getSitzplatzListe() {
		return sitzplatzListe;
	}

	public void setSitzplatzListe(List<Sitzplatz> sitzplatzListe) {
		this.sitzplatzListe = sitzplatzListe;
	}

	public List<Zusatzleistung> getZusatzleistungList() {
		return zusatzleistungList;
	}

	public void setZusatzleistungList(List<Zusatzleistung> zusatzleistungList) {
		this.zusatzleistungList = zusatzleistungList;
	}

	public Date calculateAnkunftZeit() {

		Date utc_abflug = new Date((long) (abflugzeit.getTime() - abFlughafen.getZeitzone() * hourInMillis));
		long hoursUTCAnkunft = (long) (anFlughafen.getZeitzone() * hourInMillis);
		return new Date(utc_abflug.getTime() + hoursUTCAnkunft + flugdauer.getTime());
	}

	public void calculatePreis() {
		double minPreis = preis;
		for (Angebot angebot : angebotListe) {
			if (minPreis > angebot.getPreis()) {
				minPreis = angebot.getPreis();
			}
		}
		preis = minPreis;
	}

	public int freeSeats(boolean isFirstClass) {
		int max = flugzeugtyp.getSeatsEconomy();
		int besetzt = 0;
		for (Sitzplatz platz : sitzplatzListe) {
			if (platz.isFirstClass() == isFirstClass && platz.getStatus().equals("gebucht")) {
				besetzt++;
			}
		}
		return max - besetzt;
	}

	public Zusatzleistung getVersicherung() {
		for (Zusatzleistung leistun : zusatzleistungList) {

			if (leistun.getArt().contains("Versicherung")) {
				return leistun;
			}
		}
		return null;
	}

	public String[] getTextZusatzleistung(Zusatzleistung leistung) {
		return leistung.getBeschreibung().split(";");
	}
	
	public List<Zusatzleistung> getMahlzeiten(){
		 List<Zusatzleistung> listEssen = new ArrayList<>();
			for (Zusatzleistung leistun : zusatzleistungList) {

				if (leistun.getArt().contains("Essen")) {
					listEssen.add(leistun);
				}
			}
			return listEssen;
	}
}
