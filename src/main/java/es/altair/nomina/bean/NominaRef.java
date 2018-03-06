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
@Table(name="nominasref")
public class NominaRef implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idNominaRef;
	private double valor;
	private int mes;
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="idUsuario")
	private Usuario usuariosRef;

	public NominaRef() {
		super();
	}

	public NominaRef(double valor, int mes, Usuario usuariosRef) {
		super();
		this.valor = valor;
		this.mes = mes;
		this.usuariosRef = usuariosRef;
	}

	public int getIdNominaRef() {
		return idNominaRef;
	}

	public void setIdNominaRef(int idNominaRef) {
		this.idNominaRef = idNominaRef;
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

	public Usuario getUsuarios() {
		return usuariosRef;
	}

	public void setUsuarios(Usuario usuariosRef) {
		this.usuariosRef = usuariosRef;
	}
	
	
	
}
