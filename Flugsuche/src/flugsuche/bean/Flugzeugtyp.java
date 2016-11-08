package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;

@table(name="flugzeugtyp")
public class Flugzeugtyp implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1028131256755829146L;

    
	@column(name="flugzeugtypid")
    private int id;
	
	@column(name="bezeichnung")
    private String bezeichnung;
	
	@column(name="anzahlSitzplaetzeFirstClass")
	private int seatsFirstClass;
	
	@column(name="anzahlSitzplaetzeEconomy")
	private int seatsEconomy;
	
	@fkColumn(nameFK = "fk_flugzeuggesellschaft", referenceColumnName = "fluggesellschaftid", referenceTable = "fluggesellschaft")
	private Fluggesellschaft   gesellschaft;

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

	public int getSeatsFirstClass() {
		return seatsFirstClass;
	}

	public void setSeatsFirstClass(int seatsFirstClass) {
		this.seatsFirstClass = seatsFirstClass;
	}

	public int getSeatsEconomy() {
		return seatsEconomy;
	}

	public void setSeatsEconomy(int seatsEconomy) {
		this.seatsEconomy = seatsEconomy;
	}

	public Fluggesellschaft getGesellschaft() {
		return gesellschaft;
	}

	public void setGesellschaft(Fluggesellschaft gesellschaft) {
		this.gesellschaft = gesellschaft;
	}
	

    

}
