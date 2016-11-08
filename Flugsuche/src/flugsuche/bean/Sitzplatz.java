package flugsuche.bean;

import java.io.Serializable;

import flugsuche.annotation.column;
import flugsuche.annotation.fkColumn;
import flugsuche.annotation.table;

@table(name = "sitzplatz")
public class Sitzplatz implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6071939410658496141L;

	@column(name = "sitzplatzid")
	private int id;
	@fkColumn(nameFK = "fk_flug", referenceColumnName = "flugid", referenceTable = "flug")
	private Flug flug;
	@column(name = "istFirstClass")
	private boolean isFirstClass;
	@column(name = "status")
	private String status;

	public Sitzplatz(Flug flug, boolean isFirstClass, String status) {
		super();
		this.flug = flug;
		this.isFirstClass = isFirstClass;
		this.status = status;
	}

	public Sitzplatz() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Flug getFlug() {
		return flug;
	}

	public void setFlug(Flug flug) {
		this.flug = flug;
	}

	public boolean isFirstClass() {
		return isFirstClass;
	}

	public void setFirstClass(boolean isFirstClass) {
		this.isFirstClass = isFirstClass;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
