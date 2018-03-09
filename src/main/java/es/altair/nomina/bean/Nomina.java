package es.altair.nomina.bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="nominas")
public class Nomina implements Serializable  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idNomina;
	private double valor;
	private int mes;
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="idConcepto")
	private Concepto conceptos;
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="idUsuario")
	private Usuario usuarios;

	public Nomina() {
		super();
	}

	public Nomina(double valor, int mes, Concepto conceptos, Usuario usuarios) {
		super();
		this.valor = valor;
		this.mes = mes;
		this.conceptos = conceptos;
		this.usuarios = usuarios;
	}

	public int getIdNomina() {
		return idNomina;
	}

	public void setIdNomina(int idNomina) {
		this.idNomina = idNomina;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public int getMes() {
		return mes;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public Concepto getConceptos() {
		return conceptos;
	}

	public void setConceptos(Concepto conceptos) {
		this.conceptos = conceptos;
	}

	public Usuario getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(Usuario usuarios) {
		this.usuarios = usuarios;
	}

	@Override
	public String toString() {
		return "Nomina [idNomina=" + idNomina + ", valor=" + valor + ", mes=" + mes + ", conceptos=" + conceptos.getDescripcion()
				+ ", usuarios=" + usuarios.getIdUsuario() + "]";
	}



	
	

}
