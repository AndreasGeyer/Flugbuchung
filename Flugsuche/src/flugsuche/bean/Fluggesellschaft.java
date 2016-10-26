package flugsuche.bean;

import java.io.Serializable;

public class Fluggesellschaft implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String bezeichnung;

	public String getBezeichnung() {
		return bezeichnung;
	}

	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}
}
