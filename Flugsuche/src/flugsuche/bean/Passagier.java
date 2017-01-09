package flugsuche.bean;

import java.io.Serializable;
import java.sql.Date;

import flugsuche.annotation.column;
import flugsuche.annotation.table;

@table(name="passagier")
public class Passagier  implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 8270177403462569423L;

	@column(name="passagierid")
    private int id;
	
	@column(name="pass_vorname")
	private String vorname;
	
	@column(name="pass_nachname")
	private String nachname;
	
	@column(name="pass_geburtsdatum")
	private Date geburtsdatum;
	
	public Passagier(){
		
	}
	public Passagier(String vorname, String nachname, Date geburtsdatum) {
		super();
		this.vorname = vorname;
		this.nachname = nachname;
		this.geburtsdatum = geburtsdatum;
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
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

}
