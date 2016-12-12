package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.table;

@table(name = "fluggesellschaftid")
public class Fluggesellschaft implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6614520296239880369L;

	@column(name = "id")
	private int id;

	@column(name = "bezeichnung")
	private String bezeichnung;

	public Fluggesellschaft() {

	}

	public Fluggesellschaft(String bezeichnung) {
		super();
		this.bezeichnung = bezeichnung;
	}

	public int getId() {
		return id;
	}

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
