package es.altair.nomina.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="meses")
public class Meses {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idMes;
	private String DescMes;
	
	public Meses() {
		super();
	}

	public int getIdMes() {
		return idMes;
	}

	public void setIdMes(int idMes) {
		this.idMes = idMes;
	}

	public String getDescMes() {
		return DescMes;
	}

	public void setDescMes(String descMes) {
		DescMes = descMes;
	}
	
	
	
	
	
	
}
