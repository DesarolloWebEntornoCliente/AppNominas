package es.altair.nomina.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="conceptos")
public class Concepto implements Serializable  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idConcepto;
	private String descripcion;
	private double impuesto;
	private String tipo;
	
	@OneToMany(mappedBy="conceptos", cascade=CascadeType.ALL)
	private Set<Nomina> nominas = new HashSet<Nomina>();

	public Concepto() {
		super();
	}

	public Concepto(String descripcion, double impuesto, String tipo, Set<Nomina> nominas) {
		super();
		this.descripcion = descripcion;
		this.impuesto = impuesto;
		this.tipo = tipo;
		this.nominas = nominas;
	}

	public int getIdConcepto() {
		return idConcepto;
	}

	public void setIdConcepto(int idConcepto) {
		this.idConcepto = idConcepto;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getImpuesto() {
		return impuesto;
	}

	public void setImpuesto(double impuesto) {
		this.impuesto = impuesto;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Set<Nomina> getNominas() {
		return nominas;
	}

	public void setNominas(Set<Nomina> nominas) {
		this.nominas = nominas;
	}

	
	
}
