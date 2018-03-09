package es.altair.nomina.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="irpf")
public class Irpf {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idIrpf;
	private double de;
	private double hasta;
	private double percentual;
	
	public Irpf() {
		super();
	}

	public int getIdIrpf() {
		return idIrpf;
	}

	public void setIdIrpf(int idIrpf) {
		this.idIrpf = idIrpf;
	}

	public double getDe() {
		return de;
	}

	public void setDe(double de) {
		this.de = de;
	}

	public double getHasta() {
		return hasta;
	}

	public void setHasta(double hasta) {
		this.hasta = hasta;
	}

	public double getPercentual() {
		return percentual;
	}

	public void setPercentual(double percentual) {
		this.percentual = percentual;
	}

	@Override
	public String toString() {
		return "Irpf [idIrpf=" + idIrpf + ", de=" + de + ", hasta=" + hasta + ", percentual=" + percentual + "]";
	}
	
	
	
	
	
}
